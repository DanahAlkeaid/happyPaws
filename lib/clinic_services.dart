import 'package:flutter/material.dart';
import 'clinic_home.dart';
import 'service_details.dart';

class clinic_services extends StatefulWidget {
  const clinic_services ({Key? key}) : super (key: key);

  @override
  State<clinic_services> createState() => _clinic_servicesState();
}

class _clinic_servicesState extends State<clinic_services> {

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


      body:
      Padding(
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
              const Align(
                alignment:Alignment.centerRight,
                child:Text(
                  "الخدمات المقدمة",
                  textAlign: TextAlign.start,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w700,
                    fontFamily: "Elmessiri",
                    fontSize:37,
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
                    padding:const EdgeInsets.fromLTRB(243, 0, 0, 0),
                    child:Align(
                      alignment:Alignment.center,
                      child:MaterialButton(
                        onPressed:(){},
                        color:const Color(0xfffaf7f4),
                        elevation:0,
                        shape:const RoundedRectangleBorder(
                          borderRadius:BorderRadius.zero,
                          side:BorderSide(color:Color(0xfffaf7f4),width:1),
                        ),
                        padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                        child:const Text("اضف خدمة", style: TextStyle( fontSize:18,
                          fontWeight:FontWeight.w400,
                          fontFamily: "Elmessiri",
                        ),),
                        textColor:const Color(0xff034d23),
                        height:10,
                        minWidth:12,
                      ),
                    ),
                  ),
                  const Align(
                    alignment:Alignment(0.0, 0.0),
                    child:Icon(
                      Icons.add,
                      color:Color(0xff034d23),
                      size:34,
                    ),
                  ),
                ],),

              const SizedBox(
                height:16,
                width:16,
              ),

              //First service
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[

                  Padding(
                    padding:const EdgeInsets.fromLTRB(164, 0, 0, 0),
                    child:MaterialButton(
                      onPressed:(){},
                      color:const Color(0xfffaf7f4),
                      elevation:0,
                      shape:const RoundedRectangleBorder(
                        borderRadius:BorderRadius.zero,
                        side:BorderSide(color:Color(0xfffaf7f4),width:1),
                      ),
                      padding:const EdgeInsets.all(16),
                      child:const Text("الخدمة الاساسية", style: TextStyle( fontSize:18,
                        fontWeight:FontWeight.w400,
                        fontFamily: "Elmessiri",
                      ),),
                      textColor:const Color(0xff034d23),
                      height:40,
                      minWidth:140,
                    ),
                  ),
                  const Icon(
                    Icons.expand_more,
                    color:Color(0xff034d23),
                    size:37,
                  ),
                ],),
              const Divider(
                color:Color(0xffbda520),
                height:12,
                thickness:0,
                indent:6,
                endIndent:8,
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[

                  const Padding(
                    padding:EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child:Icon(
                      Icons.add,
                      color:Color(0xff034d23),
                      size:24,
                    ),
                  ),
                  MaterialButton(
                    onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => service_details()));
                    },
                    color:const Color(0xfffaf7f4),
                    elevation:0,
                    shape:const RoundedRectangleBorder(
                      borderRadius:BorderRadius.zero,
                      side:BorderSide(color:Color(0xfffaf7f4),width:1),
                    ),
                    padding:const EdgeInsets.all(16),
                    child:const Text("التفاصيل", style: TextStyle( fontSize:14,
                      fontWeight:FontWeight.w400,
                      fontFamily: "Elmessiri",
                    ),),
                    textColor:const Color(0xff034d23),
                    height:10,
                    minWidth:12,
                  ),
                  const Padding(
                    padding:EdgeInsets.fromLTRB(88, 0, 0, 0),
                    child:Align(
                      alignment:Alignment(0.5, 0.0),
                      child:Text(
                        "الخدمة الفرعية",
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w400,
                          fontFamily: "Elmessiri",
                          fontSize:16,
                          color:Color(0xff009245),
                        ),
                      ),
                    ),
                  ),
                ],),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[

                  const Padding(
                    padding:EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child:Icon(
                      Icons.add,
                      color:Color(0xff034d23),
                      size:24,
                    ),
                  ),
                  MaterialButton(
                    onPressed:(){},
                    color:const Color(0xfffaf7f4),
                    elevation:0,
                    shape:const RoundedRectangleBorder(
                      borderRadius:BorderRadius.zero,
                      side:BorderSide(color:Color(0xfffaf7f4),width:1),
                    ),
                    padding:const EdgeInsets.all(16),
                    child:const Text("التفاصيل", style: TextStyle( fontSize:14,
                      fontWeight:FontWeight.w400,
                      fontFamily: "Elmessiri",
                    ),),
                    textColor:const Color(0xff034d23),
                    height:10,
                    minWidth:12,
                  ),
                  const Padding(
                    padding:EdgeInsets.fromLTRB(88, 0, 0, 0),
                    child:Align(
                      alignment:Alignment(0.5, 0.0),
                      child:Text(
                        "الخدمة الفرعية",
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w400,
                          fontFamily: "Elmessiri",
                          fontSize:16,
                          color:Color(0xff009245),
                        ),
                      ),
                    ),
                  ),
                ],),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[

                  const Padding(
                    padding:EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child:Icon(
                      Icons.add,
                      color:Color(0xff034d23),
                      size:24,
                    ),
                  ),
                  MaterialButton(
                    onPressed:(){},
                    color:const Color(0xfffaf7f4),
                    elevation:0,
                    shape:const RoundedRectangleBorder(
                      borderRadius:BorderRadius.zero,
                      side:BorderSide(color:Color(0xfffaf7f4),width:1),
                    ),
                    padding:const EdgeInsets.all(16),
                    child:const Text("التفاصيل", style: TextStyle( fontSize:14,
                      fontWeight:FontWeight.w400,
                      fontFamily: "Elmessiri",
                    ),),
                    textColor:const Color(0xff034d23),
                    height:10,
                    minWidth:12,
                  ),
                  const Padding(
                    padding:EdgeInsets.fromLTRB(88, 0, 0, 0),
                    child:Align(
                      alignment:Alignment(0.5, 0.0),
                      child:Text(
                        "الخدمة الفرعية",
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w400,
                          fontFamily: "Elmessiri",
                          fontSize:16,
                          color:Color(0xff009245),
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

            ],),),),

    );
  }
}