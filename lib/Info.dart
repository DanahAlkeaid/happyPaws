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
  );
}