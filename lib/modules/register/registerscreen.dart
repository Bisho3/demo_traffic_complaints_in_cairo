import 'dart:io';

import 'package:bisho2/layout/homescreen/homescreen.dart';
import 'package:bisho2/shared/components/components.dart';
import 'package:bisho2/shared/style/colors/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _load = false;
  late File imgFile;
  final imgPicker = ImagePicker();

  Widget displayImage() {
    if (imgFile == null) {
      return const Text('No Image Selected');
    } else {
      return Image.file(
        imgFile,
        width: 350,
        height: 350,
      );
    }
  }

  void openCamara() async {
    var imgCamara = await imgPicker.pickImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamara!.path);
      _load = true;
    });
    Navigator.pop(context);
  }

  void openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery!.path);
      _load = true;
    });
    Navigator.pop(context);
  }

  Future<void> showOptionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Expanded(
            child: AlertDialog(
              title: const Text('Options'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: const Text(
                        'Capture Image From Camara',
                      ),
                      onTap: () {
                        openCamara();
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    GestureDetector(
                      child: const Text(
                        'Capture Image From Gallery',
                      ),
                      onTap: () {
                        openGallery();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  var namecontroller = TextEditingController();

  var addresscontroller = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  var passwordcontroller = TextEditingController();

  var supportpasswordcontroller = TextEditingController();

  bool isshow1 = true;
  bool isshow2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white,
          child: Image(
            image: AssetImage('assets/images/elmoror.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        actions: const [
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
      body: Form(
        key: FormKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    ':رقم البطاقة',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  PinCodeTextField(
                    length: 14,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      print(value);
                    },
                    appContext: context,
                    onCompleted: (value) {
                      if (value == '12345678912345') {
                        print('valid pin');
                      } else {
                        print('invalid pin');
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 25,
                      fieldWidth: 20,
                      inactiveColor: Colors.grey,
                      activeColor: defaultcolor,
                      selectedColor: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  defaultFormField(
                    textwrite: TextAlign.end,
                    Type: TextInputType.text,
                    Controller: namecontroller,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Must Input Your Name';
                      }
                      return null;
                    },
                    text: 'اسم المستخدم',
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  defaultFormField(
                    textwrite: TextAlign.end,
                    Type: TextInputType.text,
                    Controller: addresscontroller,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Must Input Your Address';
                      }
                      return null;
                    },
                    text: 'العنوان',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    ':نمرة العربية ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  PinCodeTextField(
                    length: 7,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      print(value);
                    },
                    appContext: context,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 30,
                      fieldWidth: 30,
                      inactiveColor: Colors.grey,
                      activeColor: defaultcolor,
                      selectedColor: Colors.green,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        const Text(
                          'صورة الرخصة',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 15.0),
                        Column(
                          children: [
                            _load ? displayImage() : const SizedBox(),
                            ElevatedButton(
                              child: const Text('Select Your Image'),
                              onPressed: () {
                                showOptionDialog(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    textwrite: TextAlign.end,
                    Type: TextInputType.visiblePassword,
                    Controller: passwordcontroller,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Must Input  Password';
                      }
                      return null;
                    },
                    text: 'كلمة السر',
                    pre: Icons.lock_outline,
                    suff: isshow1
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    isPassword: isshow1,
                    suffpressed: () {
                      setState(() {
                        isshow1 = !isshow1;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                    textwrite: TextAlign.end,
                    Type: TextInputType.visiblePassword,
                    Controller: supportpasswordcontroller,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Must Input confirm password';
                      }
                      return null;
                    },
                    text: 'تاكيد كلمة السر',
                    pre: Icons.lock_outline,
                    suff: isshow2
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    isPassword: isshow2,
                    suffpressed: () {
                      setState(() {
                        isshow2 = !isshow2;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ConditionalBuilder(
                    condition: true,
                    builder: (context) => defaultButtom(
                      function: () {
                        if (FormKey.currentState!.validate()) {
                          if (namecontroller.text == 'Bisho' &&
                              passwordcontroller.text == 'Bisho123') {
                            navigatorAndRemove(context, const HomeScreen());
                            ShowToast(
                                text: 'Account Created ',
                                state: ToastStates.SUCCESS);
                          } else {
                            ShowToast(text: 'Faild', state: ToastStates.ERROR);
                          }
                        }
                      },
                      text: 'انشاء',
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
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
