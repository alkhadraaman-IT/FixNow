import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../provider/auth_priveder.dart';

Future<dynamic> showModalBottomSheetLogout(BuildContext context, double screenWidth, WidgetRef ref) {
    return showModalBottomSheet(
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
                                onPressed: () {
                                  ref.read(authPriveder.notifier).logout();
                                },
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
  }

