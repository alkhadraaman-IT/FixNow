import 'dart:async';

import '../widgets/custom_clip_path.dart';
import '../widgets/custom_clip_path_circle_up.dart';
import '/views/onbording_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnbordingView()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.heightOf(context);
    double screenWidth = MediaQuery.widthOf(context);

    return Scaffold(
      backgroundColor: Color(0xff006065),
      body: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          ClipPath(
            clipper:CustomClipPathCircleUp(),
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
