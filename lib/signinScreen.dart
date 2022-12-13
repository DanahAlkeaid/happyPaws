import 'package:flutter/material.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';

class signinScreen extends StatefulWidget {
  const signinScreen({Key? key}) : super(key: key);

  @override
  State<signinScreen> createState() => _signinScreen();
}

class _signinScreen extends State<signinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Picture1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
                child: Column(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); //action coe when button is pressed
                    },
                    icon: Icon(Icons.send),
                  ),
                  Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "! أهلًا بك ",
                              style:
                              TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                            Container(
                              height: 20,
                              width: 200,
                              color: Colors.white,
                            ),
                            Text(
                              "هل أنت؟",
                              style:
                              TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
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
                                            builder: (context) => petOwnerSignin()));
                                  },
                                  child: Text("مُربي",
                                      style:
                                      TextStyle(fontSize: 20, color: Colors.black)),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color(0xFFC2D961)))),
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Color(0xFFC2D961),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Color(0xFFC2D963),
                                    width: 5,
                                  )),
                            ), //مربي container
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
                                            builder: (context) => clinicsign()));
                                  },
                                  child: Text("عيادة ",
                                      style:
                                      TextStyle(fontSize: 20, color: Colors.black)),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color(0xFFC2D961)))),
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Color(0xFFC2D961),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Color(0xFFC2D963),
                                    width: 5,
                                  )),
                            ), //عيادة container عدلي النافقيتر
                          ]))
                ]))));
  }
}