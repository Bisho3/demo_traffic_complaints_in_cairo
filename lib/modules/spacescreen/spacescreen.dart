// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:bisho2/modules/solash%20animation/spashe.dart';
import 'package:bisho2/shared/components/components.dart';
import 'package:bisho2/shared/style/colors/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SpaceScreen extends StatefulWidget {
  const SpaceScreen({Key? key}) : super(key: key);

  @override
  State<SpaceScreen> createState() => _ScreenState();
}

class _ScreenState extends State<SpaceScreen> {
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
          return AlertDialog(
            title: Text('Options'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Capture Image From Camara',
                    ),
                    onTap: () {
                      openCamara();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  GestureDetector(
                    child: Text(
                      'Capture Image From Gallery',
                    ),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  var placeController = TextEditingController();
  var timeController = TextEditingController();
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      backgroundColor: Colors.white,
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      const Text(
                        'صورة الحادث',
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
                  height: 15.0,
                ),
                defaultFormField(
                  textwrite: TextAlign.start,
                  Type: TextInputType.text,
                  Controller: placeController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Must Input Your Name';
                    }
                    return null;
                  },
                  text: 'مكان الحادث',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  ':نمرة العربية المتسببة للحادث ',
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
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  'وقت الحادث ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultFormField(
                  Type: TextInputType.datetime,
                  Controller: timeController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Must Input Your Name';
                    }
                    return null;
                  },
                  text: 'الوقت',
                  textwrite: TextAlign.start,
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      timeController.text = value!.format(context).toString();
                      print(value.format(context));
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
                        if (placeController.text == 'شارع شبرا') {
                          navigatorTo(context, const SplashScreen());
                          ShowToast(
                              text: 'تم بنجاح ', state: ToastStates.SUCCESS);
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
    );
  }
}
