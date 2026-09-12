import 'dart:async';

import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/provider/user_session_provider.dart';
import '/views/login_view.dart';
import '/widgets/main_navigation_bar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/custom_clip_path.dart';
import '../widgets/custom_clip_path_circle_up.dart';
import '/views/onbording_view.dart';
import 'package:flutter/material.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    // Timer(Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => OnbordingView()),
    //   );
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(userSessionProvider, (previous, next) {
      var userSessionListener = ref.watch(userSessionProvider);
      print('userSessionListener:${userSessionListener.value}');
      Timer(Duration(seconds: 3), (){
        next.when(
        data: (data) {
          if (previous!.isLoading && next.hasValue) {
            if (userSessionListener.value!.isviewOnboarding == false) {
              print('isviewOnboarding == false');
              // return OnbordingView();
              //  Timer(Duration(seconds: 3), () {
              //   Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(builder: (context) => OnbordingView()),
              //   );
              // });
             
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OnbordingView()),
              );
            } else if (userSessionListener.value!.authenticated == false) {
              print('authenticated == false');
              // Timer(Duration(seconds: 3), () {
              //   Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(builder: (context) => LoginView()),
              //   );
              // });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );

              // return LoginView();
            } else {
              print('authenticated == true');
              // return MainNavigationBarWidget();
              // Timer(Duration(seconds: 3), () {
              //   Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(builder: (context) => MainNavigationBarWidget()),
              //   );
              // });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainNavigationBarWidget(),
                ),
              );
            }
          }
        },
        error: (Object error, StackTrace stackTrace) {
          print('error :Exit the app');

          return Dialog(
            child: Column(
              spacing: 20.h,
              children: [
                Text('An error occurred'),
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await FlutterExitApp.exitApp();
                      },
                      child: Text('Exit the app'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () {
          print('SplashView');

          return SplashView();
        },
      );
      });
    });

    // ref.watch(userSessionProvider);
    // ref.listen<AsyncValue<void>>(userSessionProvider, (previous, next) {
    //   if (previous!.isLoading && next.hasValue) {
    //     if (userSessionProvider.isCompleteOnboarding == false) {
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => OnbordingView()),
    //       );
    //     } else if (isCompleteOnboarding == true && authenticated == false) {
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => LoginView()),
    //       );
    //     } else if (isCompleteOnboarding == true && authenticated == true) {
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => MainNavigationBarWidget()),
    //       );
    //     }
    //   }
    // });

    double screenHeight = MediaQuery.heightOf(context);
    double screenWidth = MediaQuery.widthOf(context);

    return Scaffold(
      backgroundColor: Color(0xff006065),
      body: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          ClipPath(
            clipper: CustomClipPathCircleUp(),
            child: Container(
              height: MediaQuery.heightOf(context) / 4,
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff),
                boxShadow: [
                  BoxShadow(color: Color(0xff006065), blurRadius: 64),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('assets/images/logo.png'),
          Text(
            'FixNow',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 40,
              fontWeight: FontWeight(700),
              color: Color(0xffffffff),
            ),
          ),
          Text(
            'Professional help, instantly.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight(400),
              color: Color(0xff7DD4DB),
            ),
          ),
          Spacer(),
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: screenHeight / 4,
              width: screenWidth,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffFE762A).withAlpha(64),
                    blurRadius: 64,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
