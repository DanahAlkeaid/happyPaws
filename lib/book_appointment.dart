import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'appointment_confirmed.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';

class book_appointments extends StatefulWidget {
  const book_appointments ({Key? key}) : super (key: key);

  @override
  State<book_appointments> createState() => _book_appointmentssState();
}

class _book_appointmentssState extends State<book_appointments> {
  //variable to store the selected appointment date and time
  TimeOfDay _time = TimeOfDay.now();
  String formattedTime = "";
  DateTime _date = DateTime.now();
  String formattedDate = "";
  bool iosStyle = true;


  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
      formattedTime = _time.toString().replaceAll("(", "").replaceAll(")", "").replaceAll("TimeOfDay", "");
    });
  }

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
                padding:EdgeInsets.fromLTRB(0, 0, 0, 0),
                child:
                Image(
                  image:AssetImage("Assets/Pet_House.png"),
                  height:60,
                  width:60,
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
                  fontSize:30,
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
                  fontSize:23,
                  color:Color(0xff009245),
                ),
              ),

              const Divider(
                color:Color(0xffbda520),
                height:10,
                thickness:1,
                indent:0,
                endIndent:0,
              ),

              const SizedBox(
                height:12,
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
                    fontSize:20,
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
                    padding:EdgeInsets.fromLTRB(78, 0, 0, 0),
                    child:Align(
                      alignment:Alignment.centerRight,
                      child:Text(
                        "اسم الخدمة",
                        textAlign: TextAlign.start,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w400,
                          fontFamily: "Almarai",
                          fontSize:20,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                  ),
                ],),
              const Divider(
                color:Color(0xffbda520),
                height:13,
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
                    fontSize:20,
                    color:Color(0xff034d23),
                  ),
                ),
              ),

              //Date picker
              SizedBox(
                height: 120,
                child:   Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DatePicker(
                      DateTime.now(),
                      width: 70,
                      height: 100,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Color(0xffD5E694),
                      selectedTextColor: Color(0xff034d23),
                      //only show 7 days
                      daysCount: 7,
                      locale: "ar",
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _date = date;
                          formattedDate = _date.toString().replaceAll("00:00:00.000", "");
                        });
                      },
                    ),
                  ],
                ),
              )

              ,const SizedBox(height: 20)
              ,const Align(
                alignment:Alignment(1.0, 0.0),
                child:Text(
                  "اختر الوقت",
                  textAlign: TextAlign.start,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontFamily: "Almarai",
                    fontSize:20,
                    color:Color(0xff034d23),
                  ),
                ),
              ),

              //Time picker
            Container(
            child: createInlinePicker(
            elevation: 1,
            value: _time,
            onChange: onTimeChanged,
            minuteInterval: MinuteInterval.THIRTY,
            iosStylePicker: iosStyle,
            is24HrFormat: false,
            //Set start and end time
            minHour: 9,
            maxHour: 21,
            maxMinute:30,
            //Styling
            sunAsset: Image.asset("Assets/sun.png"),
            moonAsset: Image.asset("Assets/moon.png"),
            isOnChangeValueMode: true,
            accentColor: Colors.black,
            barrierColor: Color(0xfffaf7f4),
            wheelHeight: 150
        ),
      ),

              const SizedBox(height: 5)
              ,ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Check appointment confirmation then redirect to correct page
                            builder: (context) => appointment_confirmed()));
                    print(_time);
                    print(formattedTime);
                    print(_date);
                    print(formattedDate);},
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
                      style: TextStyle(fontSize: 28,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              const SizedBox(height: 20)
            ],),),),
    );
  }
}

