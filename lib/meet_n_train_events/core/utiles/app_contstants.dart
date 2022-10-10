import 'package:flutter/material.dart';

class AppConst {
  static const String appName = 'MeetNTrain';
  static const String appVersion = '1.0.0';
  static const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE';
  static const String userId = '8357';


  static double fontSizeM = 13.0;
  static double fontSizeL = 16.0;
  static double radius = 50.0;
  static double mainPadding = 20.0;
  //Shadows
  static dynamic shadow = [
    const BoxShadow(
      color: Colors.black12,
      blurRadius: 20.0,
    )
  ];

  static String handleLargeNumbers(String text, {bool? isMeter}) {
    double num = double.parse(text);
    String result = num.toString();
    if (num >= 1000) {
      if (isMeter == true) {
        result = "${(num / 1000).round()}K";
      } else {
        result = "${(num / 1000)}K";
      }
    } else {
      result = num.round().toString();
    }
    return result;
  }
}
