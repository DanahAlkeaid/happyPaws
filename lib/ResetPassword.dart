// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors, unused_element, dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SuccessReset.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  String getEmail() {
    return _emailTextController.text;
  }

  TextEditingController _emailTextController = TextEditingController();
  /*  late EmailAuth emailAuth;
      bool submitValid = false;

 // Initialize the package
     void initState() {
    super.initState();
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );
    
  }*/

  Future<bool> checkIfEmailInUse() async {
    try {
      // Fetch sign-in methods for the email address
      final list = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(_emailTextController.text);

      // In case list is not empty
      if (list.isNotEmpty) {
        return true;
      } else {
        ShowAlert();
        return false;
      }
    } catch (error) {
      ShowAlert();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    void ShowAlert() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            height: 90,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Stack(children: [
              Center(
                child: Column(
                  children: [
                    Text("!خطأ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'ElMessiri'),),
                    Text(
                      "هذا البريد الالكتروني غير مسجل مسبقاً",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              //IconButton(icon:  ,onPressed: ,)
            ]),
          )));
    }

    /*        void sendOtp() async {
   if(await checkIfEmailInUse()){
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailTextController.value.text, otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
      Navigator.push(context, MaterialPageRoute(builder:(context)=> OTP(_emailTextController.text)));
    }}else{
    ShowAlert();
    }
  } */
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Future ResetPass() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailTextController.text.trim())
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SuccessReset()));
        });
      } on FirebaseAuthException catch (e) {
        ShowAlert();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'إعادة تعيين كلمة المرور',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ElMessiri'),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'أدخل البريد الالكتروني المسجل به مسبقاً في هذا التطبيق',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: h * 0.1,
                ),
                Container(
                  padding: EdgeInsets.only(right: 220, bottom: 20),
                  child: Text(
                    'البريد الالكتروني',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Tajawal'),
                  ),
                ),
                Container(
                  width: w * 0.9,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(0, 255, 255, 255),//
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.15))
                      ]),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTextController,
                    validator: MultiValidator([
                      EmailValidator(errorText: 'البريد الالكتروني غير صالح'),
                      RequiredValidator(errorText: 'مطلوب')
                    ]),
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 255, 255, 255),//مراجعة اللون
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFF130160).withOpacity(0.25),
                        ),
                        hintText: 'Example@gmail.com',
                        //label: Text("Email"),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),//مراجعة الالوان
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                SizedBox(
                  height: h * 0.08,
                ),
                SizedBox(
                  width: w * 0.9,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        ResetPass();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFC2D961)),
                          shape: MaterialStateProperty
                              .all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                    color: Color(0xFFC2D961),
                                  )))),
                      child: Text(
                        'إعادة التعيين',
                        style:  TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ShowAlert() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          height: 60,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Stack(children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "خطأ!",
                    style: GoogleFonts.comfortaa(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text("   هذا البريد الالكتروني غير مسجل مسبقاً في التطبيق",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'))
                ],
              ),
            ),
            //IconButton(icon:  ,onPressed: ,)
          ]),
        )));
  }
}
