// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../core/models/onbording_model.dart';
// import '/views/onbording_view.dart';

// class Onbording1View extends StatefulWidget {
//   final OnbordingModel onbordingModel;
//   const Onbording1View({super.key, required this.onbordingModel});

//   @override
//   State<Onbording1View> createState() => _Onbording1ViewState();
// }

// class _Onbording1ViewState extends State<Onbording1View> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.widthOf(context);
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         crossAxisAlignment: .center,
//         mainAxisAlignment: .center,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadiusGeometry.circular(12),
//             child: Container(
//               width: 358,
//               height: 268,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(widget.onbordingModel.image),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 32),
//           Text(
//             widget.onbordingModel.title,
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           SizedBox(height: 16),
//           Text(
//             widget.onbordingModel.content,
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.bodyMedium,
//           ),
//           SizedBox(height: 64),
//           SmoothPageIndicator(
//             controller: widget.onbordingModel.onbordingController,
//             count: 3,
//             effect: JumpingDotEffect(
//               dotHeight: 8,
//               dotWidth: 8,
//               jumpScale: .7,
//               verticalOffset: 15,
//               activeDotColor: Color(0xff006065),
//               dotColor: Color(0xffBDC9C9),
//             ),
//           ),
//           SizedBox(height: 56),
//           FilledButton(
//             onPressed: () {
//               print(widget.onbordingModel.onTap);
//               widget.onbordingModel.onbordingController.nextPage(
//                 duration: Duration(seconds: 1),
//                 curve: Curves.linear,
//               );
//             },
//             style: FilledButton.styleFrom(fixedSize: Size(screenWidth, 48)),
//             child: Text(widget.onbordingModel.button),
//           ),
//         ],
//       ),
//     );
//   }
// }
