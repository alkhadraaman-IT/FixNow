import 'package:flutter/material.dart';

class OnbordingModel {
  String title;
  String content;
  String image;
  String button;
  String onTap;
  PageController onbordingController;
  OnbordingModel({
    required this.title,
    required this.content,
    required this.image,
    required this.button,
    required this.onTap,
    required this.onbordingController,
  });
}
