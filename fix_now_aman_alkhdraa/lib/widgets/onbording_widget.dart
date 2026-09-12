import '../provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repos/auth_repo.dart';
import '/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/models/onbording_model.dart';

class OnbordingWidget extends ConsumerStatefulWidget {
  final OnbordingModel onbordingModel;
  const OnbordingWidget({super.key, required this.onbordingModel});

  @override
  ConsumerState<OnbordingWidget> createState() => _OnbordingWidgetState();
}

class _OnbordingWidgetState extends ConsumerState<OnbordingWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);
    return Column(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(12.r),
          child: Container(
            width: 358.w,
            height: 268.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.onbordingModel.image),
                fit: .cover
              ),
            ),
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          widget.onbordingModel.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16.h),
        Text(
          widget.onbordingModel.content,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 32.h),
        // SmoothPageIndicator(
        //   controller: widget.onbordingModel.onbordingController,
        //   count: 3,
        //   effect: JumpingDotEffect(
        //     dotHeight: 8,
        //     dotWidth: 8,
        //     jumpScale: .7,
        //     verticalOffset: 15,
        //     activeDotColor: Color(0xff006065),
        //     dotColor: Color(0xffBDC9C9),
        //   ),
        // ),
        // SizedBox(height: 56.h),
        // FilledButton(
        //   onPressed: () async {
        //     if (widget.onbordingModel.button == 'GET STARTED') {
        //       await ref.read(authRepoProvider).completeOnboarding();
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => LoginView()),
        //       );
        //     }
        //     widget.onbordingModel.onbordingController.nextPage(
        //       duration: Duration(seconds: 1),
        //       curve: Curves.linear,
        //     );
        //   },
        //   style: FilledButton.styleFrom(fixedSize: Size(screenWidth.w, 48.h)),
        //   child: Text(widget.onbordingModel.button),
        // ),
      ],
    );
  }
}
