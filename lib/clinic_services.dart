import 'package:flutter/material.dart';
import 'package:untitled/addGrooming.dart';
import 'package:untitled/addMedical.dart';
import 'package:untitled/addOther.dart';
import 'package:untitled/addTruck.dart';
import 'package:untitled/editOther.dart';
import 'package:untitled/editTruck.dart';
import 'editGrooming.dart';
import 'editMedical.dart';

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



             // add service


              const SizedBox(
                height:16,
                width:16,
              ),

              //grooming services
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children:[

                      Padding(
                        padding:const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child:Align(
                          alignment:Alignment.center,
                          child:MaterialButton(
                            onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => addGrooming()));},
                            color:const Color(0xfffaf7f4),
                            elevation:0,
                            shape:const RoundedRectangleBorder(
                              borderRadius:BorderRadius.zero,
                              side:BorderSide(color:Color(0xfffaf7f4),width:1),
                            ),
                            padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                            child:const Text("أضف خدمة", style: TextStyle( fontSize:15,
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
                          size:20,
                        ),
                      ),
                    ],),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:MaterialButton(
                      onPressed:(){},
                      color:const Color(0xfffaf7f4),
                      elevation:0,
                      shape:const RoundedRectangleBorder(
                        borderRadius:BorderRadius.zero,
                        side:BorderSide(color:Color(0xfffaf7f4),width:1),
                      ),
                      padding:const EdgeInsets.all(16),
                      child:const Text("خدمات التنظيف والتزيين", style: TextStyle( fontSize:18,
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
                      Icons.delete,
                      color:Color(0xff034d23),
                      size:24,
                    ),
                  ),
                  MaterialButton(
                    onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editGrooming()));
                    },
                    color:const Color(0xfffaf7f4),
                    elevation:0,
                    shape:const RoundedRectangleBorder(
                      borderRadius:BorderRadius.zero,
                      side:BorderSide(color:Color(0xfffaf7f4),width:1),
                    ),
                    padding:const EdgeInsets.all(16),
                    child:const Text("تعديل", style: TextStyle( fontSize:14,
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



              //medical services
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children:[

                      Padding(
                        padding:const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child:Align(
                          alignment:Alignment.center,
                          child:MaterialButton(
                            onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => addMedical()));},
                            color:const Color(0xfffaf7f4),
                            elevation:0,
                            shape:const RoundedRectangleBorder(
                              borderRadius:BorderRadius.zero,
                              side:BorderSide(color:Color(0xfffaf7f4),width:1),
                            ),
                            padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                            child:const Text("أضف خدمة", style: TextStyle( fontSize:15,
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
                          size:20,
                        ),
                      ),
                    ],),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:MaterialButton(
                      onPressed:(){},
                      color:const Color(0xfffaf7f4),
                      elevation:0,
                      shape:const RoundedRectangleBorder(
                        borderRadius:BorderRadius.zero,
                        side:BorderSide(color:Color(0xfffaf7f4),width:1),
                      ),
                      padding:const EdgeInsets.all(16),
                      child:const Text("الخدمات العلاجية", style: TextStyle( fontSize:18,
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
                      Icons.delete,
                      color:Color(0xff034d23),
                      size:24,
                    ),
                  ),
                  MaterialButton(
                    onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editMedical()));
                    },
                    color:const Color(0xfffaf7f4),
                    elevation:0,
                    shape:const RoundedRectangleBorder(
                      borderRadius:BorderRadius.zero,
                      side:BorderSide(color:Color(0xfffaf7f4),width:1),
                    ),
                    padding:const EdgeInsets.all(16),
                    child:const Text("تعديل", style: TextStyle( fontSize:14,
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


              //truck services
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children:[

                      Padding(
                        padding:const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child:Align(
                          alignment:Alignment.center,
                          child:MaterialButton(
                            onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => addTruck()));},
                            color:const Color(0xfffaf7f4),
                            elevation:0,
                            shape:const RoundedRectangleBorder(
                              borderRadius:BorderRadius.zero,
                              side:BorderSide(color:Color(0xfffaf7f4),width:1),
                            ),
                            padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                            child:const Text("أضف خدمة", style: TextStyle( fontSize:15,
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
                          size:20,
                        ),
                      ),
                    ],),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:MaterialButton(
                      onPressed:(){},
                      color:const Color(0xfffaf7f4),
                      elevation:0,
                      shape:const RoundedRectangleBorder(
                        borderRadius:BorderRadius.zero,
                        side:BorderSide(color:Color(0xfffaf7f4),width:1),
                      ),
                      padding:const EdgeInsets.all(16),
                      child:const Text("خدمات العيادة المتنقلة", style: TextStyle( fontSize:18,
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
                      Icons.delete,
                      color:Color(0xff034d23),
                      size:24,
                    ),
                  ),
                  MaterialButton(
                    onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editTruck()));
                    },
                    color:const Color(0xfffaf7f4),
                    elevation:0,
                    shape:const RoundedRectangleBorder(
                      borderRadius:BorderRadius.zero,
                      side:BorderSide(color:Color(0xfffaf7f4),width:1),
                    ),
                    padding:const EdgeInsets.all(16),
                    child:const Text("تعديل", style: TextStyle( fontSize:14,
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



              // other services
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children:[

                      Padding(
                        padding:const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child:Align(
                          alignment:Alignment.center,
                          child:MaterialButton(
                            onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => addOther()));},
                            color:const Color(0xfffaf7f4),
                            elevation:0,
                            shape:const RoundedRectangleBorder(
                              borderRadius:BorderRadius.zero,
                              side:BorderSide(color:Color(0xfffaf7f4),width:1),
                            ),
                            padding:const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                            child:const Text("أضف خدمة", style: TextStyle( fontSize:15,
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
                          size:20,
                        ),
                      ),
                    ],),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:MaterialButton(
                      onPressed:(){},
                      color:const Color(0xfffaf7f4),
                      elevation:0,
                      shape:const RoundedRectangleBorder(
                        borderRadius:BorderRadius.zero,
                        side:BorderSide(color:Color(0xfffaf7f4),width:1),
                      ),
                      padding:const EdgeInsets.all(16),
                      child:const Text("خدمات أخرى", style: TextStyle( fontSize:18,
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
                      Icons.delete,
                      color:Color(0xff034d23),
                      size:24,
                    ),
                  ),
                  MaterialButton(
                    onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => editOther()));
                    },
                    color:const Color(0xfffaf7f4),
                    elevation:0,
                    shape:const RoundedRectangleBorder(
                      borderRadius:BorderRadius.zero,
                      side:BorderSide(color:Color(0xfffaf7f4),width:1),
                    ),
                    padding:const EdgeInsets.all(16),
                    child:const Text("تعديل", style: TextStyle( fontSize:14,
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