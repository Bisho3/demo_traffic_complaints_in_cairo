import 'package:bisho2/shared/style/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigatorAndRemove(context,Widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context)=>Widget),
        (route) => false
);

Widget defaultTextButtom({
  required Function function,
  required String text,
})=>TextButton(
    onPressed: ()
    {
      function();
    },
    child: Text(
      text.toUpperCase(),
    ),
);

Widget defaultFormField(
    {
      required TextInputType Type,
      required TextEditingController Controller,
      Function? onsubmit,
      Function? onTap,
      required  String ?Function(String ?val ) validate  ,
      required String text,
       IconData? pre ,
      bool isPassword =false,
      IconData? suff ,
      Function? suffpressed,
      Function? onchange,
      required TextAlign textwrite,

    })
=>Directionality(
  textDirection: TextDirection.rtl,
  child:   TextFormField(
    textAlign: textwrite,
    keyboardType: Type,
    controller:Controller,
    onFieldSubmitted:(String value)
    {
      onsubmit!(value);
    },
      onTap:()
      {
        onTap!();
      },
    validator: (value)
    {
      return validate(value);
    },
    obscureText:isPassword ,
    decoration: InputDecoration(

      label: Text(text,),
      prefixIcon:Icon(pre) ,
      suffixIcon:suff != null ? IconButton(
          icon: Icon(suff,),
          onPressed:() {
            suffpressed!();
          }) :null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0,),),

    ),

  ),
);

Widget defaultButtom(
    {
      double? width= double.infinity,
      Color? background=defaultcolor,
      required Function function,
      required String text,
      bool isUpperCase = true,
    })=> Container(
  width: width,

  decoration: BoxDecoration(color:background,
    borderRadius: BorderRadius.circular(30.0,),
  ),

  child: MaterialButton(
    onPressed: ()
    {
      function();
    },
    child: Text(isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);


void ShowToast({
  required String text,
  required ToastStates state,
})
{
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor:ChooseToatsolor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
enum ToastStates{SUCCESS,ERROR,WARMIMG}

Color ChooseToatsolor(ToastStates state)

{
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color= Colors.green;
      break;
    case ToastStates.ERROR:
      color= Colors.red;
      break;
    case ToastStates.WARMIMG:
      color= Colors.amber;
      break;
  }
  return color;
}

void navigatorTo(context,Widget)=> Navigator.push(context,
  MaterialPageRoute(builder: (context)=>Widget),
);

Widget defaultTextButton({
  required Function function,
  required String text,
})=> TextButton(

  onPressed: ()

  {

    function();

  },

  child: Text(text.toUpperCase(),

  ),

);


