import 'package:flutter/material.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';
import 'signinScreen.dart';


void main() {
  runApp(MaterialApp(home: FirstScreen()));
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
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
            ),
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
    );
  }
}

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Text(
                "معلومات تسجيل الدخول",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
              Text(
                "رقم الهاتف",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '+9665********',
                  ),
                ),
              ), //phone number filed
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
              Text(
                "كلمة المرور",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '**********',
                  ),
                ),
              ), //password filed
              Text(
                "نسيت كلمة المرور؟",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
              ),
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ), //forget password
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
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
                              builder: (context) => loginScreen()));
                    },
                    child: Text("تسجيل الدخول",
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
              ), //login container عدلي النافقيتر
            ]))));
  }
}





