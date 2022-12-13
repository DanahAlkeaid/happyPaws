import 'package:flutter/material.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: phoneController,
                decoration: buildInputDecoration(Icons.phone, "Phone"),
                keyboardType: TextInputType.phone,
                onChanged: (value){
                  _formKey.currentState?.validate();
                },
                validator: (value){
                  if(value!.isEmpty){
                    return "Please Enter a Phone Number";
                  }else if(!RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$').hasMatch(value)){
                    return "Please Enter a Valid Phone Number";
                  }
                },
              ),
            ),
          )
        ],
      )
  );
}
}
InputDecoration buildInputDecoration(IconData icons,String hinttext){
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
            color: Colors.green,
            width: 1.5
        )
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide:const  BorderSide(
            color: Colors.blue,
            width: 1.5
        )
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide:const  BorderSide(
            color: Colors.blue,
            width: 1.5
        )
    ),
  );}
