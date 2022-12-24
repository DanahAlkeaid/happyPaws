import 'package:flutter/material.dart';
import 'petOwnerHome.dart';
import 'petOwner_appointments.dart';

class appointment_confirmed extends StatefulWidget {
  const appointment_confirmed ({Key? key}) : super (key: key);

  @override
  State<appointment_confirmed> createState() => _appointment_confirmedState();
}

class _appointment_confirmedState extends State<appointment_confirmed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffaf7f4),

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

      body:Align(
        alignment:Alignment.center,
        child:Padding(
          padding:const EdgeInsets.symmetric(vertical:0 ,horizontal:16),
          child:SingleChildScrollView(
            child:
            Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children: [
                const Image(
                  image:AssetImage("Assets/appointment_confirmed.png"),
                  height:270,
                  width:270,
                  fit:BoxFit.cover,
                ),
                const Padding(
                  padding:EdgeInsets.fromLTRB(0, 20, 0, 16),
                  child:Text(
                    "تم تأكيد حجزك",
                    textAlign: TextAlign.start,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w700,
                      fontFamily: "Almarai",
                      fontSize:37,
                      color:Color(0xff034d23),
                    ),
                  ),
                ),
                const Text(
                  "يمكنك الإطلاع على تفاصيل موعدك من خلال زيارة صفحة المواعيد الخاصة بك",
                  textAlign: TextAlign.center,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontFamily: "Almarai",
                    fontSize:25,
                    color:Color(0xff009245),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(0, 25, 0, 10),
                  child:ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => petOwner_appointments()));
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
                      child: const Text(" المواعيد",
                          style: TextStyle(fontSize: 20, color: Color(0xFF034D23)))),
                )

            ,Padding(
                  padding:EdgeInsets.fromLTRB(0, 15, 0, 60),
              child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => petOwnerHome()));
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
                      child: const Text(" الصفحة الرئيسية",
                          style: TextStyle(fontSize: 20, color: Color(0xFF034D23)))),
            ),
              ],),),),),

    );
  }
}