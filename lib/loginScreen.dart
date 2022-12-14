import 'package:flutter/material.dart';
import 'package:untitled/petOwnerHome.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';
import 'signinScreen.dart';
import 'FirstScreen.dart';
import 'ForgetPassword.dart';
import 'petOwnerHome.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
        body: Container(
            child: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "معلومات تسجيل الدخول",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
                      ),
                      Container(
                        height: 40,

                      ),

                      Text(
                        "رقم الهاتف",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Tajawal'),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: '+9665********',
                          ),
                        ),
                      ), //phone number filed
                      Container(
                        height: 20,

                      ),
                      Text(
                        "كلمة المرور",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Tajawal'),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: '**********',
                          ),
                        ),
                      ), //password filed
                      Container(
                        height: 10,
                      ),

                     Container(child: Row(mainAxisAlignment: MainAxisAlignment.center, children:[
                       GestureDetector(
                         onTap: () {    Navigator.push(context,
                             MaterialPageRoute(builder: (context) => ForgetPassword()));   },
                         child: Text( 'اضغط هنا ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900,fontFamily: 'Tajawal', color: Colors.blueAccent),),
                       ),
                Container(height: 10,)
                ,
                       Text(
                         "نسيت كلمة المرور؟",
                         style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900,fontFamily: 'Tajawal'),
                       ),



                     ]),),


                      Container(
                        height: 55,
                      ),

                      Container(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => petOwnerHome()));
                            },
                            child: Text("تسجيل الدخول",
                                style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: 'Tajawal')),
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
                    ])))));
  }
}
