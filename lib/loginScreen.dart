import 'package:flutter/material.dart';
import 'package:untitled/petOwnerHome.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignup.dart';
import 'signupScreen.dart';
import 'FirstScreen.dart';
import 'ForgetPassword.dart';
import 'petOwnerHome.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
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
          key: _formKey,
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
                      Container(
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
                        child: TextField(
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
                                              ForgetPassword()));
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => petOwnerHome()));
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
                        /*decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 5,
                    )),*/
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
        ));
  }
}
