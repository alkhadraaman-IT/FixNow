import '../models/cart_item_model.dart';
import '/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartListener = ref.watch(cartProvider);
    double price=ref.read(cartProvider.notifier).totalPrice;
    double tax=3.50;
    double serviceFee=5.00;
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
                        height: 330.5*data.length.h,
                        child: ListView.separated(
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            CartItemModel service = data[index];
                            return Container(
                              height: 324.5.h,
                              width: screenWidth.w,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: Color(0xffBDC9C9)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(12.r),
                                      child: Container(
                                        height: 96.h,
                                        width: screenWidth.w,
                                        alignment: .topRight,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              service.serviceModel.image!,
                                            ),
                                            onError: (exception, stackTrace) =>
                                                Icon(Icons.warning_rounded),
                                            fit: .fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),

                                    Row(
                                      mainAxisAlignment: .spaceBetween,
                                      children: [
                                        Text(
                                          'Deep Cleaning',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          '\$${service.serviceModel.price}',
                                          style: TextStyle(
                                            fontWeight: FontWeight(700),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.h),

                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_outline,
                                          size: 12,
                                          color: Color(0xff3E4949),
                                        ),
                                        Text(
                                          'City Plumbers',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.h),

                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.date_range_rounded,
                                              size: 12,
                                              color: Color(0xff3E4949),
                                            ),
                                            Text(
                                              'City Plumbers',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 16.w),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 12,
                                              color: Color(0xff3E4949),
                                            ),
                                            Text(
                                              'City Plumbers',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 32.h),
                                    Row(
                                      mainAxisAlignment: .spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Modify'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  backgroundColor: Color(
                                                    0xffFFFFFF,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusGeometry.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  insetAnimationDuration:
                                                      Duration(seconds: 1),
                                                  insetAnimationCurve:
                                                      Curves.easeOutCubic,

                                                  alignment: Alignment(0, 0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'The service will be deleted',
                                                        style: Theme.of(
                                                          context,
                                                        ).textTheme.bodyMedium,
                                                      ),
                                                      FilledButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                        },
                                                        child: Text('close'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          ref
                                                              .read(
                                                                cartProvider
                                                                    .notifier,
                                                              )
                                                              .removeFromCart(
                                                                itemId: service
                                                                    .serviceModel
                                                                    .id!,
                                                              );
                                                        },
                                                        child: Text('Remove'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            'Remove',
                                            style: TextStyle(
                                              color: Color(0xffBA1A1A),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
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
                                Text(
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
                                Text(
                                  '\$${price+tax+serviceFee}',
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
