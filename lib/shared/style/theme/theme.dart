
import 'package:bisho2/shared/style/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightmode = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor:defaultcolor,
  primarySwatch: defaultcolor,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:Colors.white,
        statusBarIconBrightness:Brightness.dark
    ),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultcolor,

  ),
  iconTheme: IconThemeData(
    color: Colors.black
  ),
);