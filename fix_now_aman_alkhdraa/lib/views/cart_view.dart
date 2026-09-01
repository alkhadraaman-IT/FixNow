import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    int numberServices = 2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text('Your Cart', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 24.h),
              SizedBox(
                height: 500.h,
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
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
                              borderRadius: BorderRadiusGeometry.circular(12.r),
                              child: Container(
                                height: 96.h,
                                width: screenWidth.w,
                                alignment: .topRight,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://tse1.mm.bing.net/th/id/OIP.PKlD9uuBX0m4S8cViqXZHAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
                                    ),
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
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  '\$455',
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
                                  style: Theme.of(context).textTheme.bodyMedium,
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
                                  onPressed: () {},
                                  child: Text(
                                    'Remove',
                                    style: TextStyle(color: Color(0xffBA1A1A)),
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
                          'Subtotal ($numberServices items)',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '\$$numberServices',
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
                          '\$$numberServices',
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
                          '\$$numberServices',
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
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '\$$numberServices',
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
          ),
        ),
      ),
    );
  }
}
