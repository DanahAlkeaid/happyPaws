import 'package:flutter/material.dart';
import 'package:untitled/petOwnerHome.dart';
import 'ChangePass.dart';
class MyAccount extends StatefulWidget{
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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
                'حسابي',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919),fontFamily: 'ElMessiri'),
              ),

              Container(
                height: 20,
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
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFDDEABF),
                    filled: true,
                    prefixIcon: IconButton(
                    icon: Icon(Icons.edit,color: Color(0xff194919),),
                      onPressed: () {  },
                    ),
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
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFDDEABF),
                    filled: true,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.edit,color: Color(0xff194919),),
                      onPressed: () {  },
                    ),
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
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFDDEABF),
                    filled: true,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.edit,color: Color(0xff194919),),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePass()));
                        },
                    ),
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>petOwnerHome()));
                    },
                    child: Text("حفظ التعديلات",
                        style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal')
                    ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFC2D961)),
                      shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(
                                color: Color(0xFF130160),
                              )))),
                ),
              ),

              Container(
                height: 20,
              ),

              Container(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text("حذف الحساب",
                        style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal')),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFC2D961)),
                      shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(
                                color: Color(0xFF130160),
                              )))),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );
}