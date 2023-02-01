import 'package:flutter/material.dart';
import 'appointment_confirmed.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class book_appointments extends StatefulWidget {
  final Map<String, String> clinicInfo;

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

  late String clinicName = '${widget.clinicInfo['clinicName']}';
  late String clinicEmail = '${widget.clinicInfo['clinicEmail']}';
  late String clinicPhone = '${widget.clinicInfo['clinicPhone']}';
  late String startTime = '${widget.clinicInfo['StartTime']}';
  late String endTime = '${widget.clinicInfo['EndTime']}';
  late String clinicServiceName = '${widget.clinicInfo['clinicServiceName']}';
  late String clinicServicePrice = '${widget.clinicInfo['clinicServicePrice']}';
  late String ServiceAvailability = '${widget.clinicInfo['availability']}';

//A method to format the appointment time
  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
      formattedTime = _time.toString().replaceAll("(", "").replaceAll(")", "").replaceAll("TimeOfDay", "");
    });
  }

//A method to get clinic start_time in the time picker
  double getClinicStartTime(String start) {
    String starttime =
        startTime.substring(
            0,startTime.indexOf(
            ":"));
    double clinic_startTime = double.parse(starttime);
      return clinic_startTime ;}

//A method to get clinic end_time in the time picker
  double getClinicEndTime(String end) {
    String endtime =
    endTime.substring(
        0,endTime.indexOf(
        ":"));
    double clinic_endTime = double.parse(endtime);
    return clinic_endTime ;}

//A method to check if the chosen appointment day is a weekday
  bool isWorkday() {
    var offDays = clinicOffDays.toString();
    print(offDays);
    if (offDays.contains(_date.weekday.toString())) {
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
                    child: Text('! الرجاء إختيار يوم آخر',
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
                    child: Text('! المعلومات المطلوبة',
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
  var clinicOffDays;
  var clinicProfilePic;


  void initState() {
    super.initState();
    cInfo();
    getCurrentUser();
    pInfo();
    openCollection();
  }
  cInfo()  {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${widget.clinicInfo['clinicEmail']}')
        .get()
        .then((snapshot) { print(snapshot.docs[0].data());
    var off = snapshot.docs[0].data()['offDays'].toString();
    var pic = snapshot.docs[0].data()['profilepic'];
    setState(() {
      clinicOffDays = '${off}';
      clinicProfilePic ='${pic} ';
    });
    print(clinicOffDays);
    print(clinicProfilePic);
    }); }

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
  late Stream<QuerySnapshot> _noAppointments;
  int serviceAppNo=0;


  //A method to check if the chosen time of appointment is a acceptable by clinic
  bool checkAvailability() {
    // _noAppointments=
        appointments
        .where('clinicEmail', isEqualTo: '${clinicEmail}')
        .where('service', isEqualTo: '${clinicServiceName}')
        .where('date', isEqualTo: '${formattedDate}')
        .where('time', isEqualTo: '${formattedTime}').get().then((value) => serviceAppNo = value.docs.length




        );
        // .snapshots();
    // serviceAppNo = _noAppointments.length;

    var limit=int.parse(ServiceAvailability);

    if (limit>=serviceAppNo) {
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
                    child: Text('الخدمة غير متوفرة بالوقت ',
                        style: TextStyle(fontSize: 20,
                            fontWeight:FontWeight.w500,
                            fontFamily: "Almarai",
                            color: Colors.black)),
                  ),
                  Align(alignment : Alignment.centerRight ,
                    child: Text('! المحدد, الرجاء إختيار وقت آخر',
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
              Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: new BoxDecoration(
                    // border: Border.all(width: 0.5, color: Colors.black),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(clinicProfilePic)
                      )
                  )),
              const SizedBox(
                height:12,
                width:16,
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
                          _date = date.add(Duration(days: 1));
                          formattedDate = date.toString().replaceAll("00:00:00.000", "");
                          print(formattedDate);
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
                    //Set time picker start and end time
                    minHour: getClinicStartTime(startTime),
                    maxHour: getClinicEndTime(endTime),
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
                    //Check if the chosen day is a workday and check information completion and check the service availability
                    if (isWorkday() && isComplete() && checkAvailability()) {
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