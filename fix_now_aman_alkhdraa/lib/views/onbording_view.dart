import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../core/models/onbording_model.dart';
import '../widgets/onbording_widget.dart';
import 'login_view.dart';
import 'onbording1_view.dart';
import 'onbording2_view.dart';
import 'onbording3_view.dart';

PageController myController = PageController();

class OnbordingView extends StatelessWidget {
  const OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnbordingModel> onbordingList = [
      OnbordingModel(
        title: 'Book When It Suits You',
        content:
            'Choose your preferred date, time, and location,\nthen let a professional handle the rest.',
        image: 'assets/images/onbording1.png',
        onTap: 'next',
        button: 'NEXT',
        onbordingController: myController,
      ),
      OnbordingModel(
        title: 'Choose With Confidence',
        content:
            'Compare professionals, ratings, reviews,\nservices, and prices before you book.',
        image: 'assets/images/onbording2.png',
        onTap: 'next',
        button: 'NEXT',
        onbordingController: myController,
      ),
      OnbordingModel(
        title: 'Get It Fixed Fast',
        content:
            'Find trusted professionals for all your home\nand maintenance needs.',
        image: 'assets/images/onbording3.png',
        onTap: 'get staeted',
        button: 'GET STARTED',
        onbordingController: myController,
      ),
    ];
    // String index = myController.toString();
    // int indexList =int.parse(myController);
    return Scaffold(
      body: PageView(
        controller: myController,
        scrollDirection: Axis.horizontal,
        reverse: false,
        physics: NeverScrollableScrollPhysics(),
        children: [
          // OnbordingWidget(onbordingModel: onbordingList[0]),
          OnbordingWidget(onbordingModel: onbordingList[0]),
          OnbordingWidget(onbordingModel: onbordingList[1]),
          OnbordingWidget(onbordingModel: onbordingList[2]),
          // LoginView(),
        ],
      ),
    );
  }
}
