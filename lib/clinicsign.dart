import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:day_picker/day_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:untitled/clinic_home.dart';
import 'package:untitled/loginScreen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class clinicsign extends StatefulWidget {
  @override
  _clinicsign createState() => _clinicsign();
}

class _clinicsign extends State<clinicsign> {
  late List<String> clinicOffDays;

  List<DayInWeek> _days = [
    DayInWeek(
      "7",
    ),
    DayInWeek("6", isSelected: true),
    DayInWeek(
      "5",
    ),
    DayInWeek(
      "4",
    ),
    DayInWeek(
      "3",
    ),
    DayInWeek(
      "2",
    ),
    DayInWeek(
      "1",
    ),
  ];

  //Start time formatters
  TimeOfDay start_time = TimeOfDay.now();
  String formattedStime = "";
  void SonTimeChanged(TimeOfDay newTime) {
    setState(() {
      start_time = newTime;
      formattedStime = start_time
          .toString()
          .replaceAll("(", "")
          .replaceAll(")", "")
          .replaceAll("TimeOfDay", "");
    });
  }

  //End time formatters
  TimeOfDay end_time = TimeOfDay.now();
  String formattedEtime = "";
  void EonTimeChanged(TimeOfDay newTime) {
    setState(() {
      end_time = newTime;
      formattedEtime = end_time
          .toString()
          .replaceAll("(", "")
          .replaceAll(")", "")
          .replaceAll("TimeOfDay", "");
    });
  }

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  String imageURL = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String errorMessage = '';
  var loading = false;

