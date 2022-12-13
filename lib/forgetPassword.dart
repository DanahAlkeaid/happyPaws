import 'package:flutter/material.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';
import 'signinScreen.dart';
import 'FirstScreen.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  State<forgetPassword> createState() => _forgetPassword();
}

class _forgetPassword extends State<forgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/screenHeader.png"),
                fit: BoxFit.cover,
              ),
            ),

            child: SafeArea(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "إعادة تعيين كلمة المرور",
                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
                          ),
                          Text('ادخل رقم الهاتف', style: TextStyle(fontFamily: 'Tajawal', fontSize: 20, fontWeight: FontWeight.w900))
                        ])))));
  }
}