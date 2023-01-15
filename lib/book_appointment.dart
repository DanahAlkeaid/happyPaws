import 'package:flutter/material.dart';
import 'appointment_confirmed.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class book_appointments extends StatefulWidget {
  final Map<String, String> clinicInfo; //  edit

  const book_appointments (this.clinicInfo, {Key? key}) : super (key: key); // edit

  @override
  State<book_appointments> createState() => _book_appointmentssState();
}

class _book_appointmentssState extends State<book_appointments> {
  //variable to store the selected appointment date and time
  TimeOfDay _time = TimeOfDay.now();
  String formattedTime = "";
  DateTime _date = DateTime.now();
  String formattedDate = "";

  late String clinicName = '${widget.clinicInfo['clinicEmail']}';
  late String clinicEmail = '${widget.clinicInfo['clinicEmail']}';
  late String clinicPhone = '${widget.clinicInfo['clinicPhone']}';
  late String clinicServiceName = '${widget.clinicInfo['clinicServiceName']}';
  late String clinicServicePrice = '${widget.clinicInfo['clinicServicePrice']}';

//A method to format the appointment time
  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
      formattedTime = _time.toString().replaceAll("(", "").replaceAll(")", "").replaceAll("TimeOfDay", "");
    });
  }

//A method to check if the chosen appointment day is a weekday
  bool isWorkday() {
    if (_date.weekday == DateTime.friday) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            icon: const Icon(Icons.error_outline_rounded,
                color: const Color(0xffc51515),
                size: 55),

            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Align(alignment : Alignment.centerRight ,
                    child: Text('،العيادة مغلقة في اليوم المحدد',
                        style: TextStyle(fontSize: 20,
                            fontWeight:FontWeight.w500,
                            fontFamily: "Almarai",
                            color: Colors.black)),
                  ),
                  Align(alignment : Alignment.centerRight ,
                    child: Text('.الرجاء إختيار يوم أخر',
                        style: TextStyle(fontSize: 20,
                            fontWeight:FontWeight.w500,
                            fontFamily: "Almarai",
                            color: Colors.black)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Align(alignment : Alignment.center ,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
                    child: const Text("حسناً",
                        style: TextStyle(fontSize: 18,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              ),
            ],
          );
        },
      );
      return false;
    }
    else
    {
      return true;}
  }

//A method to check if all the information are complete before booking the appointment
  bool isComplete() {
    if (formattedTime == "" || formattedDate == "") {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            icon: const Icon(Icons.error_outline_rounded,
                color: const Color(0xffc51515),
                size: 55),

            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Align(alignment : Alignment.centerRight ,
                    child: Text('،الرجاء التأكد من إدخال جميع',
                        style: TextStyle(fontSize: 20,
                            fontWeight:FontWeight.w500,
                            fontFamily: "Almarai",
                            color: Colors.black)),
                  ),
                  Align(alignment : Alignment.centerRight ,
                    child: Text('.المعلومات المطلوبة',
                        style: TextStyle(fontSize: 20,
                            fontWeight:FontWeight.w500,
                            fontFamily: "Almarai",
                            color: Colors.black)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Align(alignment : Alignment.center ,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
                    child: const Text("حسناً",
                        style: TextStyle(fontSize: 18,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              ),
            ],
          );
        },
      );
      return false;
    }
    else
    {
      return true;}
  }

//Get the current petOwner info
  FirebaseAuth _auth = FirebaseAuth.instance;
  late final Stream<QuerySnapshot> _reqStream;
  CollectionReference appointments = FirebaseFirestore.instance.collection('appointments');
  var pEmail;
  var pName='';
  var pPhone;

  void initState() {
    super.initState();
    getCurrentUser();
    pInfo();
    openCollection();
  }

  getCurrentUser()  {
    final User user = _auth.currentUser! ;
    pEmail = user.email;
  }


  pInfo()  {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${pEmail}')
        .get()
        .then((snapshot) { print(snapshot.docs[0].data());
    var petOwnerName = snapshot.docs[0].data()['firstname'];
    var petOwnerPhone = snapshot.docs[0].data()['phonenumber'];
    setState(() {
      pName ='${petOwnerName} ';
      pPhone ='${petOwnerPhone} ';
    });

    }); }

  openCollection() {
    _reqStream = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${pEmail}')
        .snapshots();
  }

//Storing the appointment at the cloud firestore
  Future<void> addAppointment() {
    return appointments
        .add({
      'status': "موعد قادم",
      //Data from clinic
      'clinic': clinicName,
      'clinicEmail': clinicEmail,
      'clinicPhone': clinicPhone,
      'service': clinicServiceName,
      'servicePrice': clinicServicePrice,
      //Data from petOwner
      'petOwner': pName,
      'petOwnerEmail': pEmail,
      'petOwnerPhone': pPhone,
      'date': formattedDate,
      'time': formattedTime,
      'rated': 'yet',
    })
        .then((value) => print("Appointment Added"))
        .catchError((error) => print("Failed to add appointment: $error"));
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
              Text(
                clinicName, // edit
                textAlign: TextAlign.start,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontFamily: "Almarai",
                  fontSize:20,
                  color:Color(0xff009245),
                ),
              ),

              const Divider(
                color:Color(0xffbda520),
                height:14,
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
                  ":الخدمات العلاجية المختارة",
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

              const SizedBox(height: 10)
              ,Row(
                mainAxisAlignment:MainAxisAlignment.end,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children: [
                  Align(
                    alignment:Alignment.centerRight,
                    child:Text(
                      clinicServiceName,
                      textAlign: TextAlign.start,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w500,
                        fontFamily: "Almarai",
                        fontSize:20,
                        color:Color(0xff009245),
                      ),
                    ),
                  ),
                ],),

              const SizedBox(
                height:12,
                width:16,
              ),
              const Align(
                alignment:Alignment(1.0, 0.0),
                child:Text(
                  ":سعر الخدمة",
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

              const SizedBox(height: 10)
              ,Row(
                mainAxisAlignment:MainAxisAlignment.end,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children: [
                  Align(
                    alignment:Alignment.centerRight,
                    child:Text(
                      clinicServicePrice + ' رس',
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                      overflow:TextOverflow.clip,
                      style:TextStyle(
                        fontWeight:FontWeight.w500,
                        fontFamily: "Almarai",
                        fontSize:20,
                        color:Color(0xff009245),
                      ),
                    ),
                  ),
                ],),

              const SizedBox(height: 10)
              ,const Divider(
                color:Color(0xffbda520),
                height:13,
                thickness:1,
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
                      DateTime.now().add(Duration(days: 1)),
                      width: 70,
                      height: 100,
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
                    iosStylePicker: true,
                    is24HrFormat: true,
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
                    //Check if the chosen day is a workday and check information completion
                    if (isWorkday() && isComplete()) {
                      addAppointment();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            //Check appointment confirmation then redirect to correct page
                              builder: (context) => appointment_confirmed()));
                      print(_time);
                      print(formattedTime);
                      print(_date);
                      print(formattedDate);
                      print(DateTime.friday);}
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
                      style: TextStyle(fontSize: 28,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              const SizedBox(height: 30)
            ],),),),
    );
  }
}