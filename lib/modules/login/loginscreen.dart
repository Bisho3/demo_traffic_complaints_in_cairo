import 'package:bisho2/layout/homescreen/homescreen.dart';
import 'package:bisho2/modules/register/registerscreen.dart';
import 'package:bisho2/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  bool isshow = true;

  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: FormKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/elmoror.jpg'),
                      height: 120.0,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'تسجيل الدخول',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    textwrite: TextAlign.end,
                    Type: TextInputType.emailAddress,
                    Controller: emailcontroller,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Must Input Your Email';
                      }
                      return null;
                    },
                    pre: Icons.email_outlined,
                    text: 'البريد الالكترونى',
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    textwrite: TextAlign.end,
                    Type: TextInputType.visiblePassword,
                    Controller: passwordcontroller,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Must Input Your Password';
                      }
                      return null;
                    },
                    text: 'كلمة المرور',
                    pre: Icons.lock_outline,
                    suff: isshow
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    isPassword: isshow,
                    suffpressed: () {
                      setState(() {
                        isshow = !isshow;
                      });
                    },
                    onsubmit: (value) {
                      if (FormKey.currentState!.validate()) {
                        if (emailcontroller.text == 'Bisho' &&
                            passwordcontroller.text == 'Bisho123') {
                          navigatorAndRemove(context, const HomeScreen());
                          ShowToast(
                              text: 'Success', state: ToastStates.SUCCESS);
                        }
                      } else {
                        ShowToast(text: 'Faild', state: ToastStates.ERROR);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ConditionalBuilder(
                    condition: true,
                    builder: (context) => defaultButtom(
                      function: () {
                        if (FormKey.currentState!.validate()) {
                          if (emailcontroller.text == 'Bisho' &&
                              passwordcontroller.text == 'Bisho123') {
                            navigatorAndRemove(context, const HomeScreen());
                            ShowToast(
                                text: 'Success', state: ToastStates.SUCCESS);
                          } else {
                            ShowToast(text: 'Faild', state: ToastStates.ERROR);
                          }
                        }
                      },
                      text: 'الدخول',
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultTextButton(
                        function: () {
                          navigatorTo(context, RegisterScreen());
                        },
                        text: 'تسجيل الدخول؟',
                      ),
                      const Text('ليس لديك حساب'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
