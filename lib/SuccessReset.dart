import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'loginScreen.dart';

class SuccessReset extends StatelessWidget {
  const SuccessReset({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
        child: Column(children: [
          SizedBox(
            height: h * 0.07,
          ),
          Text(
            '!تفقد بريدك الالكتروني',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'ElMessiri'),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'لقد أرسلنا تعليمات تغيير كلمة المرور لبريدك الالكتروني',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Tajawal'),
                textAlign: TextAlign.center,
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: w * 0.9,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginScreen()));
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
                  'تسجيل الدخول',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Tajawal'),
                )),
          ),
        ]),
      ),
    );
  }
}
