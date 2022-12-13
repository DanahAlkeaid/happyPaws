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
  bool isEightChar = false;
  bool hasUpperChar = false;
  bool _isVisible = false;

  onPasswordChanged(String password) {
    final CharRange = RegExp(r'[A-Z]');
    setState(() {
      isEightChar = false;
      if (password.length >= 8) isEightChar = true;

      hasUpperChar = false;
      if (CharRange.hasMatch(password)) hasUpperChar = true;
    });
  }

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
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
                      ),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.white,
                      ),
                      Text(
                        "الاسم",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, fontFamily: 'Tajawal'),
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
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, fontFamily: 'Tajawal'),
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
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, fontFamily: 'Tajawal'),
                      ),
                       Column (children: [
                        Container(
                          height: 20,
                        ),

                        TextField(
                          onChanged: (password) => onPasswordChanged(password),
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: "***********",
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          ),
                        ), //password field
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: isEightChar ? Colors.green : Colors.transparent,
                                  border: isEightChar
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("تحتوي على 8 حروف أو أرقام")
                          ],
                        ),  //has 8 characters
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: hasUpperChar ? Colors.green : Colors.transparent,
                                  border: hasUpperChar
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("تحتوي على حرف كبير واحد على الأقل")
                          ],
                        ), // has one upper case
                      ],)//password filed
                      ,
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
                      ), //sign in container عدلي النافقيتر
                    ])))));
  }
}