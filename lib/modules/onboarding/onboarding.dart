import 'package:bisho2/modules/login/loginscreen.dart';
import 'package:bisho2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/style/colors/colors.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});


  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding=
  [
    BoardingModel(
      image: 'assets/images/elmoror.jpg',
      body: 'معا لتسهيل الشكاوى',
      title: 'الأدارة العامة للمرور',
    ),
    BoardingModel(
      image: 'assets/images/elmoror.jpg',
      body: 'دائما في خدماتكم',
      title: 'الأدارة العامة للمرور',
    ),
    BoardingModel(
      image: 'assets/images/elmoror.jpg',
      body: 'لانشاء شكوى مرور',
      title: 'الأدارة العامة للمرور',
    ),
  ];

  void Submit()
  {
    navigatorAndRemove(context, const LoginScreen());
  }

  var pagecontroller= PageController();
  bool islast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButtom(
          function:()
        {
          Submit();
        } ,
          text: 'تخطى'
      ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller:pagecontroller ,
                onPageChanged: (int index)
                {
                  if(index == boarding.length-1)
                  {
                    setState(()
                    {
                      //print('true');
                      islast=true;
                    });
                  }
                  else
                  {
                    setState(()
                    {
                      // print('false');
                      islast=false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder:(context,index)=>BuildinOnBoarding(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pagecontroller,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 12.0,
                    dotHeight: 12.0,
                    dotColor: Colors.grey,
                    spacing: 5.0,
                    expansionFactor: 4,
                    activeDotColor: defaultcolor,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(islast)
                    {
                     Submit();
                    }else
                    {
                      pagecontroller.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildinOnBoarding(BoardingModel model)=>Column(

    children: [
      Expanded(
        child: Image(
          image:AssetImage(model.image,

          ),

        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Text(
        model.title,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      const SizedBox(
        height: 15.0,
      ),
      Text(
        model.body,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
