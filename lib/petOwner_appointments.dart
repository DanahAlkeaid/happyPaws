import 'package:flutter/material.dart';
import 'gpi_page.dart';

class petOwner_appointments extends StatefulWidget {
  const petOwner_appointments ({Key? key}) : super (key: key);

  @override
  State<petOwner_appointments> createState() => _petOwner_appointmentsState();
}

class _petOwner_appointmentsState extends State<petOwner_appointments> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf7f4),

      appBar: AppBar(
          leading: IconButton(
            icon: (Icon(Icons.arrow_back_ios)),
            color: Color(0xff034d23),
            iconSize: 36,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => gpi_page()));
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
        //Scrollable page
        padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
        child:SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize:MainAxisSize.max,
            children: [
              Align(
                alignment:Alignment(0.8, 0.0),
                child:Padding(
                  padding:EdgeInsets.fromLTRB(139, 0, 0, 0),
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisSize:MainAxisSize.max,
                    children:const [

                      Padding(
                        padding:EdgeInsets.fromLTRB(0, 22, 5, 20),
                        child:Align(
                          alignment:Alignment(0.6, 0.0),
                          child:Text(
                            "المواعيد",
                            textAlign: TextAlign.right,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w700,
                              fontFamily: "Almarai",
                              fontSize:45,
                              color:Color(0xff034d23),
                            ),
                          ),
                        ),
                      ),
                      Align(
                    alignment:Alignment(1.0, 0.0),
                        child:Icon(
                          Icons.calendar_today,
                          color:Color(0xff034d23),
                          size:24,
                        ),
                      ),
                    ],),),),

              ListView(
                scrollDirection: Axis.vertical,
                padding:EdgeInsets.all(0),
                shrinkWrap:true,
                physics:ScrollPhysics(),
                children:[
                  //Get appointment details from DB
                  //Each card represent an appointment

                  Card(
                    margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                    color:Color(0xffffffff),
                    shadowColor:Color(0x4d939393),
                    elevation:1,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(4.0),
                      side: BorderSide(color:Color(0x4d9e9e9e), width:1),
                    ),
                    child:
                    Align(
                      alignment:Alignment(0.8, 0.1),
                      child:Padding(
                        padding:EdgeInsets.all(16),
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisSize:MainAxisSize.max,
                          children:[

                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.start,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisSize:MainAxisSize.max,
                                children:[

                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
                                      child:
                                      Column(
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisSize:MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:Alignment(-0.0, 0.0),
                                            child:Row(
                                              mainAxisAlignment:MainAxisAlignment.start,
                                              crossAxisAlignment:CrossAxisAlignment.center,
                                              mainAxisSize:MainAxisSize.max,
                                              children:[

                                                IconButton(
                                                  icon:const Icon(
                                                      Icons.clear
                                                  ),
                                                  onPressed:(){},
                                                  color:Color(0xff212435),
                                                  iconSize:24,
                                                ),
                                                Align(
                                                  alignment:Alignment.topLeft,
                                                  child:MaterialButton(
                                                    onPressed:(){},
                                                    color:Color(0xffffffff),
                                                    elevation:0,
                                                    shape:const RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.zero,
                                                      side:BorderSide(color:Color(0xffffffff),width:0),
                                                    ),
                                                    padding:EdgeInsets.fromLTRB(12, 1, 16, 1),
                                                    child:Text("التفاصيل", style: TextStyle( fontSize:16,
                                                      fontWeight:FontWeight.w400,
                                                      fontFamily: "Almarai",
                                                    ),),
                                                    textColor:Color(0xff034d23),
                                                    height:9,
                                                    minWidth:10,
                                                  ),
                                                ),
                                              ],),),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "الموعد",
                                              textAlign: TextAlign.start,
                                              maxLines:1,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w700,
                                                fontFamily: "Almarai",
                                                fontSize:27,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding:EdgeInsets.symmetric(vertical: 4,horizontal:0),
                                            child:Align(
                                              alignment:Alignment.centerRight,
                                              child:Text(
                                                "اسم العيادة",
                                                textAlign: TextAlign.start,
                                                maxLines:1,
                                                overflow:TextOverflow.ellipsis,
                                                style:TextStyle(
                                                  fontWeight:FontWeight.w400,
                                                  fontFamily: "Almarai",
                                                  fontSize:16,
                                                  color:Color(0xff009245),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "الوقت",
                                              textAlign: TextAlign.start,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w400,
                                                fontFamily: "Almarai",
                                                fontSize:16,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisSize:MainAxisSize.max,
                                            children:[

                                              const Padding(
                                                padding:EdgeInsets.fromLTRB(50, 0, 1, 0),
                                                child:Text(
                                                  "التاريخ",
                                                  textAlign: TextAlign.start,
                                                  overflow:TextOverflow.clip,
                                                  style:TextStyle(
                                                    fontWeight:FontWeight.w400,
                                                    fontFamily: "Almarai",
                                                    fontSize:16,
                                                    color:Color(0xff034d23),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:EdgeInsets.fromLTRB(79, 0, 0, 0),
                                                child:Align(
                                                  alignment:Alignment.centerRight,
                                                  child:Chip(
                                                    labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal:4),
                                                    label:const Text("نوع العيادة"), labelStyle: const TextStyle( fontSize:14,
                                                    fontWeight:FontWeight.w400,
                                                    fontFamily: "Almarai",
                                                    color:Color(0xff034d23),
                                                  ),
                                                    backgroundColor:Color(0xffD5E694),
                                                    elevation:0,
                                                    shadowColor:Color(0xff808080),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.circular(16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],),
                                        ],),),),
                                ],),),
                            Container(
                              alignment:Alignment.center,
                              margin:EdgeInsets.all(0),
                              padding:EdgeInsets.all(10),
                              width:50,
                              decoration: BoxDecoration(
                                color:Color(0xfffaf7f4),
                                shape:BoxShape.circle,
                                border:Border.all(color:Color(0xff034d23),width:1),
                              ),
                              child:
                              const Align(
                                alignment:Alignment(0.1, 0.0),
                                child:///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image:AssetImage("Assets/Pet_House.png"),
                                  height:50,
                                  width:266,
                                  fit:BoxFit.contain,
                                ),
                              ),
                            ),
                          ],),),),
                  ),
                  Card(
                    margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                    color:Color(0xffffffff),
                    shadowColor:Color(0x4d939393),
                    elevation:1,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(4.0),
                      side: BorderSide(color:Color(0x4d9e9e9e), width:1),
                    ),
                    child:
                    Align(
                      alignment:Alignment(0.8, 0.1),
                      child:Padding(
                        padding:EdgeInsets.all(16),
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisSize:MainAxisSize.max,
                          children:[

                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.start,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisSize:MainAxisSize.max,
                                children:[

                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
                                      child:
                                      Column(
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisSize:MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:Alignment(-0.0, 0.0),
                                            child:Row(
                                              mainAxisAlignment:MainAxisAlignment.start,
                                              crossAxisAlignment:CrossAxisAlignment.center,
                                              mainAxisSize:MainAxisSize.max,
                                              children:[

                                                IconButton(
                                                  icon:const Icon(
                                                      Icons.clear
                                                  ),
                                                  onPressed:(){},
                                                  color:Color(0xff212435),
                                                  iconSize:24,
                                                ),
                                                Align(
                                                  alignment:Alignment.topLeft,
                                                  child:MaterialButton(
                                                    onPressed:(){},
                                                    color:Color(0xffffffff),
                                                    elevation:0,
                                                    shape:const RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.zero,
                                                      side:BorderSide(color:Color(0xffffffff),width:0),
                                                    ),
                                                    padding:EdgeInsets.fromLTRB(12, 1, 16, 1),
                                                    child:Text("التفاصيل", style: TextStyle( fontSize:16,
                                                      fontWeight:FontWeight.w400,
                                                      fontFamily: "Almarai",
                                                    ),),
                                                    textColor:Color(0xff034d23),
                                                    height:9,
                                                    minWidth:10,
                                                  ),
                                                ),
                                              ],),),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "الموعد",
                                              textAlign: TextAlign.start,
                                              maxLines:1,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w700,
                                                fontFamily: "Almarai",
                                                fontSize:27,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding:EdgeInsets.symmetric(vertical: 4,horizontal:0),
                                            child:Align(
                                              alignment:Alignment.centerRight,
                                              child:Text(
                                                "اسم العيادة",
                                                textAlign: TextAlign.start,
                                                maxLines:1,
                                                overflow:TextOverflow.ellipsis,
                                                style:TextStyle(
                                                  fontWeight:FontWeight.w400,
                                                  fontFamily: "Almarai",
                                                  fontSize:16,
                                                  color:Color(0xff009245),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "الوقت",
                                              textAlign: TextAlign.start,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w400,
                                                fontFamily: "Almarai",
                                                fontSize:16,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisSize:MainAxisSize.max,
                                            children:[

                                              const Padding(
                                                padding:EdgeInsets.fromLTRB(50, 0, 1, 0),
                                                child:Text(
                                                  "التاريخ",
                                                  textAlign: TextAlign.start,
                                                  overflow:TextOverflow.clip,
                                                  style:TextStyle(
                                                    fontWeight:FontWeight.w400,
                                                    fontFamily: "Almarai",
                                                    fontSize:16,
                                                    color:Color(0xff034d23),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:EdgeInsets.fromLTRB(79, 0, 0, 0),
                                                child:Align(
                                                  alignment:Alignment.centerRight,
                                                  child:Chip(
                                                    labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal:4),
                                                    label:const Text("نوع العيادة"), labelStyle: const TextStyle( fontSize:14,
                                                    fontWeight:FontWeight.w400,
                                                    fontFamily: "Almarai",
                                                    color:Color(0xff034d23),
                                                  ),
                                                    backgroundColor:Color(0xffD5E694),
                                                    elevation:0,
                                                    shadowColor:Color(0xff808080),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.circular(16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],),
                                        ],),),),
                                ],),),
                            Container(
                              alignment:Alignment.center,
                              margin:EdgeInsets.all(0),
                              padding:EdgeInsets.all(10),
                              width:50,
                              decoration: BoxDecoration(
                                color:Color(0xfffaf7f4),
                                shape:BoxShape.circle,
                                border:Border.all(color:Color(0xff034d23),width:1),
                              ),
                              child:
                              const Align(
                                alignment:Alignment(0.1, 0.0),
                                child:///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image:AssetImage("Assets/Pet_House.png"),
                                  height:50,
                                  width:266,
                                  fit:BoxFit.contain,
                                ),
                              ),
                            ),
                          ],),),),
                  ),
                  Card(
                    margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                    color:Color(0xffffffff),
                    shadowColor:Color(0x4d939393),
                    elevation:1,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(4.0),
                      side: BorderSide(color:Color(0x4d9e9e9e), width:1),
                    ),
                    child:
                    Align(
                      alignment:Alignment(0.8, 0.1),
                      child:Padding(
                        padding:EdgeInsets.all(16),
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisSize:MainAxisSize.max,
                          children:[

                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.start,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisSize:MainAxisSize.max,
                                children:[

                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
                                      child:
                                      Column(
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisSize:MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:Alignment(-0.0, 0.0),
                                            child:Row(
                                              mainAxisAlignment:MainAxisAlignment.start,
                                              crossAxisAlignment:CrossAxisAlignment.center,
                                              mainAxisSize:MainAxisSize.max,
                                              children:[

                                                IconButton(
                                                  icon:const Icon(
                                                      Icons.clear
                                                  ),
                                                  onPressed:(){},
                                                  color:Color(0xff212435),
                                                  iconSize:24,
                                                ),
                                                Align(
                                                  alignment:Alignment.topLeft,
                                                  child:MaterialButton(
                                                    onPressed:(){},
                                                    color:Color(0xffffffff),
                                                    elevation:0,
                                                    shape:const RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.zero,
                                                      side:BorderSide(color:Color(0xffffffff),width:0),
                                                    ),
                                                    padding:EdgeInsets.fromLTRB(12, 1, 16, 1),
                                                    child:Text("التفاصيل", style: TextStyle( fontSize:16,
                                                      fontWeight:FontWeight.w400,
                                                      fontFamily: "Almarai",
                                                    ),),
                                                    textColor:Color(0xff034d23),
                                                    height:9,
                                                    minWidth:10,
                                                  ),
                                                ),
                                              ],),),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "الموعد",
                                              textAlign: TextAlign.start,
                                              maxLines:1,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w700,
                                                fontFamily: "Almarai",
                                                fontSize:27,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding:EdgeInsets.symmetric(vertical: 4,horizontal:0),
                                            child:Align(
                                              alignment:Alignment.centerRight,
                                              child:Text(
                                                "اسم العيادة",
                                                textAlign: TextAlign.start,
                                                maxLines:1,
                                                overflow:TextOverflow.ellipsis,
                                                style:TextStyle(
                                                  fontWeight:FontWeight.w400,
                                                  fontFamily: "Almarai",
                                                  fontSize:16,
                                                  color:Color(0xff009245),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "الوقت",
                                              textAlign: TextAlign.start,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w400,
                                                fontFamily: "Almarai",
                                                fontSize:16,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisSize:MainAxisSize.max,
                                            children:[

                                              const Padding(
                                                padding:EdgeInsets.fromLTRB(50, 0, 1, 0),
                                                child:Text(
                                                  "التاريخ",
                                                  textAlign: TextAlign.start,
                                                  overflow:TextOverflow.clip,
                                                  style:TextStyle(
                                                    fontWeight:FontWeight.w400,
                                                    fontFamily: "Almarai",
                                                    fontSize:16,
                                                    color:Color(0xff034d23),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:EdgeInsets.fromLTRB(79, 0, 0, 0),
                                                child:Align(
                                                  alignment:Alignment.centerRight,
                                                  child:Chip(
                                                    labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal:4),
                                                    label:const Text("نوع العيادة"), labelStyle: const TextStyle( fontSize:14,
                                                    fontWeight:FontWeight.w400,
                                                    fontFamily: "Almarai",
                                                    color:Color(0xff034d23),
                                                  ),
                                                    backgroundColor:Color(0xffD5E694),
                                                    elevation:0,
                                                    shadowColor:Color(0xff808080),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.circular(16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],),
                                        ],),),),
                                ],),),
                            Container(
                              alignment:Alignment.center,
                              margin:EdgeInsets.all(0),
                              padding:EdgeInsets.all(10),
                              width:50,
                              decoration: BoxDecoration(
                                color:Color(0xfffaf7f4),
                                shape:BoxShape.circle,
                                border:Border.all(color:Color(0xff034d23),width:1),
                              ),
                              child:
                              const Align(
                                alignment:Alignment(0.1, 0.0),
                                child:///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image:AssetImage("Assets/Pet_House.png"),
                                  height:50,
                                  width:266,
                                  fit:BoxFit.contain,
                                ),
                              ),
                            ),
                          ],),),),
                  ),
                  Card(
                    margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                    color:Color(0xffffffff),
                    shadowColor:Color(0x4d939393),
                    elevation:1,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(4.0),
                      side: BorderSide(color:Color(0x4d9e9e9e), width:1),
                    ),
                    child:
                    Align(
                      alignment:Alignment(0.8, 0.1),
                      child:Padding(
                        padding:EdgeInsets.all(16),
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.center,
                          mainAxisSize:MainAxisSize.max,
                          children:[

                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.start,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                mainAxisSize:MainAxisSize.max,
                                children:[

                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
                                      child:
                                      Column(
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisSize:MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:Alignment(-0.0, 0.0),
                                            child:Row(
                                              mainAxisAlignment:MainAxisAlignment.start,
                                              crossAxisAlignment:CrossAxisAlignment.center,
                                              mainAxisSize:MainAxisSize.max,
                                              children:[

                                                IconButton(
                                                  icon:const Icon(
                                                      Icons.clear
                                                  ),
                                                  onPressed:(){},
                                                  color:Color(0xff212435),
                                                  iconSize:24,
                                                ),
                                                Align(
                                                  alignment:Alignment.topLeft,
                                                  child:MaterialButton(
                                                    onPressed:(){},
                                                    color:Color(0xffffffff),
                                                    elevation:0,
                                                    shape:const RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.zero,
                                                      side:BorderSide(color:Color(0xffffffff),width:0),
                                                    ),
                                                    padding:EdgeInsets.fromLTRB(12, 1, 16, 1),
                                                    child:Text("التفاصيل", style: TextStyle( fontSize:16,
                                                      fontWeight:FontWeight.w400,
                                                      fontFamily: "Almarai",
                                                    ),),
                                                    textColor:Color(0xff034d23),
                                                    height:9,
                                                    minWidth:10,
                                                  ),
                                                ),
                                              ],),),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "الموعد",
                                              textAlign: TextAlign.start,
                                              maxLines:1,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w700,
                                                fontFamily: "Almarai",
                                                fontSize:27,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding:EdgeInsets.symmetric(vertical: 4,horizontal:0),
                                            child:Align(
                                              alignment:Alignment.centerRight,
                                              child:Text(
                                                "اسم العيادة",
                                                textAlign: TextAlign.start,
                                                maxLines:1,
                                                overflow:TextOverflow.ellipsis,
                                                style:TextStyle(
                                                  fontWeight:FontWeight.w400,
                                                  fontFamily: "Almarai",
                                                  fontSize:16,
                                                  color:Color(0xff009245),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "الوقت",
                                              textAlign: TextAlign.start,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w400,
                                                fontFamily: "Almarai",
                                                fontSize:16,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisSize:MainAxisSize.max,
                                            children:[

                                              const Padding(
                                                padding:EdgeInsets.fromLTRB(50, 0, 1, 0),
                                                child:Text(
                                                  "التاريخ",
                                                  textAlign: TextAlign.start,
                                                  overflow:TextOverflow.clip,
                                                  style:TextStyle(
                                                    fontWeight:FontWeight.w400,
                                                    fontFamily: "Almarai",
                                                    fontSize:16,
                                                    color:Color(0xff034d23),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:EdgeInsets.fromLTRB(79, 0, 0, 0),
                                                child:Align(
                                                  alignment:Alignment.centerRight,
                                                  child:Chip(
                                                    labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal:4),
                                                    label:const Text("نوع العيادة"), labelStyle: const TextStyle( fontSize:14,
                                                    fontWeight:FontWeight.w400,
                                                    fontFamily: "Almarai",
                                                    color:Color(0xff034d23),
                                                  ),
                                                    backgroundColor:Color(0xffD5E694),
                                                    elevation:0,
                                                    shadowColor:Color(0xff808080),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.circular(16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],),
                                        ],),),),
                                ],),),
                            Container(
                              alignment:Alignment.center,
                              margin:EdgeInsets.all(0),
                              padding:EdgeInsets.all(10),
                              width:50,
                              decoration: BoxDecoration(
                                color:Color(0xfffaf7f4),
                                shape:BoxShape.circle,
                                border:Border.all(color:Color(0xff034d23),width:1),
                              ),
                              child:
                              const Align(
                                alignment:Alignment(0.1, 0.0),
                                child:///***If you have exported images you must have to copy those images in assets/images directory.
                                Image(
                                  image:AssetImage("Assets/Pet_House.png"),
                                  height:50,
                                  width:266,
                                  fit:BoxFit.contain,
                                ),
                              ),
                            ),
                          ],),),),
                  ),


                ],),
            ],),),),
    );
  }
}