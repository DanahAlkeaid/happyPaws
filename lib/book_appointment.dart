import 'package:flutter/material.dart';

import 'appointment_confirmed.dart';
import 'petOwnerHome.dart';


class book_appointments extends StatefulWidget {
  const book_appointments ({Key? key}) : super (key: key);

  @override
  State<book_appointments> createState() => _book_appointmentssState();
}

class _book_appointmentssState extends State<book_appointments> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf7f4),

      appBar: AppBar(
          leading: IconButton(
            icon: (const Icon(Icons.arrow_back_ios)),
            color: const Color(0xff034d23),
            iconSize: 36,
            onPressed: () {
              Navigator.pop(context);
            },
          )
          ,flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/App_Header.png'),
                fit: BoxFit.fill
            )
        ),
      ),
          elevation: 0
      ),

      body:Padding(
        padding:const EdgeInsets.symmetric(vertical: 0,horizontal:16),
        child:SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.max,
            children: [

              const SizedBox(
                height:16,
                width:16,
              ),
              const Padding(
                padding:EdgeInsets.fromLTRB(0, 0, 0, 12),
                child:
                Image(
                  image:AssetImage("Assets/Pet_House.png"),
                  height:70,
                  width:70,
                  fit:BoxFit.contain,
                ),
              ),
              const Text(
                "اكمل الحجز",
                textAlign: TextAlign.start,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w700,
                  fontFamily: "Almarai",
                  fontSize:42,
                  color:Color(0xff034d23),
                ),
              ),
              const Text(
                "اسم العيادة",
                textAlign: TextAlign.start,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontFamily: "Almarai",
                  fontSize:27,
                  color:Color(0xff009245),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Chip(
                  labelPadding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                  label: Text("نوع العيادة"),
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Almarai",
                    color: Color(0xff034d23),
                  ),
                  backgroundColor: Color(0xffD5E694),
                  elevation: 0,
                  shadowColor: Color(0xff808080),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              const Divider(
                color:Color(0xffbda520),
                height:16,
                thickness:1,
                indent:0,
                endIndent:0,
              ),

              const SizedBox(
                height:16,
                width:16,
              ),
              const Align(
                alignment:Alignment(1.0, 0.0),
                child:Text(
                  "الخدمات العلاجية",
                  textAlign: TextAlign.start,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontFamily: "Almarai",
                    fontSize:24,
                    color:Color(0xff034d23),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[

                  Padding(
                    padding:const EdgeInsets.fromLTRB(0, 0, 117, 0),
                    child:MaterialButton(
                      onPressed:(){},
                      color:const Color(0xfffaf7f4),
                      elevation:0,
                      shape:const RoundedRectangleBorder(
                        borderRadius:BorderRadius.zero,
                        side:BorderSide(color:Color(0xfffaf7f4),width:1),
                      ),
                      padding:const EdgeInsets.all(16),
                      child:const Text("حذف", style: TextStyle( fontSize:17,
                        fontWeight:FontWeight.w400,
                        fontFamily: "Almarai",
                      ),),
                      textColor:const Color(0xffd60f0f),
                      height:20,
                      minWidth:10,
                    ),
                  ),
                  const Padding(
                    padding:EdgeInsets.fromLTRB(59, 0, 0, 0),
                    child:Align(
                      alignment:Alignment.centerRight,
                      child:Text(
                        "اسم الخدمة",
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w400,
                          fontFamily: "Almarai",
                          fontSize:24,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                  ),
                ],),
              const Divider(
                color:Color(0xffbda520),
                height:16,
                thickness:0,
                indent:0,
                endIndent:0,
              ),
              const Align(
                alignment:Alignment(1.0, 0.0),
                child:Text(
                  "اختر التاريخ",
                  textAlign: TextAlign.start,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontFamily: "Almarai",
                    fontSize:23,
                    color:Color(0xff034d23),
                  ),
                ),
              ),

              const SizedBox(height: 100)

              ,const Align(
                alignment:Alignment(1.0, 0.0),
                child:Text(
                  "اختر الوقت",
                  textAlign: TextAlign.start,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontFamily: "Almarai",
                    fontSize:23,
                    color:Color(0xff034d23),
                  ),
                ),
              ),

              const SizedBox(height: 100)


              ,ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Check appointment confirmation then redirect to correct page
                            builder: (context) => appointment_confirmed()));
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
                  child: const Text(" تأكيد الحجز",
                      style: TextStyle(fontSize: 29, color: Color(0xFF034D23)))),
            ],),),),
    );
  }
}