import 'package:flutter/material.dart';
import 'FirstScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';


Future main() async {
 ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
   backgroundColor: const Color(0xfffaf7f4),
   body: Center(child: CircularProgressIndicator() ,)
 );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(home: FirstScreen()));

}









