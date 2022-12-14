import 'package:flutter/material.dart';
import 'MyAccount.dart';
class ChangePass extends StatefulWidget{
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePass();
}

class _ChangePass extends State<ChangePass> {
  @override
  Widget build(BuildContext) => Scaffold(
    appBar: AppBar(
        title: const Text('تغيير كلمة المرور'),
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