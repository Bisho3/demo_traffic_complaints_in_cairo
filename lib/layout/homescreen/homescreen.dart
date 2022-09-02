import 'package:bisho2/modules/spacescreen/spacescreen.dart';
import 'package:bisho2/shared/components/components.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white,
          child: Image(
            image: AssetImage('assets/images/elmoror.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          Text(
            'الأدارة العامة'
            ' للمرور',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 120.0,
            ),
            defaultButtom(
              function: () {
                navigatorTo(context, const SpaceScreen());
              },
              text: 'أضافة شكوى',
            ),
            const SizedBox(
              height: 30.0,
            ),
            defaultButtom(
                function: () {
                  ShowToast(text: 'Not Found', state: ToastStates.ERROR);
                },
                text: 'مراجعة شكوى'),
          ],
        ),
      ),
    );
  }
}
