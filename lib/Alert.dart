import 'package:flutter/material.dart';

class Alert extends StatefulWidget{
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext) => Scaffold(
    appBar: AppBar(
      title: const Text('التنبيهات'),
      backgroundColor: Colors.white,

    ),
  );
}