import '../models/service_model.dart';
import '../widgets/card_cart_widget.dart';
import '../widgets/dialog_no_net_widget.dart';
import '/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartListener = ref.watch(cartProvider);
    print("cartListener:${cartListener.value}");
    double tax = 3.50;
    double serviceFee = 5.00;
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text('Your Cart', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 24.h),
              cartListener.when(
                data: (data) {
                  return Column(
                    children: [
                      SizedBox(
                        height: (330.5 * data.length).h,
                        child: ListView.separated(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            ServiceModel service = data[index];
                            return CardCartWidget(screenWidth: screenWidth, service: service);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 16.h);
                          },
                        ),
                      ),
                      Container(
                        width: screenWidth.w,
                        height: 340.h,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Color(0xffBDC9C9)),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 32.h),
                        padding: EdgeInsets.all(16.h),
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Order Summary',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 16.h),

                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  'Subtotal (${data.length} items)',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(//!!!!!!!!!!!!!!!!!!!!!!!!!
                                  '\$${ref.read(cartProvider.notifier).totalPrice}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),

                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  'Service Fee',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  '\$$serviceFee',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),

                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  'Tax',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  '\$$tax',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Divider(color: Color(0xffBDC9C9)),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                Text(//!!!!!!!!!!!!!!!!!
                                  '\$${ref.read(cartProvider.notifier).totalPrice + tax + serviceFee}',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            SizedBox(height: 34.h),
                            SizedBox(
                              height: 36.h,
                              width: screenWidth.w,
                              child: FilledButton(
                                onPressed: () {},
                                child: Text('Proceed to Checkout'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                error: (Object error, StackTrace stackTrace) {
                  if (error == 'No internet connection') {
                    return DialogErrorNoNet();
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          Icon(Icons.warning_sharp, size: 40),
                          Text(
                            error.toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  }
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

