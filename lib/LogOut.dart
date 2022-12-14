import 'package:flutter/material.dart';

class LogOut extends StatelessWidget{
  const LogOut({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext) => Scaffold(
    appBar: AppBar(
      title: const Text('تسجيل خروج'),
      backgroundColor: Colors.white,
    ),
  );
}