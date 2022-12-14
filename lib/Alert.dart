import 'package:flutter/material.dart';

class Alert extends StatelessWidget{
  const Alert({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext) => Scaffold(
    appBar: AppBar(
      title: const Text('التنبيهات'),
      backgroundColor: Colors.white,

    ),
  );
}