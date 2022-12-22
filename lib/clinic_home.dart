import 'package:flutter/material.dart';

import 'Alert.dart';
import 'FirstScreen.dart';
import 'MyAccount.dart';
import 'clinic_appointments.dart';
import 'clinic_services.dart';

class clinic_home extends StatefulWidget {
  const clinic_home ({Key? key}) : super (key: key);

  @override
  State<clinic_home> createState() => _clinic_homeState();
}

class _clinic_homeState extends State<clinic_home> {

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
        SafeArea(
          child: Column(children: [

            // App Logo
            Container(
                child: const Image(alignment: Alignment.center
                    ,fit: BoxFit.contain
                    ,image: AssetImage("Assets/App_Logo.png"
                    ),
                  width: 130,
                  height: 130,
                )
            )

            //Greetings
            ,Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                //Heading
                Text("! مرحبًا  "
                    ,style:TextStyle(
                      fontFamily: "Elmessiri",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                )
              ],),

            //ClinicName
            Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("  عيادة" //Get Clinic Name From DB
                    ,style:TextStyle(
                      fontFamily: "Almarai",
                      fontSize: 30,
                      color: Color(0xff034D23),
                    )
                )
              ],))
            ,const SizedBox(height: 12)

            //Menu Headings
            ,Container(
              height: 60,
              width: 270,
              decoration: BoxDecoration(
                  color: Color(0xFFC2D961),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xFFC2D963),
                    width: 1,
                  )),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => clinic_services()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFC2D961)),
                      shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Color(0xFFC2D961),
                              )))),
                  child: const Text(" الخدمات المقدمة",
                      style: TextStyle(fontSize: 35, color: Color(0xFF034D23)))),
            )

            ,const SizedBox(height: 15)

            ,Container(
              height: 60,
              width: 270,
              decoration: BoxDecoration(
                  color: Color(0xFFC2D961),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xFFC2D963),
                    width: 1,
                  )),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => clinic_appointments()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFC2D961)),
                      shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Color(0xFFC2D961),
                              )))),
                  child: const Text(" المواعيد المسجلة",
                      style: TextStyle(fontSize: 35, color: Color(0xFF034D23)))),
            )

            ,const SizedBox(height: 15)

            ,Container(
              height: 60,
              width: 270,
              decoration: BoxDecoration(
                  color: Color(0xFFC2D961),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xFFC2D963),
                    width: 1,
                  )),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Alert()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFC2D961)),
                      shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Color(0xFFC2D961),
                              )))),
                  child: const Text(" التنبيهات",
                      style: TextStyle(fontSize: 35, color: Color(0xFF034D23)))),
            )

            ,const SizedBox(height: 15)

            ,Container(
              height: 60,
              width: 270,
              decoration: BoxDecoration(
                  color: Color(0xFFC2D961),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xFFC2D963),
                    width: 1,
                  )),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyAccount()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFC2D961)),
                      shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Color(0xFFC2D961),
                              )))),
                  child: const Text(" حسابي",
                      style: TextStyle(fontSize: 35, color: Color(0xFF034D23)))),
            )

            ,const SizedBox(height: 15)

            ,Container(
              height: 60,
              width: 270,
              decoration: BoxDecoration(
                  color: Color(0xFFC2D961),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xFFC2D963),
                    width: 1,
                  )),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstScreen()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFC2D961)),
                      shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Color(0xFFC2D961),
                              )))),
                  child: const Text(" تواصل معنا",
                      style: TextStyle(fontSize: 35, color: Color(0xFF034D23)))),
            )

            ,const SizedBox(height: 15)

            ,Container(
              height: 60,
              width: 270,
              decoration: BoxDecoration(
                  color: Color(0xFFC2D961),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xFFC2D963),
                    width: 1,
                  )),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstScreen()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFC2D961)),
                      shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Color(0xFFC2D961),
                              )))),
                  child: const Text(" تسجيل الخروج",
                      style: TextStyle(fontSize: 35, color: Color(0xFF034D23)))),
            )

          ],),
        )
    );
  }
}