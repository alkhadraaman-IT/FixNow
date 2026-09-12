import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/models/onbording_model.dart';
import '../repos/auth_repo.dart';
import '../widgets/onbording_widget.dart';
import 'login_view.dart';

class OnbordingView extends ConsumerStatefulWidget {
  const OnbordingView({super.key});

  @override
  ConsumerState<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends ConsumerState<OnbordingView> {
  PageController onbordingController = PageController();
  PageController buttonController = PageController();
  @override
  void dispose() {
    onbordingController.dispose();
    buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);

    int index = 0;
    List<OnbordingModel> onbordingList = [
      OnbordingModel(
        title: 'Book When It Suits You',
        content:
            'Choose your preferred date, time, and location,\nthen let a professional handle the rest.',
        image: 'assets/images/onbording1.png',
        onTap: 'next',
        button: 'NEXT',
        onbordingController: onbordingController,
      ),
      OnbordingModel(
        title: 'Choose With Confidence',
        content:
            'Compare professionals, ratings, reviews,\nservices, and prices before you book.',
        image: 'assets/images/onbording2.png',
        onTap: 'next',
        button: 'NEXT',
        onbordingController: onbordingController,
      ),
      OnbordingModel(
        title: 'Get It Fixed Fast',
        content:
            'Find trusted professionals for all your home\nand maintenance needs.',
        image: 'assets/images/onbording3.png',
        onTap: 'get staeted',
        button: 'GET STARTED',
        onbordingController: onbordingController,
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(
              height: 450.h,
              child: PageView.builder(
                itemCount: onbordingList.length,
                controller: onbordingController,
                scrollDirection: Axis.horizontal,
                reverse: false,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      OnbordingWidget(onbordingModel: onbordingList[index]),
                    ],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: onbordingController,
              count: 3,
              effect: JumpingDotEffect(
                dotHeight: 8,
                dotWidth: 8,
                jumpScale: .7,
                verticalOffset: 15,
                activeDotColor: Color(0xff006065),
                dotColor: Color(0xffBDC9C9),
              ),
            ),
            SizedBox(height: 56.h),
            SizedBox(
              height: 48.h,
              width: screenWidth.w,
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: buttonController,
                itemCount: onbordingList.length,
                itemBuilder: (BuildContext context, int index) {
                  print(index);
                  return FilledButton(
                    onPressed: () async {
                      if (onbordingList[index].button == 'GET STARTED') {
                        // if (index == 2) {
                        await ref.read(authRepoProvider).completeOnboarding();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      }
                      onbordingController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                      buttonController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                      // print(index);
                      // onbordingList[index].onbordingController.animateToPage(
                      //   index,

                      //   duration: Duration(seconds: 1),
                      //   curve: Curves.linear,
                      // );
                    },
                    child: Text(onbordingList[index].button),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