  void dispose() {
    _firstnameController.dispose();
    _emailController.dispose();
    _phonenumberController.dispose();
    _passwordController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  bool isEightChar = false;
  bool hasUpperChar = false;
  bool _isVisible = false;
  bool checkedValue = false;
  bool newValue = false;
  bool checkedValue1 = false;
  bool newValue1 = false;

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
    var times = int.parse(formattedStime.substring(0, 2));
    var timee = int.parse(formattedEtime.substring(0, 2));
    if (timee <= times)  //to check if opening time is before closing time
      showPopup12();
    else if (imageURL == '') //to check if the clinic has upload profile picture
      showPopup11();
    else if (_formKey.currentState!.validate()) {
      try {  // create user account with entered information
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        addUserDetails(
          _firstnameController.text.trim(),
          _emailController.text.trim(),
          _phonenumberController.text.trim(),
          _locationController.text.trim(),
        );

        errorMessage = '';
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => clinic_home()));
      } on FirebaseAuthException catch (error) { // check if there exist user with same email
        if (error.message! == "auth/email-already-in-use") {
          errorMessage = "هذا البريد الالكتروني موجود مسبقاً";
        }
      }
    }
  }

  Future addUserDetails(String firstName, String email, String phoneNumber,
      String location) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstName,
      'email': email, //'smth@gmail.com'
      'phonenumber': phoneNumber,
      'type': 'clinic',
      'description': location,
      'profilepic': imageURL,
      'StartTime': formattedStime,
      'EndTime': formattedEtime,
      'rate': 0,
      'offDays': clinicOffDays
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfffaf7f4),
      appBar: AppBar(
          leading: IconButton(
            icon: (const Icon(Icons.arrow_back_ios)),
            color: const Color(0xff034d23),
            iconSize: 36,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                  //Page Title

                  Column(
                    children: <Widget>[
                      Text(
                        "تسجيل عيادة جديدة",
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
//profile pic
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Color(0xfffaf7f4),
                                child: _photo != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(
                                          _photo!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        width: 100,
                                        height: 100,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                              ))
                        ],
                      ),

                      //Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "اسم العيادة",
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

                      //PASSWORD Title
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

                      // Password field and conditions
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
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
                                Text(
                                  "تحتوي على 8 حروف أو أرقام",
                                  style: TextStyle(fontFamily: 'Tajawal'),
                                ),
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
                                          ? Border.all(
                                              color: Colors.transparent)
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
                              Text(
                                "تحتوي على حرف كبير واحد على الأقل",
                                style: TextStyle(fontFamily: 'Tajawal'),
                              ),
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
                          ), // has one upper case
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //Location Title
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "موقع العيادة",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Tajawal'),
                        ),
                      ),

                      //Location Field
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
                          controller: _locationController,
                          decoration: InputDecoration(
                              hintText: ("الحي، الشارع "),
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
                        height: 20,
                      ),

                      //Start time picker
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("وقت بداية العمل",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Tajawal')),
                      ),
                      Container(
                        child: createInlinePicker(
                            elevation: 1,
                            value: start_time,
                            onChange: SonTimeChanged,
                            minuteInterval: MinuteInterval.THIRTY,
                            iosStylePicker: true,
                            is24HrFormat: true,
                            //Set start and end time
                            maxMinute: 30,
                            //Styling
                            isOnChangeValueMode: true,
                            displayHeader: false,
                            accentColor: Colors.black,
                            barrierColor: Color(0xfffaf7f4),
                            wheelHeight: 50),
                      )

                      //End time picker
                      ,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("وقت نهاية العمل",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Tajawal')),
                      ),
                      Container(
                        child: createInlinePicker(
                            elevation: 1,
                            value: end_time,
                            onChange: EonTimeChanged,
                            minuteInterval: MinuteInterval.THIRTY,
                            iosStylePicker: true,
                            is24HrFormat: true,
                            //Set start and end time
                            maxMinute: 30,
                            //Styling
                            isOnChangeValueMode: true,
                            displayHeader: false,
                            accentColor: Colors.black,
                            barrierColor: Color(0xfffaf7f4),
                            wheelHeight: 50),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "أيام الإجازة",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Tajawal'),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "(واحد هو يوم الأحد وهكذا)",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Tajawal'),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectWeekDays(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            days: _days,
                            border: false,
                            boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                colors: [
                                  const Color(0xffD5E694),
                                  const Color(0xff034d23)
                                ],
                                tileMode: TileMode
                                    .repeated, // repeats the gradient over the canvas
                              ),
                            ),
                            onSelect: (values) {
                              // <== Callback to handle the selected days
                              print(values);
                              clinicOffDays = (values);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      )
                      //Sign Up Buttons
                      ,
                      Container(
                        child: ElevatedButton(
                            onPressed: () {
                              print(clinicOffDays);
                              signUp();
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFC2D961)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          color: Color(0xFFC2D961),
                                        )))),
                            child: Text(
                              'تسجيل العيادة',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: 'Tajawal'),
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
                    ],
                  ),

                  // Have Account? Log In Here
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
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool? validateWorkingHours(String? stime, etime) {
    var times = int.parse(stime!.substring(0, 2));
    var timee = int.parse(etime!.substring(0, 2));
    if (timee <= times)
      return false;
    else
      return true;
  }

  String? validateFirstname(String? formFullname) {
    final validCharacters = RegExp(r'[!@#<>?":_`~;[\]\/|=+)(*&^%0-9-]');

    if (formFullname == null || formFullname.trim().isEmpty) {
      return "يرجى إدخال اسم";
    } else if ((validCharacters.hasMatch(formFullname))) {
      return 'يجب أن يحتوي الاسم على حروف فقط';
    } else if (formFullname.length < 2) {
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
    if (!regex.hasMatch(phone1)) return " يجب أن يبدأ الرقم بـ 966";
    if (formPhoneNumber.length != 12) {
      return "يجب أن يحتوي الرقم على ١٢ خانة";
    }
    return null;
  }

  String? validationPassword(String? formPassword) {
    if (formPassword == null || formPassword.trim().isEmpty) {
      return "هذه الخانة مطلوبة";
    }
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword)) return '';
    return null;
  }
// add profile picture options (camera or upload from album)
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('ألبوم الكاميرا'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('الكاميرا'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future imgFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path); // get image path to store in the database
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path); // get image path to store in the database
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = Path.basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      Reference ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
      imageURL = await ref.getDownloadURL();
    } catch (e) {
      print('error occured');
    }
  }

  void showPopup11() {
    Alert(
      style: AlertStyle(
          descStyle: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: 'Tajawal')),
      context: context,
      desc: "يرجى إضافة صورة للعيادة",
      // desc: "Check your Inbox!",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
        DialogButton(
          child: Text(
            "حسناً",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFC2D961),
          radius: BorderRadius.all(Radius.circular(15)),
        )
      ],
    ).show();
  }

  void showPopup12() {
    Alert(
      style: AlertStyle(
          descStyle: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: 'Tajawal')),
      context: context,
      desc: "يجب أن يكون وقت بداية العمل قبل وقت نهاية العمل",
      // desc: "Check your Inbox!",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
        DialogButton(
          child: Text(
            "حسناً",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFC2D961),
          radius: BorderRadius.all(Radius.circular(15)),
        )
      ],
    ).show();
  }
}
