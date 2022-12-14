import 'package:flutter/material.dart';
import 'ChangePass.dart';
class MyAccount extends StatelessWidget{
  const MyAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext) => Scaffold(
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
                'حسابي',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919),fontFamily: 'ElMessiri'),
              ),

              Container(
                child: CircleAvatar(
                  radius: 50,
                  child: Image(image: AssetImage('Assets/profile-icon.png'),
                  ),
                ),
              ),

              Container(
                height: 40,
              ),

              Text(
                "الأسم",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Tajawal'),
              ),
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.edit,color: Color(0xff194919),),
                    ),
                  ],

                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),

              Container(
                height: 40,
              ),

              Text(
                "رقم الهاتف",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Tajawal'),
              ),
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.edit,color: Color(0xff194919),),
                    ),
                  ],

                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: '+9665********',
                  ),
                ),
              ),

              Container(
                height: 20,
              ),

              Text(
                "كلمة المرور",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: 'Tajawal'),
              ),
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ChangePass()));
                      },
                      icon: const Icon(Icons.edit,color: Color(0xff194919),),
                    ),
                  ],

                ),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: '**********',
                  ),
                ),
              ),

              Container(
                height: 10,
              ),

              Container(
                child: ElevatedButton(
                    onPressed: () {},
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

              Container(
                height: 20,
              ),

              Container(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text("حذف التعديلات",
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