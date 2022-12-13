import 'package:flutter/material.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';
import 'signinScreen.dart';
import 'loginScreen.dart';
import 'testScreen.dart';


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
      backgroundColor: Colors.white,

      body: Container( decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/screenHeader.png"),
          fit: BoxFit.cover,
        ),
      ), child:
      SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage("Assets/logo1.png"),
            ), //hh
            Text(
              "مرحبًا",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
            ),
            Container(
              height: 20,
              width: 200,
              color: Colors.white,
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginScreen()));
                  },
                  child: Text("تسجيل دخول",
                      style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal')),
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
            ), //login container
            Container(
              height: 20,
              width: 200,
              color: Colors.white,
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signinScreen()));
                  },
                  child: Text("تسجيل جديد",
                      style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal')),
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
            ), //sign in container
            Container(
              height: 30,
              width: 200,
              color: Colors.white,
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => testScreen()));
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