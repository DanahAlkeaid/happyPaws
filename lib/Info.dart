import 'package:flutter/material.dart';

class Info extends StatefulWidget{
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext) => Scaffold(
    appBar: AppBar(
      title: const Text('معلومات عامة'),
      backgroundColor: Colors.white,

    ),
  );
}