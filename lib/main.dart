import 'package:flutter/material.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';
import 'signinScreen.dart';
import 'FirstScreen.dart';


void main() {
  runApp(const HappyPaws());
}

class HappyPaws extends StatelessWidget {
  const HappyPaws ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // Start running the application from the start page
      home: FirstScreen(),
    );

  }
}









