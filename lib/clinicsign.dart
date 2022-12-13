import 'package:flutter/material.dart';
import 'main.dart';
import 'signinScreen.dart';
import 'loginScreen.dart';
import 'FirstScreen.dart';

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
  bool isEightChar = false;
  bool hasUpperChar = false;
  bool _isVisible = false;

  onPasswordChanged(String password) {
    final CharRange = RegExp(r'[A-Z]');
    setState(() {
      isEightChar = false;
      if (password.length >= 8) isEightChar = true;

      hasUpperChar = false;
      if (CharRange.hasMatch(password)) hasUpperChar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: SafeArea(
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                    Container(
                      height: 60,
                      width: 200,
                    ),

                    Text(
                      "تسجيل عيادة جديدة",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'ElMessiri'),
                    ),
                    Container(
                      height: 20,
                    ),
                    Text(
                      "اسم العيادة",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'),
                    ),
                    Container(
                      child: TextField(
                        decoration:
                        InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.black)),


                          hintText: ' ',
                        ),
                      ),
                    ), //name filed
                    Container(
                      height: 20,

                    ),
                    Text(
                      "رقم الهاتف",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'),
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black)),

                          hintText: '+9665********',
                        ),
                      ),
                    ), //phone number filed
                    Container(
                      height: 20,

                    ),
                    Text(
                      "كلمة المرور",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 20,
                        ),

                        TextField(
                          onChanged: (password) => onPasswordChanged(password),
                          obscureText: !_isVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              icon: _isVisible
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.black)),
                            
                            hintText: "***********",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                        ), //password field

                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: isEightChar
                                      ? Colors.green
                                      : Colors.transparent,
                                  border: isEightChar
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("تحتوي على 8 حروف أو أرقام")
                          ],
                        ), //has 8 characters
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: hasUpperChar
                                      ? Colors.green
                                      : Colors.transparent,
                                  border: hasUpperChar
                                      ? Border.all(color: Colors.transparent)
                                      : Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("تحتوي على حرف كبير واحد على الأقل")
                          ],
                        ), // has one upper case
                      ],
                    ) //password filed
                    ,
                    Container(
                      height: 20,
                    ),
                    Text(
                      "نوع العيادة",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'),
                    ),
                    CheckboxListTile(
                      title: Text(" عيادة مركزية"),
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: Text(" عيادة متنقلة"),
                      value: checkedValue1,
                      onChanged: (newValue1) {
                        setState(() {
                          checkedValue1 = newValue1!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    Container(
                      height: 20,

                    ),
                    Text(
                      "موقع العيادة",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'),
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
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
                  ])))),
        ));
  }
}
