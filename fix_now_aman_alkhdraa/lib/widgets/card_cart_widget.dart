import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/service_model.dart';
import '../provider/cart_provider.dart';

class CardCartWidget extends ConsumerWidget {
  const CardCartWidget({
    super.key,
    required this.screenWidth,
    required this.service,
  });

  final double screenWidth;
  final ServiceModel service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    image: NetworkImage(service.image!),
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
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '\$${service.price}',
                  style: TextStyle(fontWeight: FontWeight(700), fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            Row(
              children: [
                Icon(Icons.person_outline, size: 12, color: Color(0xff3E4949)),
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
                      style: Theme.of(context).textTheme.bodyMedium,
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
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Modify')),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: .min,
                              spacing: 20.h,
                              children: [
                                Text(
                                  'The service will be deleted',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('close'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        ref
                                            .read(cartProvider.notifier)
                                            .removeFromCart(itemId: service.id!);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Remove',style: TextStyle(color: Color(0xffBA1A1A),fontSize: 16),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(color: Color(0xffBA1A1A),fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
