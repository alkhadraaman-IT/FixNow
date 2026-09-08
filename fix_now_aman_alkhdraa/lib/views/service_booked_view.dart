import 'package:fix_now_aman_alkhdraa/provider/cart_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/views/cart_view.dart';
import 'package:flutter/material.dart';

import '../widgets/main_navigation_bar_widget.dart';

class ServiceBookedView extends ConsumerWidget {
  const ServiceBookedView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.watch(cartProvider);
    double screenWidth = MediaQuery.widthOf(context);
    // double screenHeight = MediaQuery.heightOf(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Color(0xffBDC9C9)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Image.asset('assets/images/success_icon.png'),
                SizedBox(height: 24.h),
                Text(
                  'Service Booked',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 24.h),
                Text(
                  'Your professional has been\nconfirmed.',
                  textAlign: .center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 48.h),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9F8),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Color(0xffBDC9C9)),
                  ),
                  child: Column(
                    spacing: 16.h,
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'BOOKING REF',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '#FXN-8472',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        'SERVICE',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Emergency Plumbing',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'PROFESSIONAL',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        mainAxisAlignment: .start,
                        children: [
                          Icon(Icons.percent_outlined),
                          Text(
                            'Michael R.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Text(
                        'DATE & TIME',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Oct 24, 2023 at 2:00 PM',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'ADDRESS',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '123 Main St, Apt 4B',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 48.h),
                SizedBox(
                  width: screenWidth,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartView()),
                      );
                    },
                    child: Text('View Booking'),
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: screenWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainNavigationBarWidget(),
                        ),
                      );
                    },
                    child: Text('Back to Home'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
