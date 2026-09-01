import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/views/search_view.dart';

import '/views/details_view.dart';
import 'package:flutter/material.dart';

import '../models/services_model.dart';
import '../widgets/card_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    List<Map<String, String>> categoriesList = [
      {'name': 'Plumbing', 'icon': 'plumbing'},
      {'name': 'Electrical', 'icon': 'electrical_services'},
      {'name': 'AC Repair', 'icon': 'ac_unit'},
      {'name': 'Cleaning', 'icon': 'cleaning_services'},
    ];
    List<ServicesModel> list = [
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 1,
      ),
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 2,
      ),
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 3,
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 20),
                        Text(
                          'Damascus, Syria',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change',
                      style: TextStyle(
                        color: Color(0xff006065),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchView()),
                  );
                },
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    hint: Text(
                      'What service do you need?',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight(400),
                        color: Color(0xff6B7280),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xffBDC9C9),
                      size: 24,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffBDC9C9)),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff006065)),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 200, 202, 202),
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffBA1A1A)),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              SizedBox(
                height: 149.h,
                width: screenWidth.w,
                child: Card(
                  color: Color(0xffffffff),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Need help now?'),
                        Text('Emergency services available 24/7'),
                        SizedBox(height: 25.h),
                        SizedBox(
                          width: screenWidth.w,
                          height: 40.h,
                          child: FilledButton(
                            onPressed: () {},
                            child: Text('Get Help Now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(onPressed: () {}, child: Text('See All')),
                ],
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 85.h,
                child: ListView(
                  scrollDirection: .horizontal,
                  padding: EdgeInsets.symmetric(horizontal:13),
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 56.h,
                          width: 56.w,
                          decoration: BoxDecoration(
                            color: Color(0xffF3F4F3),
                            border: Border.all(color: Color(0xffBDC9C9)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.plumbing, size: 20),
                        ),
                        SizedBox(height: 8.h,),
                        Text(
                          'Plumbing',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(width: 32.w,),
                    Column(
                      children: [
                        Container(
                          height: 56.h,
                          width: 56.w,
                          decoration: BoxDecoration(
                            color: Color(0xffF3F4F3),
                            border: Border.all(color: Color(0xffBDC9C9)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.electrical_services, size: 20),
                        ),
                        SizedBox(height: 8.h,),
                        Text(
                          'Electrical',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(width:32.w ,),
                    Column(
                      children: [
                        Container(
                          height: 56.h,
                          width: 56.w,
                          decoration: BoxDecoration(
                            color: Color(0xffF3F4F3),
                            border: Border.all(color: Color(0xffBDC9C9)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.ac_unit_rounded, size: 20),
                        ),
                        SizedBox(height: 8.h,),
                        Text(
                          'AC Repair',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    SizedBox(width:32.w ,),
                    Column(
                      children: [
                        Container(
                          height: 56.h,
                          width: 56.w,
                          decoration: BoxDecoration(
                            color: Color(0xffF3F4F3),
                            border: Border.all(color: Color(0xffBDC9C9)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(Icons.cleaning_services, size: 20),
                        ),
                        SizedBox(height: 8.h,),
                        Text(
                          'Cleaning',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                // child: ListView.separated(
                //   scrollDirection: .horizontal,
                //   itemBuilder: (BuildContext context, int index) {
                //     return Column(
                //       children: [
                //         Container(
                //           height: 56.h,
                //           width: 56.w,
                //           decoration: BoxDecoration(
                //             color: Color(0xffF3F4F3),
                //             border: Border.all(color: Color(0xffBDC9C9)),
                //             borderRadius: BorderRadius.circular(12.r),
                //           ),
                //           child: Icon(Icons.categoriesList[index]['icon'], size: 20),
                //         ),
                //         Text(
                //           categoriesList[index]['name'].toString(),
                //           style: Theme.of(context).textTheme.bodyLarge,
                //         ),
                //       ],
                //     );
                //   },
                //   separatorBuilder: (BuildContext context, int index) {
                //     return SizedBox(width: 24.w);
                //   },
                //   itemCount: 3,
                // ),
              ),
              SizedBox(height: 48.h),
              Text(
                'Popular Services',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 332.h,
                child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsView(),
                          ),
                        );
                      },
                      child: Container(
                        height: 312.5.h,
                        width: 240.w,
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
                                tag: 'service image ${list[1].id}',
                                child: Container(
                                  height: 178.5.h,
                                  width: 240.w,
                                  alignment: .topRight,
                                  decoration: BoxDecoration(
                                   //!!!!!!!!!!!!!!!
                                    // image: DecorationImage(
                                    //   image:
                                    //       NetworkImage(list[1].image) ??
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
                                children: [
                                  Wrap(
                                    // mainAxisAlignment: .spaceBetween,
                                    children: [
                                      Text(
                                        list[1].name!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Icon(Icons.star),
                                          Text(
                                            '${list[1].rating}(${list[1].rating}+)',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 24.h),
                                  Row(
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '\$${list[1].price}',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelLarge,
                                            ),
                                            TextSpan(
                                              text: '/hr',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 16.w);
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
