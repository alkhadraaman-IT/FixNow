// import '/core/models/onbording_model.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'onbording_view.dart';

// class Onbording2View extends StatelessWidget {
//   const Onbording2View({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.widthOf(context);
//     List<OnbordingModel> onbordingList = [
//       OnbordingModel(
//         title: 'Choose With Confidence',
//         content:
//             'Compare professionals, ratings, reviews,\nservices, and prices before you book.',
//         image: 'assets/images/onbording.png',
//         onTap: 'next',
//         button: 'NEXT',
//         onbordingController: myController,
//       ),
//     ];
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: .center,
//           mainAxisAlignment: .center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadiusGeometry.circular(12),
//               child: Container(
//                 width: 358,
//                 height: 268,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('${onbordingList[1].image}'),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 32),
//             Text(
//               '${onbordingList[1].title}',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             SizedBox(height: 16),
//             Text(
//               '${onbordingList[1].content}',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             SizedBox(height: 64),
//             SmoothPageIndicator(
//               controller: myController,
//               count: 3,
//               effect: JumpingDotEffect(
//                 dotHeight: 8,
//                 dotWidth: 8,
//                 jumpScale: .7,
//                 verticalOffset: 15,
//                 activeDotColor: Color(0xff006065),
//                 dotColor: Color(0xffBDC9C9),
//               ),
//             ),
//             SizedBox(height: 56),
//             FilledButton(
//               onPressed: () {
//                 print('${onbordingList[1].onTap}');
//                 myController.nextPage(
//                   duration: Duration(seconds: 1),
//                   curve: Curves.linear,
//                 );
//               },
//               style: FilledButton.styleFrom(fixedSize: Size(screenWidth, 48)),
//               child: Text('${onbordingList[1].button}'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
