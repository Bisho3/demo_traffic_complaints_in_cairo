import 'package:bisho2/modules/onboarding/onboarding.dart';
import 'package:bisho2/shared/network/local/cashe_helper.dart';
import 'package:bisho2/shared/style/theme/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  bool? onBoarding = CasheHelper.getData(Key: 'onBoarding');
  runApp(MyApp(
    onBoarding: onBoarding,
  ));
}

class MyApp extends StatelessWidget {
  bool? onBoarding;
  MyApp({super.key, this.onBoarding});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightmode,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: OnBoardingScreen(),
      ),
    );
  }
}
