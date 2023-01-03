import 'package:flutter/material.dart';
import 'package:untitled/clinic_home.dart';
import 'package:untitled/petOwnerHome.dart';
import 'PetOwnerFirstScreen.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignup.dart';
import 'signupScreen.dart';
import 'FirstScreen.dart';
import 'ResetPassword.dart';
import 'petOwnerHome.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';


FirebaseAuth auth = FirebaseAuth.instance;


class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {


  String? ValidateEmpty(value) {
    if (value != null && value.isEmpty) {
      return "يرجى ادخال كلمة المرور";
    } else {
      InputDecoration(
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      );
      return null;
    }
  }

  void Loginbtn() async {
    if (formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(
            email: _emailTextController.text.trim().toLowerCase(),
            password: _passwordTextController.text.trim())
            .then((value) {
          AuthorizeAccess(context);
        });
      } catch (error) {
        setState(() {
          err =true;
        });
      }
    }
  }

  String? validationUser(String? User){
    if (User == null || User.trim().isEmpty) {
      err = false;

      return "هذه الخانة مطلوبة  ";
    }
    String pattern = r'\w+@\w+\.\w+';
    final emailRegExp = RegExp(pattern);
   // final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if( !emailRegExp.hasMatch(User)){
      return 'ىرجى إدخال بريد إلكتروني صحيح';
    }

    if (err) {
      err = false;
      return "كلمة المرور أو عنوان البريد الإلكتروني غير صحيحة";
    }

    return null;
  }

  AuthorizeAccess(BuildContext context) async {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: _emailTextController.text.trim().toLowerCase())
        .get()
        .then((snapshot) {
          print('00000000000000');
          print(snapshot.docs);
          print('00000000000000');
      //var type = (snapshot.data)['userType'];
      if (snapshot.docs[0].data()["type"] == "clinic") {

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => clinic_home()));
      } else {
        if (snapshot.docs[0].data()["type"] == "petOwner") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => petOwnerHome()));
        }

            }

        });
    }


  var loading = false;
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
  String _error = '';
  bool err = false;

    bool _isVisible = false;

    final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0xfffaf7f4),
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/App_Header.png'),
                      fit: BoxFit.fill)),
            ),
            elevation: 0),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height - 50,
                width: double.infinity,
                child: SafeArea(
                    child: Container(
                        child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                      Container(
                        height: 50,
                      ),


                      // Page Title
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "معلومات تسجيل الدخول",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'ElMessiri'),
                        ),
                      ),
                      Container(
                        height: 40,
                      ),


                      //Email Field
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align( alignment : Alignment.centerRight ,
                                    child: Text(
                                      "البريد الإلكتروني",
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, fontFamily: 'Tajawal'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 20,
                                              offset: Offset(1, 1),
                                              color: Colors.grey.withOpacity(0.26))
                                        ]),
                                    child: TextFormField(
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      controller: _emailTextController,
                                      validator: validationUser,
                                      decoration: InputDecoration(
                                          hintText: ("Example@gmail.com"),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                              borderSide:
                                              BorderSide(color: Colors.white)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                              borderSide:
                                              BorderSide(color: Colors.white)),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                      SizedBox(
                        height: 20,
                      ),


                     // Password Title
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "كلمة المرور",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Tajawal'),
                        ),
                      ),


                              //password filed
                              Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  offset: Offset(1, 1),
                                  color: Colors.grey.withOpacity(0.26))
                            ]),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordTextController,
                          validator: ValidateEmpty,
                          obscureText: !_isVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: _isVisible
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "***********",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),


                      //Forget Password
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResetPassword()));
                                },
                                child: Text(
                                  'اضغط هنا ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Tajawal',
                                      color: Colors.blueAccent),
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "نسيت كلمة المرور؟",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Tajawal'),
                              ),
                            ]),
                      ),

                      SizedBox(
                        height: 40,
                      ),


                      //login button
                      Container(
                        child: ElevatedButton(
                            onPressed: () {
                              Loginbtn();
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFC2D961)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          color: Color(0xFFC2D961),
                                        )))),
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Tajawal'),
                            )),
                        height: 50,
                        width: 200,

                      ),
                      SizedBox(
                        height: 20,
                      ),



                              //Dont have account? register now!
                              Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signupScreen()));
                              },
                              child: Text(
                                "سجل الأن!",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Tajawal',
                                ),
                              )),
                          Text(
                            "مستخدم جديد؟ ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Tajawal'),
                          ),
                        ],
                      ),
                    ])))),
          ),
        )
    );
  }
}

