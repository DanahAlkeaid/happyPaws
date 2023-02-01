import 'package:flutter/material.dart';
import 'package:untitled/PetNotification.dart';
import 'package:untitled/clinicNotification.dart';
import 'clinicsign.dart';
import 'petOwnerSignup.dart';
import 'signupScreen.dart';
import 'FirstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'AndroidNotificationChannel.dart';
import 'package:flutter/rendering.dart';

//hello world
//الووووووو

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title // description
  importance: Importance.max,
);

Future main() async {
 ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
   backgroundColor: const Color(0xfffaf7f4),
   body: Center(child: CircularProgressIndicator() ,)
 );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /*await NotificationService().init(); //
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel); */

  runApp(MaterialApp(home: FirstScreen()));

}

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       navigatorKey: NavigationService.navigatorKey, // set propert
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Firebase Demo',
//       theme: ThemeData(),
//
//     onGenerateRoute: ((settings){
//       if (settings.name == '/clinic_appointments') {
//         final args = settings.arguments as RemoteMessage;
//         return MaterialPageRoute(
//             builder: (context) => clinicNotification());
//       }
//       else if (settings.name == '/petOwner_appointments') {
//         final args = settings.arguments as RemoteMessage;
//         return MaterialPageRoute(
//             builder: (context) => Alert());
//       }
//
//       assert(false, 'Need to impements ${settings.name}');
//       return null;
//     }),
//     );
//   }
// }








