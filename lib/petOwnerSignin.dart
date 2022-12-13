import 'package:flutter/material.dart';
import 'main.dart';
import 'signinScreen.dart';
import 'loginScreen.dart';
import 'FirstScreen.dart';


class petOwnerSignin extends StatefulWidget {
  const petOwnerSignin({Key? key}) : super(key: key);

  @override
  State<petOwnerSignin> createState() => _petOwnerSignin();
}

class _petOwnerSignin extends State<petOwnerSignin> {
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
                        "تسجيل مُربي جديد",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.white,
                      ),
                      Text(
                        "الاسم",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: ' ',
                          ),
                        ),
                      ), //name filed
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
                            child: Text("تسجيل المُربي",
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
                      ), //sign in container عدلي النافقيتر
                    ])))));
  }
}