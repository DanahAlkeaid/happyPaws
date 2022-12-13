import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FirstScreen()));
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
//dalia
class _FirstScreenState extends State<FirstScreen> {
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(
              image: AssetImage("Assets/logo1.png"),
            ), //hh
            Text(
              "مرحبًا",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, fontFamily: 'ElMessiri'),
            ),
            Container(
              height: 20,
              width: 200,
              color: Colors.white,
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginScreen()));
                  },
                  child: Text("تسجيل دخول",
                      style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'fonts/Tajawal-Regular.ttf')),
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
            ), //login container
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
                            builder: (context) => signinScreen()));
                  },
                  child: Text("تسجيل جديد",
                      style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'fonts/Tajawal-Regular.ttf')),
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
            ), //sign in container
            Container(
              height: 30,
              width: 200,
              color: Colors.white,
            ),
          ]),
        ),
      ),
    );
  }
}

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
                "معلومات تسجيل الدخول",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
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
                "نسيت كلمة المرور؟",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
              ),
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ), //forget password
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
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
                    child: Text("تسجيل الدخول",
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
              ), //login container عدلي النافقيتر
            ]))));
  }
}

class signinScreen extends StatefulWidget {
  const signinScreen({Key? key}) : super(key: key);

  @override
  State<signinScreen> createState() => _signinScreen();
}

class _signinScreen extends State<signinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Picture1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
                child: Column(children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context); //action coe when button is pressed
                },
                icon: Icon(Icons.send),
              ),
              Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      "! أهلًا بك ",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                    ),
                    Container(
                      height: 20,
                      width: 200,
                      color: Colors.white,
                    ),
                    Text(
                      "هل أنت؟",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
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
                                    builder: (context) => petOwnerSignin()));
                          },
                          child: Text("مُربي",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color(0xFFC2D961)))),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFC2D961),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFFC2D963),
                            width: 5,
                          )),
                    ), //مربي container
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
                                    builder: (context) => clinicsign()));
                          },
                          child: Text("عيادة ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color(0xFFC2D961)))),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFC2D961),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFFC2D963),
                            width: 5,
                          )),
                    ), //عيادة container عدلي النافقيتر
                  ]))
            ]))));
  }
}

class petOwnerSignin extends StatefulWidget {
  const petOwnerSignin({Key? key}) : super(key: key);

  @override
  State<petOwnerSignin> createState() => _petOwnerSignin();
}

class _petOwnerSignin extends State<petOwnerSignin> {
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
                "تسجيل مُربي جديد",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
              Text(
                "الاسم",
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
              Container(
                height: 20,
                width: 200,
                color: Colors.white,
              ),
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
                    child: Text("تسجيل المُربي",
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
