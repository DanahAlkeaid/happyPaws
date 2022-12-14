import 'package:flutter/material.dart';
import 'petOwnerHome.dart';
class petAppointment extends StatefulWidget{
  const petAppointment({Key? key}) : super(key: key);

  @override
  State<petAppointment> createState() => _petAppointment();
}

class _petAppointment extends State<petAppointment> {
  @override
  Widget build(BuildContext) => Scaffold(
    backgroundColor: Color(0xfffaf7f4),
    appBar: AppBar(
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
    body: SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: [
              Text(
                'المواعيد',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919),fontFamily: 'ElMessiri'),
              )
            ],
          ),
        ),
      ),
    ),
  );
}