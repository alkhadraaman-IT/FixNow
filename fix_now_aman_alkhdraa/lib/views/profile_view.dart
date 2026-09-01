import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    bool switchValue=false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 48.h,
            children: [
              SizedBox(height: 16.h),
              Container(
                width: screenWidth.w,
                height: 274.h,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Color(0xffBDC9C9)),
                ),
                child: Column(
                  crossAxisAlignment: .center,
                  children: [
                    CircleAvatar(),
                    SizedBox(height: 24.h),
                    Text(
                      'name',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'email',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 16.h),
                    FilledButton(onPressed: () {}, child: Text('Edit Profile')),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight / 4 + 45,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffBDC9C9)),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'My Activity',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.book_rounded,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'My Bookings',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0xffBDC9C9),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range_sharp,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'Upcoming Services',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0xffBDC9C9),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'History',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0xffBDC9C9),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.draw_sharp,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'Theme',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Switch(
                          value: switchValue,
                          onChanged: (bool newValue) {
                            //****** كمليييييييييييييييييي ما ساويتي تحديث عبر riverpod
                              switchValue = newValue;
                              print(switchValue);
                            
                          },
                          activeTrackColor: Color(0xff006065),
                          activeThumbColor: Color(0xffBDC9C9),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight / 4 + 30,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffBDC9C9)),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Account',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_outlined,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'Saved Addresses',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0xffBDC9C9),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'Payments',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0xffBDC9C9),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.payment,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'Payments',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0xffBDC9C9),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight / 4 - 30,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffBDC9C9)),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Support',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.help_center_outlined,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'Help Center',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0xffBDC9C9),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.edit_document,
                              color: Color(0xff6E797A),
                              size: 18,
                            ),
                            SizedBox(width: 16,),
                            Text(
                              'Terms',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0xffBDC9C9),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Color(0xffffffff),
                    showDragHandle: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 380, //!================
                        padding: EdgeInsets.all(16),
                        child: Column(
                          spacing: 16,
                          children: [
                            Text(
                              'Logout',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              'Are you sure you want to logout? You\nwill need to enter your credentials again\nto access your account.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: 40.h - 16),
                            SizedBox(
                              width: screenWidth,
                              child: FilledButton(
                                onPressed: () {},
                                child: Text('Logout'),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('Cancel'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Icon(Icons.logout, color: Color(0xffBA1A1A), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xffBA1A1A),
                        fontWeight: FontWeight(600),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
