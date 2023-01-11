import 'package:flutter/material.dart';

class ThemeApp {
  static final mainColor = Color(0xff2B76B7);
  static final scaffoldColor = Colors.white;
  static final textColor = Color(0xff4A4A4A);
  static final lightTextColor = Color(0xff9B9B9B);
  static final lightGreen = Color(0xff00D787);
  static final baseUrl = "https://abary.tasawk.net/rest-api/ecommerce/";
  static final light = ThemeData(
      textTheme: TextTheme(
    headline1: TextStyle(
        color: Color(0xff2B76B7),
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'TajwalBold'),
    //---------------------------------------------------
    subtitle1: TextStyle(
        color: Color(0xff4A4A4A),
        fontSize: 18,
        fontWeight: FontWeight.normal,
        fontFamily: 'TajwalRegular'),
    //---------------------------------------------------

    headline2: TextStyle(
        color: Color(0xff2B76B7),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'TajwalBold'),
    //---------------------------------------------------
    subtitle2: TextStyle(
      color: Color(0xff4A4A4A),
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'TajwalMedium',
    ),
    //---------------------------------------------------
    headline3: TextStyle(
        color: Color(0xff2B76B7),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'TajwalBold'),
    //---------------------------------------------------
    headline4: TextStyle(
      color: Color(0xff9B9B9B),
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'TajwalBold',
    ),
    //---------------------------------------------------
    headline5: TextStyle(
        color: Color(0xff9B9B9B),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'TajwalMedium'),
    //---------------------------------------------------
    headline6: TextStyle(
        color: Color(0xff2B76B7),
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'TajwalMedium'),
    //---------------------------------------------------
    // titleSmall: TextStyle(
    //     color: Color(0xff9B9B9B),
    //     fontSize: 14,
    //     fontWeight: FontWeight.w500,
    //     fontFamily: 'TajwalMedium',
    //     decoration: TextDecoration.lineThrough),

    //_________________________________________________________________________
    bodyText1: TextStyle(
        color: Color(0xff9B9B9B),
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: 'TajwalRegular'),
    //---------------------------------------------------
    bodyText2: TextStyle(
        color: Color(0xff9B9B9B),
        fontSize: 13,
        fontWeight: FontWeight.normal,
        fontFamily: 'TajwalRegular'),
  ));
}
