// ignore_for_file: public_member_api_docs, sort_constructors_first
import '/views/login_view.dart';

import '../widgets/show_modal_bottom_sheet_logout.dart';
import '/core/provider/theme_provider.dart';

import '/provider/auth_priveder.dart';
import '/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/repos/user_repo.dart';

class ProfileView extends ConsumerWidget {
  final UserRepo userRepo;
  const ProfileView({super.key, required this.userRepo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    bool switchValue = false;

    var userListener = ref.watch(userProvider);

    // var themeListener = ref.watch(themeProvider);

    ref.listen<AsyncValue<void>>(authPriveder, (previous, next) {
      if (previous?.isLoading == true && next.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }

      if (previous?.isLoading == true && next.hasValue) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginView()),
        );
      }
    });

    return Scaffold(
      body: userListener.when(
        data: (data) => SingleChildScrollView(
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
                        "${data.firstName} ${data.lastName}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        data.email.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 16.h),
                      FilledButton(
                        onPressed: () {},
                        child: Text('Edit Profile'),
                      ),
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
                              SizedBox(width: 16),
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
                              SizedBox(width: 16),
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
                              SizedBox(width: 16),
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
                              SizedBox(width: 16),
                              Text(
                                'Theme',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                          // Switch(
                          //   value: ref.read(themeProvider.notifier.loadTheme()),
                          //   onChanged: (bool newValue) {
                          //     ref.read(themeProvider.notifier.toggleTheme());
                          //     switchValue = newValue;
                          //     print(switchValue);
                          //   },
                          //   activeTrackColor: Color(0xff006065),
                          //   activeThumbColor: Color(0xffBDC9C9),
                          // ),
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
                              SizedBox(width: 16),
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
                              SizedBox(width: 16),
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
                              SizedBox(width: 16),
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
                              SizedBox(width: 16),
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
                              SizedBox(width: 16),
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
                    showModalBottomSheetLogout(context, screenWidth, ref);
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
        error: ((error, stackTrace) => Center(
          child: Column(
            children: [
              Icon(Icons.warning_sharp, size: 40),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        )),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
  