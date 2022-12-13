import 'package:flutter/material.dart';
import 'main.dart';

class clinicsign extends StatefulWidget {
  const clinicsign({Key? key}) : super(key: key);

  @override
  State<clinicsign> createState() => _clinicsign();
}

class _clinicsign extends State<clinicsign> {
  bool checkedValue = false;
  bool newValue = false;

  bool checkedValue1 = false;
  bool newValue1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Image.asset('Assets/header2.png', fit: BoxFit.fill),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "تسجيل عيادة جديدة",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.white,
                      ),
                      Text(
                        "اسم العيادة",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: ' ',
                          ),
                        ),
                      ), //name filed
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.white,
                      ),
                      Text(
                        "رقم الهاتف",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '+9665********',
                          ),
                        ),
                      ), //phone number filed
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.white,
                      ),
                      Text(
                        "كلمة المرور",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '**********',
                          ),
                        ),
                      ), //password filed
                      Text(
                        "نوع العيادة",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      CheckboxListTile(
                        title: Text(" عيادة مركزية"),
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        },
                        controlAffinity:
                        ListTileControlAffinity.leading, //  <-- leading Checkbox
                      ),
                      CheckboxListTile(
                        title: Text(" عيادة متنقلة"),
                        value: checkedValue1,
                        onChanged: (newValue1) {
                          setState(() {
                            checkedValue1 = newValue1!;
                          });
                        },
                        controlAffinity:
                        ListTileControlAffinity.leading, //  <-- leading Checkbox
                      ),
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.white,
                      ),
                      Text(
                        "موقع العيادة",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'الشارع، الحي',
                          ),
                        ),
                      ), //location filed
                      Container(
                        height: 20,
                        width: 200,
                        color: Colors.white,
                      ),
                      Container(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginScreen()));
                            },
                            child: Text("تسجيل العيادة",
                                style: TextStyle(fontSize: 20, color: Colors.black)),
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
                      ), //sign in container عدلي النافقيتر
                    ]))));
  }
}
