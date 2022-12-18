import 'package:flutter/material.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignup.dart';
import 'signupScreen.dart';
import 'FirstScreen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffaf7f4),
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/App_Header.png'),
                      fit: BoxFit.fill
                  )
              ),
            ),
            elevation: 0
        ),
        body: Container(
            child: SafeArea(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "إعادة تعيين كلمة المرور",
                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
                          ),
                          Text('ادخل عنوان البريد الإلكتروني', style: TextStyle(fontFamily: 'Tajawal', fontSize: 20, fontWeight: FontWeight.w900))
                        ])))));
  }
}