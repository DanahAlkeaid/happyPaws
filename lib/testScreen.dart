import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';

class testScreen extends StatefulWidget {
  const testScreen({Key? key}) : super(key: key);

  @override
  State<testScreen> createState() => _testScreen();
}

class _testScreen extends State<testScreen> { TextEditingController phoneController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
    child: GestureDetector(
      onTap: () {    Navigator.push(context,
      MaterialPageRoute(builder: (context) => clinicsign()));   },
  child: Text( 'اضغط هنا ', style: TextStyle(color: Colors.blueAccent),),
  )));}}
