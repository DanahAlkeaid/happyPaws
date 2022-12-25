import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class userChangePass extends StatefulWidget {
  const userChangePass({super.key});

  @override
  State<userChangePass> createState() => _userChangePassState();
}

class _userChangePassState extends State<userChangePass> {
  void initState() {
    super.initState();
    getCurrentUser();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _PassTextController = TextEditingController();
  TextEditingController _CurrTextController = TextEditingController();
  TextEditingController _CPassTextController = TextEditingController();
  var uemail;
  bool obscure = true;
  bool obscure2 = true;
  bool obscure3 = true;
  bool error2 = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Color(0xfffaf7f4),
      appBar: AppBar(
          leading: IconButton(
            icon: (Icon(Icons.arrow_back_ios)),
            color: Color(0xff034d23),
            iconSize: 36,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        color: Color(0xfffaf7f4),
        height: h,
        child: Form(
          key: formKey,
          child: Column(children: [

            Text(
              ' تغيير كلمة المرور ',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919),fontFamily: 'ElMessiri'),
            ),
            SizedBox(
              height: 50,
            ),
            SvgPicture.asset(
              'App_Logo.png',
              height: h * 0.15,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // padding: EdgeInsets.only(left:40, right: 40,),
              alignment: Alignment.centerLeft,
              child: Text(
                "كلمة المرور الحالية",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Tajawal'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              // alignment: Alignment.center,
              width: w * 0.9,
              height: h * 0.1,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validationCurrent,
                obscureText: obscure,
                controller: _CurrTextController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: ("كلمة المرور الحالية"),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: Icon(
                        obscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(left:40, right: 40,),
              alignment: Alignment.centerLeft,
              child: Text(
                'كلمة المرور الجديدة',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Tajawal'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              // alignment: Alignment.center,
              width: w * 0.9,
              height: h * 0.1,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validationPassword,
                obscureText: obscure2,
                controller: _PassTextController,
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: ("كلمة المرور الجديدة"),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure2 = !obscure2;
                        });
                      },
                      icon: Icon(
                        obscure2 ? Icons.visibility : Icons.visibility_off,
                      ),
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              //  padding: EdgeInsets.only(left:40, right: 40,),
              alignment: Alignment.centerLeft,
              child: Text(
                'تأكيد كلمة المرور',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Tajawal'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              // alignment: Alignment.center,
              width: w * 0.9,
              height: h * 0.1,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: ValidateEmpty,
                obscureText: obscure3,
                controller: _CPassTextController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure3 = !obscure3;
                        });
                      },
                      icon: Icon(
                        obscure3 ? Icons.visibility : Icons.visibility_off,
                      ),
                      color: Colors.grey,
                    ),
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: ("تأكيد كلمة المرور"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: w * 0.4,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pop();
                    },
                    child: Text(
                      'إلغاء',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal'),
                    ),
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
                  ),
                ),
                SizedBox(
                  width: w * 0.4,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      await _changePassword(_PassTextController.text.trim(),
                          _CurrTextController.text.trim());
                    },
                    child: Text('تغيير',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal')),
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
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  String? validationCurrent(String? formPassword) {
    if (formPassword == null || formPassword.trim().isEmpty) {
      error2 = false;
      return "Required";
    }
    if (error2) {
      error2 = false;
      return "Wrong Password";
    }
    return null;
  }

  _changePassword(String password, currentPassword) async {
    if (formKey.currentState!.validate()) {
      try {
        User user = await FirebaseAuth.instance.currentUser!;
        final cred = await EmailAuthProvider.credential(
            email: user.email!, password: currentPassword);
        // proceed with password change
        await user.reauthenticateWithCredential(cred).then((value) async {
          Alert(
            style: AlertStyle(titleStyle: TextStyle(fontFamily: 'Tajawal',fontSize: 23,fontWeight: FontWeight.bold),descStyle: TextStyle(fontFamily: 'Tajawal',fontSize: 20,)),
            closeIcon: Container(),
            context: context,
            //image: SvgPicture.asset("img/Q.svg",width: 50,),
            title: "تغيير كلمة المرور",
            desc: "هل أنت متأكد من رغبتك بتغيير كلمة المرور؟",
            buttons: [
              DialogButton(
                child: Text(
                  "إلغاء",
                  style: TextStyle(fontFamily: 'Tajawal', fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: Color(0xFFC2D961),
                radius: BorderRadius.circular(0.0),
              ),
              DialogButton(
                radius: const BorderRadius.all(Radius.circular(6)),
                child: Text(
                  "تغيير",
                  style: TextStyle(fontFamily: 'Tajawal', fontSize: 20),
                ),
                onPressed: () async {
                  await user.updatePassword(password).then((_) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    showPopup();
                  }).catchError((error) {
                    print('ddff' + error);
                  });
                }, //to do
                color: Color(0xFFC2D961),
              ),
            ],
          ).show();
          //للتأكد فقط
          print('succae');
        }).catchError((err) {
          setState(() {
            error2 = true;
          });

          print(err);
        });
      } on FirebaseAuthException catch (e) {
        //handle if reauthenticatation was not successful
      }
    } else {
      print("not validated");
    }
  }

  String? ValidateEmpty(value) {
    if (value != null && value.isEmpty) {
      return "Required";
    } else {
      InputDecoration(
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      );

      if (_CPassTextController.text.trim() != _PassTextController.text.trim()) {
        return ("Password Doesn't match");
      }
    }
  }

  getCurrentUser() {
    final User user = FirebaseAuth.instance.currentUser!;

    uemail = user.email;

    print(uemail);
  }

  String? validationPassword(String? formPassword) {
    if (formPassword == null || formPassword.trim().isEmpty) {
      return "Required";
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return 'Password must be at least 8 characters\ninclude an uppercase letter, number and symbol';
    return null;
  }

  showPopup() {
    Alert(
      style: AlertStyle(titleStyle: TextStyle(fontFamily: 'Tajawal',fontSize: 23,fontWeight: FontWeight.bold),descStyle: TextStyle(fontFamily: 'Tajawal',fontSize: 20,)),
      context: context,
      image: SvgPicture.asset("img/check.svg", width: 50),
      desc: "Password is changed successfully",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [],
    ).show();
  }
}
