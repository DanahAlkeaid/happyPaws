import 'package:flutter/material.dart';
import 'clinicsign.dart';
import 'petOwnerSignup.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  State<signupScreen> createState() => _signupScreen();
}

class _signupScreen extends State<signupScreen> {
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
        body:
        Container(
           /* decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/bg.png"),
                fit: BoxFit.cover,
              ),
            ),*/

            child: SafeArea(
                child: Column(children: [

                  Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 150,
                            ),
                            Text(
                              "! أهلًا بك ",
                              style:
                              TextStyle(fontSize: 50, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
                            ),
                            Container(
                              height: 20,
                            ),
                            Text(
                              "هل أنت؟",
                              style:
                              TextStyle(fontSize: 30, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
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
                                            builder: (context) => petOwnerSignup()));
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
                                    'مُربي',
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
                            ), //مربي container
                            Container(
                              height: 20,

                            ),

                            Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => clinicsign()));
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
                                    'عيادة',
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
                            ), //عيادة container عدلي النافقيتر
                          ]))
                ]))));
  }
}