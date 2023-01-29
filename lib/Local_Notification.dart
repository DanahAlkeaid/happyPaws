import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Notification extends StatefulWidget{
  const Notification({Key? key}) : super(key: key);
  @override
  State<Notification> createState() => _Notification();
}

class _Notification extends State<Notification>{
  late final LocalNotificationService service;

  FirebaseAuth _auth = FirebaseAuth.instance;
  late final Stream<QuerySnapshot> _reqStream;
  var cEmail;
  var pEmail;

  @override
  void initState() {
    super.initState();
    service = LocalNotificationService();
    service.init();
    clEmail();
    ptEmail();
    openCollection();
  }

  openCollection() {
    _reqStream = FirebaseFirestore.instance
        .collection('appointments')
        .snapshots();
  }

  clEmail()  {
    FirebaseFirestore.instance
        .collection('appointments')
        .where('clinicEmail', isEqualTo: '${cEmail}')
        .where('status', isEqualTo: 'موعد ملغى من قبل المربي')
        .get()
        .then((snapshot) { print(snapshot.docs);
    var clinicEmail=snapshot.docs[0].data()['clinicEmail'];
    var status=snapshot.docs[0].data()['status'];

    setState(() {
      cEmail='${clinicEmail} ';
      print(cEmail);
      service.showNotification(id: 0, title: 'title', body: 'body');
    });

    }); }

  ptEmail()  {
    FirebaseFirestore.instance
        .collection('appointments')
        .where('petOwnerEmail', isEqualTo: '${pEmail}')
        .where('status',isEqualTo: 'موعد ملغى من قبل العياده')
        .get()
        .then((snapshot) { print(snapshot.docs);
    var petOwnerEmail=snapshot.docs[0].data()['petOwnerEmail'];

    setState(() {
      pEmail='${petOwnerEmail} ';
      print(pEmail);
    });
    }); }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class LocalNotificationService{
  LocalNotificationService();

  //final _localNotificationService = FlutterLocalNotificationsPlugin();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    //Initialization Settings for Android
    final AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('ic_launcher');

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void onDidReceiveNotificationResponse(NotificationResponse details) async {

  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'channel_id', 'channel_name',
        channelDescription: 'description',
        importance: Importance.max,
    );

    return const NotificationDetails(
      android: androidNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await flutterLocalNotificationsPlugin.show(id, title, body, details);
  }

}