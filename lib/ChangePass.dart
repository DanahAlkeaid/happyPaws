import 'package:flutter/material.dart';
import 'MyAccount.dart';
class ChangePass extends StatefulWidget{
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePass();
}

class _ChangePass extends State<ChangePass> {
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

              Column(
                children: [
                  Container(
                    height: 20,
                  ),

                  TextField(
                    onChanged: (password) => onPasswordChanged(password),
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFDDEABF),
                      filled: true,
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