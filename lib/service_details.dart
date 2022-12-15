import 'package:flutter/material.dart';
import 'gpi_page.dart';

class service_details extends StatefulWidget {
  const service_details ({Key? key}) : super (key: key);

  @override
  State<service_details> createState() => _service_detailsState();
}

class _service_detailsState extends State<service_details> {
  bool dog_service = false;
  bool cat_service = false;

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const gpi_page()));
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
        padding:const EdgeInsets.symmetric(vertical: 200,horizontal:16),
        child:SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize:MainAxisSize.max,
            children: [

              ListView(
                scrollDirection: Axis.vertical,
                padding:const EdgeInsets.all(0),
                shrinkWrap:true,
                physics:const ScrollPhysics(),
                children:[


                  Card(
                    margin:const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    color:const Color(0xfff1eacc),
                    shadowColor:const Color(0x4d939393),
                    elevation:1,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(4.0),
                      side: const BorderSide(color:Color(0x4d9e9e9e), width:1),
                    ),
                    child:
                    Align(
                      alignment:const Alignment(0.8, 0.1),
                      child:Padding(
                        padding:const EdgeInsets.all(16),
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
                                      padding:const EdgeInsets.symmetric(vertical: 0,horizontal:16),
                                      child:
                                      Column(
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisSize:MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:Alignment.center,
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
                                                  color:const Color(0xff212435),
                                                  iconSize:24,
                                                ),
                                                const Padding(
                                                  padding:EdgeInsets.fromLTRB(50, 0, 0, 0),
                                                  child:Text(
                                                    "تفاصيل الخدمة",
                                                    textAlign: TextAlign.center,
                                                    overflow:TextOverflow.clip,
                                                    style:TextStyle(
                                                      fontWeight:FontWeight.w600,
                                                      fontFamily: "Almarai",
                                                      fontSize:19,
                                                      color:Color(0xff034d23),
                                                    ),
                                                  ),
                                                ),
                                              ],),),
                                          const Divider(
                                            color:Color(0xff5f5d5d),
                                            height:13,
                                            thickness:0,
                                            indent:0,
                                            endIndent:0,
                                          ),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "اسم الخدمة",
                                              textAlign: TextAlign.start,
                                              maxLines:1,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w500,
                                                fontFamily: "Almarai",
                                                fontSize:18,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding:EdgeInsets.symmetric(vertical: 4,horizontal:0),
                                            child:Align(
                                              alignment:Alignment.centerRight,
                                              child:Text(
                                                "السعر",
                                                textAlign: TextAlign.start,
                                                maxLines:1,
                                                overflow:TextOverflow.ellipsis,
                                                style:TextStyle(
                                                  fontWeight:FontWeight.w500,
                                                  fontFamily: "Almarai",
                                                  fontSize:18,
                                                  color:Color(0xff034d23),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            mainAxisSize:MainAxisSize.max,
                                            children:[

                                              const Padding(
                                                padding:EdgeInsets.fromLTRB(2, 0, 0, 0),
                                                child:Align(
                                                  alignment:Alignment(-0.1, 0.0),
                                                  child:///***If you have exported images you must have to copy those images in assets/images directory.
                                                  Image(
                                                    image:AssetImage("Assets/dog_icon.png"),
                                                    height:50,
                                                    width:50,
                                                    fit:BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Checkbox(
                                                value: dog_service,
                                                onChanged: (bool? value) {setState(() {dog_service = value!;});},
                                                activeColor:const Color(0xff034d23),
                                                autofocus:false,
                                                checkColor:const Color(0xffffffff),
                                                hoverColor:const Color(0xff034d23),
                                                splashRadius:20,
                                              ),
                                              const Padding(
                                                padding:EdgeInsets.fromLTRB(38, 0, 0, 0),
                                                child:///***If you have exported images you must have to copy those images in assets/images directory.
                                                Image(
                                                  image:AssetImage("Assets/cat_icon.png"),
                                                  height:40,
                                                  width:40,
                                                  fit:BoxFit.cover,
                                                ),
                                              ),

                                              Checkbox(
                                                value: cat_service,
                                                onChanged: (bool? value) {setState(() {cat_service = value!;});},
                                                activeColor:const Color(0xff034d23),
                                                autofocus:false,
                                                checkColor:const Color(0xffffffff),
                                                hoverColor:const Color(0x42000000),
                                                splashRadius:20,
                                              ),
                                            ],),
                                        ],),),),
                                ],),),
                          ],),),),
                  ),
                ],),
            ],),),),
    );
  }
}