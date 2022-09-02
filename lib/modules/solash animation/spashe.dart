import 'dart:async';

import 'package:bisho2/layout/homescreen/homescreen.dart';
import 'package:bisho2/modules/spacescreen/spacescreen.dart';
import 'package:bisho2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _startdelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    navigatorAndRemove(context, HomeScreen());
  }

  @override
  void initState() {
    _startdelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Center(
        child: Lottie.asset('assets/images/done.json'),

    ),
    );

  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

