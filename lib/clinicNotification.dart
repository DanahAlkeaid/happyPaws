import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'clinic_appointments.dart';

class clinicNotification extends StatefulWidget{
  const clinicNotification({Key? key}) : super(key: key);

  @override
  State<clinicNotification> createState() => _clinicNotification();
}

class _clinicNotification extends State<clinicNotification>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var uemail;
  late DateTime time =  DateTime.now();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    method1();
    print(time);
  }

  Future getCurrentUser() async {
    final User user = _auth.currentUser!;
    uemail = user.email;
    print(uemail);
  }

  late  Stream<QuerySnapshot> _appointmentStream;

  method1() {
    _appointmentStream = FirebaseFirestore.instance
        .collection('appointments')
        .where('clinicEmail', isEqualTo: '$uemail')
        .where('date', isGreaterThan: DateTime.now().subtract(Duration(days: 7)))
        .orderBy('date', descending: true)
        .snapshots();
  }

  makeListTile(QuerySnapshot<Object?> data, int index) => ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    trailing: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Color(0xFFd6cdfe)))),
        child:IconButton(icon: Icon(
          Icons.notifications_active,
          color: (data.docs[index]['status'] == "موعد قادم")? Color(0xff194919):
          (data.docs[index]['status'] == "موعد ملغى من قبل المربي")? Color.fromARGB(255, 200, 62, 62):
          Color(0xff194919),
          size: 30,
        ),
          onPressed: (){},
        )
    ),
    title: Text((data.docs[index]['status'] == "موعد قادم")? 'موعد قادم':
    (data.docs[index]['status'] == "موعد ملغى من قبل المربي")? 'موعد ملغى من قبل المربي':
      'موعد مكتمل',
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w900,
        fontFamily: 'Tajawal',
        color: (data.docs[index]['status'] == "موعد قادم")? Color(0xff009245):
          (data.docs[index]['status'] == "موعد ملغى من قبل المربي")? Color.fromARGB(255, 200, 62, 62):
          Color(0xff009245),
          ),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('${data.docs[index]['service']} ${data.docs[index]['time']}',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal'),
        ),
        Text(' المربي: ${data.docs[index]['petOwner']} ${timeago.format(data.docs[index]['date'].toDate(), locale: 'en_short')} ',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal'),
        ),
      ],
    ),
  );

  makeCard(QuerySnapshot<Object?> d, int index) => Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    child: Container(
      padding: EdgeInsets.all(10),
      //height: 60,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.20))
          ]),
      child: makeListTile(d, index),
    ),
  );

  makeBody() => SingleChildScrollView(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                'التنبيهات',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919),fontFamily: 'ElMessiri'),
              ),
            ),
          ),
          Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _appointmentStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('حدث خطأ ما!');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("");
                  }

                  final data = snapshot.requireData;

                  if (data.size == 0) {
                    return emptyBody();
                  }

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.size,
                    itemBuilder: (BuildContext context, int index) {
                      return makeCard(data, index);
                    },
                  );
                },
              )),
        ],
      ),
    ),
  );

  emptyBody() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.10,
              ),
              Row(children: [
                Container(
                    padding: EdgeInsets.only(left: 60, bottom: 20),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'ليس لديك اشعارات في هذا الوقت',
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff194919),
                          fontFamily: 'ElMessiri'),
                      textAlign: TextAlign.center,
                    )),
                Expanded(child: Container()),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext) => Scaffold(
    backgroundColor: Color(0xfffaf7f4),
    appBar: AppBar(
        leading: IconButton(
          icon: (Icon(Icons.arrow_back_ios)),
          color: Color(0xff034d23),
          iconSize: 36,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
    body: makeBody(),
  );

}