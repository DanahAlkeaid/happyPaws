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
    //body: makeBody(),
  );

}