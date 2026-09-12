import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/provider_model.dart';
import '../models/service_model.dart';
import 'package:flutter/material.dart';

import '../widgets/fix_now_app_bar_widget.dart';

class ProviderProfileView extends StatelessWidget {
  const ProviderProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    ServiceModel user = ServiceModel(
      name: 'Ahmad Maintenance',
      rating: 4.8,
      description:
          'Complete heating and air conditioning maintenance featuring comprehensive coil cleaning, eco-friendly refrigerant gas top-up, airflow efficiency calibration, and thorough electrical safety inspections for home comfort.',
      price: 500,
      includes: [
      "Pressure coil washing for indoor/outdoor units",
      "Freon gas level check and refill",
      "Condensate drain line flushing",
      "Compressor load and current testing",
      "Cooling airflow temperature calibration"
    ],
        category: "Appliance Repair",

      image:
          'https://tse2.mm.bing.net/th/id/OIP.Wxp22I7YPiHxMFKHmg6eHgHaHa?r=0&w=626&h=626&rs=1&pid=ImgDetMain&o=7&rm=3',
      id: 1,
      provider: ProviderModel(specialty: "HVAC Systems Specialist", experienceYears: 12),
    );
    return Scaffold(
      // appBar: FixNowAppBarWidget(),//!!!!!!!!!!!
      appBar: AppBar(title: Text('FixNow'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 16.h),
              Container(
                width: screenWidth.w,
                height: 474.h,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Color(0xffBDC9C9)),
                ),
                child: Column(
                  spacing: 16.h,
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Hero(
                          tag: 'provider profile image 1',
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12.r),
                            child: Container(
                              height: 96.h,
                              width: 96.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: Color(0xffE8E8E7)),
                              ),
                              child: Image.network(
                                'https://tse2.mm.bing.net/th/id/OIP.Wxp22I7YPiHxMFKHmg6eHgHaHa?r=0&w=626&h=626&rs=1&pid=ImgDetMain&o=7&rm=3',
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.warning_sharp);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 12.h),
                    Text(
                      '${user.name}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xffE8F5E9),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          Icon(Icons.plumbing, color: Color(0xff2E7D32)),
                          Text(
                            'HVAC Specialist',
                            style: TextStyle(
                              color: Color(0xff2E7D32),
                              fontSize: 12,
                              fontFamily: 'Intre',
                              fontWeight: FontWeight(700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Electrical Specialist',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        SizedBox(
                          // child: Wrap(
                          child: Row(
                            spacing: 24.h,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Icon(Icons.star, size: 30),
                                    Text(
                                      '${user.rating}',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Divider(color: Color(0xffBDC9C9)),
                              ),
                              Text(
                                '12 Jobs Completed',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              SizedBox(
                                child: Divider(color: Color(0xffBDC9C9)),
                              ),
                              // Text(
                              //   '${user.price} Years Exp.',
                              //   style: Theme.of(context).textTheme.labelSmall,
                              // ),
                            ],
                          ),
                        ),
                        Text(
                          '8 Years Exp.',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),

                    SizedBox(
                      width: screenWidth.w,
                      height: 40.h,
                      child: FilledButton(
                        onPressed: () {},
                        child: Text('Book Service'),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth.w,
                      height: 40.h,
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xff006065).withAlpha(10),
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            Icon(Icons.hourglass_bottom, size: 12),
                            Text(
                              'Available today',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight(600),
                                fontFamily: 'Inter',
                                color: Color(0xff006065),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'About ${user.name}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${user.description}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Services Offered',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: screenHeight / 3.h,
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffBDC9C9)),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListTile(
                        title: Text(
                          '${user.category}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          '${user.includes![index]}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: Text(
                          '${user.price}',
                          style: Theme.of(context).textTheme.titleSmall,
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
                height: user.includes!.length.h * 40.h,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F3),
                  border: Border.all(color: Color(0xffBDC9C9)),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Availability',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 8,),
                    Expanded(
                      child: ListView.separated(
                        itemCount: user.includes!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Icon(Icons.check_sharp, size: 12),
                              SizedBox(width: 8.w),
                              Text(
                               user.includes![index],
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 8.h);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Reviews',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(onPressed: () {}, child: Text('View All')),
                ],
              ),
              SizedBox(
                height: screenHeight / 3,
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffBDC9C9)),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Text(
                                '${user.name}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Text(
                                    '${user.provider!.specialty} • ${user.provider!.experienceYears} yrs exp',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 16.h);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
