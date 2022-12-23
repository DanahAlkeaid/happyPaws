import 'package:flutter/material.dart';
import 'package:untitled/ChangeInfo.dart';
import 'package:untitled/appointment_confirmed.dart';
import 'package:untitled/appointment_failed.dart';
import 'package:untitled/petOwnerHome.dart';
import 'main.dart';
import 'signupScreen.dart';
import 'loginScreen.dart';
import 'testScreen.dart';
import 'petOwnerSignup.dart';
import 'service_details.dart';
import 'petOwnerHome.dart';
import 'clinic_home.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
//dalia
class _FirstScreenState extends State<FirstScreen> {
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
      body: Container(  child:
      SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image( width: 300,
              image: AssetImage("Assets/HPlogo.png"),
            ), //hh
            Text(
              "مرحبًا",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
            ),
            Container(
              height: 20,

            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => loginScreen()));
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
                    'تسجيل دخول',
                    style:  TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
                  )),
              height: 50,
              width: 200,
             /* decoration: BoxDecoration(
                  color: Color(0xFFC2D961),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFFC2D963),
                    width: 5,
                  )),*/
            ), //login container
            Container(
              height: 20,

            ),
               Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signupScreen()));
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
                    'تسجيل جديد',
                    style:  TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
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
            ), //sign in container
            Container(
              height: 30,

            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                         builder: (context) => clinic_home()));
                  },
                  child: Text(" test screen",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Color(0xFFC2D961)))),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Color(0xFFC2D961),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFFC2D963),
                    width: 5,
                  )),
            ),
          ]),
        ),
      ),
      )
    );
  }
}