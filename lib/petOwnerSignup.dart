import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:untitled/loginScreen.dart';
import 'package:untitled/petOwnerHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class petOwnerSignup extends StatefulWidget {
  @override
  _petOwnerSignup createState() => _petOwnerSignup();
}

class _petOwnerSignup extends State<petOwnerSignup> {
  //or final insted of TEC
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';
  var loading = false;
  void dispose() {
    _firstnameController.dispose();
    _emailController.dispose();
    _phonenumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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

  Future signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        addUserDetails(
            _firstnameController.text.trim(),
            _emailController.text.trim(),
            _phonenumberController.text.trim());
        errorMessage = '';
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => petOwnerHome())); //MeterialHomePageRoute
      } on FirebaseAuthException catch (error) {
        errorMessage = error.message!;
      }
      setState(() {});
    }
  }

  Future addUserDetails(String firstName, String email,
      String phoneNumber) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstName,
      'email': email, //'smth@gmail.com'
      'phonenumber': phoneNumber,
      'type': 'petOwner',
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfffaf7f4),
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/App_Header.png'),
                    fit: BoxFit.fill)),
          ),
          elevation: 0),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "تسجيل مُربي جديد",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'ElMessiri'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      //NAME

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "الاسم",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Tajawal'),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 20,
                                      offset: Offset(1, 1),
                                      color: Colors.grey.withOpacity(0.26))
                                ]),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _firstnameController,
                              validator: validateFirstname,
                              decoration: InputDecoration(
                                  hintText: (" "),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),

                      //EMAIL
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "البريد الإلكتروني",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Tajawal'),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 20,
                                      offset: Offset(1, 1),
                                      color: Colors.grey.withOpacity(0.26))
                                ]),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              validator: validationEmail,
                              decoration: InputDecoration(
                                  hintText: ("Example@gmail.com"),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              errorMessage,
                            ),
                          )
                        ],
                      ),
                      //PHONE NUMBER
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "رقم الهاتف",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Tajawal'),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 20,
                                      offset: Offset(1, 1),
                                      color: Colors.grey.withOpacity(0.26))
                                ]),
                            child: new TextFormField(
                              maxLength: 12,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              controller: _phonenumberController,
                              validator: validationPhoneNumber,
                              decoration: InputDecoration(
                                  hintText: ("9665********"),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      //PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "كلمة المرور",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Tajawal'),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 20,
                          ),

                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 20,
                                      offset: Offset(1, 1),
                                      color: Colors.grey.withOpacity(0.26))
                                ]),
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _passwordController,
                                validator: validationPassword,
                              onChanged: (password) =>
                                  onPasswordChanged(password),
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
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: "***********",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                              ),
                            ),
                          ), //password field
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 120,
                                ),
                                Text("تحتوي على 8 حروف أو أرقام"),
                                SizedBox(
                                  width: 10,
                                ),
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
                                          : Border.all(
                                              color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ), //has 8 characters
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 70,
                              ),
                              Text("تحتوي على حرف كبير واحد على الأقل"),
                              SizedBox(
                                width: 10,
                              ),
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
                            ],
                          ), // has one upper case
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    child: ElevatedButton(
                        onPressed: () async {
                            signUp();

                            setState(() {});
                          },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFC2D961)),
                            shape: MaterialStateProperty
                                .all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                      color: Color(0xFFC2D961),
                                    )))),
                        child: Text(
                          'تسجيل المُربي',
                          style:  TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
                        )),
                    height: 50,
                    width: 200,
                    /*decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 5,
                    )),*/
                  ), //sign in container عدلي النافقيتر
                  SizedBox(
                    height: 20,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginScreen()));
                          },
                          child: Text(
                            "سجل دخولك",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Tajawal',
                            ),
                          )),
                      Text(
                        "لديك حساب؟ ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateFirstname(String? formFullname) {
    final validCharacters = RegExp(r'[!@#<>?":_`~;[\]\/|=+)(*&^%0-9-]');

    if (formFullname == null || formFullname.trim().isEmpty) {
      return "يرجى إدخال اسم";
    } else if ((validCharacters.hasMatch(formFullname))) {
      return 'يجب أن يحتوي الاسم على حروف فقط';
    } else if (formFullname != null && formFullname.length < 2) {
      return 'يجب أن يحتوى الاسم على حرفين على الأقل';
    } else
      return null;
  }

  String? validationEmail(String? formEmail) {
    if (formEmail == null || formEmail.trim().isEmpty) {
      return "يرجى إدخال بريد إلكتروني";
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'يرجى إدخال عنوان بريد صحيح';
    return null;
  }

  String? validationPhoneNumber(String? formPhoneNumber) {
    RegExp regex =
    RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$');
    String phone1 = formPhoneNumber!;


    if (formPhoneNumber == null || formPhoneNumber.trim().isEmpty) {
      return "يرجى إدخال رقم هاتف";
    }
    if (!regex.hasMatch(phone1)) return" يجب أن يبدأ الرقم بـ 966" ;
    if (formPhoneNumber.length != 12) {
      return "يجب أن يحتوي الرقم على ١٢ خانة";
    }
    return null;
  }



  String? validationPassword(String? formPassword) {
    if (formPassword == null || formPassword.trim().isEmpty) {
      return "This fiels is required";
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return '';
    return null;
  }
}
