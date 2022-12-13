import 'package:flutter/material.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';
import 'signinScreen.dart';
import 'FirstScreen.dart';


void main() {
  runApp(const HappyPaws());
}

class HappyPaws extends StatelessWidget {
  const HappyPaws ({Key? key}) : super (key: key);

  @override
<<<<<<< HEAD
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('Assets/header2.png', fit: BoxFit.fill),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage("Assets/logo1.png"),
            ), //hhhh
            Text(
              "مرحبًا",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
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
                      style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'fonts/Tajawal-Regular.ttf')),
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
                      style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'fonts/Tajawal-Regular.ttf')),
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
          ]),
        ),
      ),
=======
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // Start running the application from the start page
      home: FirstScreen(),
>>>>>>> f589f6bc0dc147f5b37e721ee80b0d7afc717b58
    );

  }
}









