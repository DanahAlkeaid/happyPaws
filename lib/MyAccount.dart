import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget{
  const MyAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext) => Scaffold(
    appBar: AppBar(
      //title: const Text('حسابي',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919)),),
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