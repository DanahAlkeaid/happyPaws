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
                  'تغيير كلمة المرور',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919),fontFamily: 'ElMessiri'),
              ),

              Container(
                height: 60,
              ),

              Text(
                "ادخل كلمة المرور الحالية",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Tajawal'),
              ),

              Container(
                height: 30,
              ),

              Container(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFDDEABF),
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: '**********',
                  ),
                ),
              ),

              Container(
                height: 40,
              ),

              Text(
                "ادخل كلمة المرور الجديدة",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Tajawal'),
              ),

              Container(
                height: 30,
              ),

              Container(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFDDEABF),
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: '**********',
                  ),
                ),
              ),

              Container(
                height: 40,
              ),

              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccount()));
                    },
                    child: Text("حفظ التعديلات",
                        style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal')),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xFFC2D961)))),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 5,
                    )),
              ),

            ],
          ),
        ),
      ),
    ),
  );
}