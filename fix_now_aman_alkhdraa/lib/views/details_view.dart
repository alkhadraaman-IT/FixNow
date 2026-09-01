import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/views/provider_profile_view.dart';
import '/views/service_booked_view.dart';

import '../models/services_model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    ServicesModel list = ServicesModel(
      name: 'name',
      rating: 4.8,
      description: 'descriptiondescriptiondescription description',
      price: 50,
      image: 'image',
      id: 1,
    );
    return Scaffold(
      appBar: AppBar(title: Text("FixNow")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 16,
                  children: [
                    SizedBox(height: 16.h),
                    Container(
                      height: 425.h,
                      width: screenWidth.w,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Color(0xffBDC9C9)),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12.r),
                            child: Hero(
                              tag: 'service image ${list.id}',
                              child: Container(
                                height: 267.h,
                                // height: 300,
                                width: screenWidth.w,
                                alignment: .topRight,
                                decoration: BoxDecoration(
                                 //!!!!!!!!!!!!!!!!!!!!!!!!
                                  // image: DecorationImage(
                                  //   image:
                                  //       NetworkImage(list.image) ??
                                  //       AssetImage('assets/image/logo.png'),
                                  //   fit: .fill,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xff006065),
                                        borderRadius: BorderRadius.circular(2.r),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.icecream_outlined,
                                            size: 12,
                                            color: Color(0xffC7FBFF),
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            '${list.name}',
                                            style: TextStyle(
                                              color: Color(0xffC7FBFF),
                                              fontWeight: FontWeight(600),
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'From \$${list.price}',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                                Text(
                                  list.name!,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star),
                                    Text(
                                      list.rating.toString(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                    Text(
                                      '(${list.rating} reviews)',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 206.5.h,
                      // height: 212,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Color(0xffBDC9C9)),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline, size: 16),
                              SizedBox(width: 8.w),
                              Text(
                                'About this service',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Text(
                            list.description!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Read more'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 224.h,
                      // height: 224,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Color(0xffBDC9C9)),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_sharp, size: 16),
                              SizedBox(width: 8.w),
                              Text(
                                'What\'s included',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Expanded(
                            child: ListView.separated(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    Icon(Icons.check_sharp, size: 12),
                                    SizedBox(width: 8.w),
                                    Text(
                                      list.description!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                    return SizedBox(height: 8.h);
                                  },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Select a Provider',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: screenHeight / 3.h,
                      child: ListView.separated(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: (130+40).h,
                            width: screenWidth.w,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Color(0xffBDC9C9)),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProviderProfileView(),
                                        ),
                                      );
                                    },
                                    child: CircleAvatar(
                                      child: Hero(
                                        tag:
                                            'provider profile image ${list.id}',
                                        child: Image.network('${list.image}'),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    '${list.name}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  subtitle: Text(
                                    '${list.name}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star),
                                        Text(
                                          list.rating.toString(),
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                        Text(
                                          '(${list.rating})',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 32.h,
                                      width: 71.97000122070312.w,
                                      child: FilledButton(
                                        onPressed: () {},
                                        child: Text(
                                          'select',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyLarge,
                                        ),
                                      ),
                                    ),
                                  ],
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
            SizedBox(height: 32.h),
            Container(
              height: 85.h,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xffF9F9F8))),
              ),
              width: screenWidth,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Estimated',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '(\$${list.price})',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 154.w,

                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceBookedView(),
                          ),
                        );
                      },
                      child: Text('Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
