import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:untitled/userChangePass.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:flutter/gestures.dart';
import 'dart:io';
//import 'dart:html';
import 'package:firebase_storage/firebase_storage.dart';






class clinicChangeInfo extends StatefulWidget{

  final cName;
  final cLocation;
  final cPhonenumber;
  final cEmail;
  final cPic;
  final cStart;
  final cEnd;
  const clinicChangeInfo(this.cName, this.cLocation, this.cPhonenumber, this.cEmail, this.cPic, this.cStart, this.cEnd, {super.key} );

  @override
  State<clinicChangeInfo> createState() => _clinicChangeInfo();
}

class _clinicChangeInfo extends State<clinicChangeInfo> {


   //late var cstime = widget.cStart;
  TimeOfDay start_time = TimeOfDay.now();
 late String formattedStime = widget.cStart;
  void SonTimeChanged(TimeOfDay newTime) {
    setState(() {
      start_time = newTime;
      formattedStime = start_time.toString().replaceAll("(", "").replaceAll(")", "").replaceAll("TimeOfDay", "");
    });
  }
  //End time formatters
  TimeOfDay end_time = TimeOfDay.now();
late String formattedEtime = widget.cEnd;
  void EonTimeChanged(TimeOfDay newTime) {
    setState(() {
      end_time = newTime;
      formattedEtime = end_time.toString().replaceAll("(", "").replaceAll(")", "").replaceAll("TimeOfDay", "");
    });
  }

  File? _photo ;
  final ImagePicker _picker = ImagePicker();
  late String imageURL = widget.cPic;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstnameController = TextEditingController(text:widget.cName);
  late TextEditingController _emailController = TextEditingController(text:widget.cEmail);
  late TextEditingController _phonenumberController = TextEditingController(text:widget.cPhonenumber);
  late TextEditingController _locationController = TextEditingController(text:widget.cLocation);

  String errorMessage = '';
  var loading = false;
var doc_id;
  void dispose() {
    _firstnameController.dispose();
    _emailController.dispose();
    _phonenumberController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext) => Scaffold(
    backgroundColor: Color(0xfffaf7f4),
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
    body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child:SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  ' تعديل معلومات الحساب ',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919),fontFamily: 'ElMessiri'),
                ),

                Container(
                  height: 30,
                ),

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
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),)
                    )
                  ],
                ),

                //Name
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
                      height: 10,
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
                      height: 20,
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
                      height: 10,
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
                      height: 20,
                    )
                  ],
                ),

                Container(
                  height: 20,
                ),

                //location
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                  SizedBox(
                  height: 10,
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
                        controller: _locationController,
                        decoration: InputDecoration(
                            hintText: ("الحي، الشارع "),
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
                ]
              ),


                Container(
                  height: 20,
                ),

                Align(alignment : Alignment.centerRight ,
                  child: Text(
                      "وقت بداية العمل",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal')),
                )
                ,Container(
                  child: createInlinePicker(
                      elevation: 1,
                      value: start_time,
                      onChange: SonTimeChanged,
                      minuteInterval: MinuteInterval.THIRTY,
                      iosStylePicker: true,
                      is24HrFormat: true,
                      //Set start and end time
                      maxMinute:30,
                      //Styling
                      isOnChangeValueMode: true,
                      displayHeader: false,
                      accentColor: Colors.black,
                      barrierColor: Color(0xfffaf7f4),
                      wheelHeight: 50
                  ),
                )

                //End time picker
                ,Align(alignment : Alignment.centerRight ,
                  child: Text(
                      "وقت نهاية العمل",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal')),
                )
                ,Container(
                  child: createInlinePicker(
                      elevation: 1,
                      value: end_time,
                      onChange: EonTimeChanged,
                      minuteInterval: MinuteInterval.THIRTY,
                      iosStylePicker: true,
                      is24HrFormat: true,
                      //Set start and end time
                      maxMinute:30,
                      //Styling
                      isOnChangeValueMode: true,
                      displayHeader: false,
                      accentColor: Colors.black,
                      barrierColor: Color(0xfffaf7f4),
                      wheelHeight: 50
                  ),
                ),

                Container(
                  height: 20,
                ),

                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> userChangePass()));
                    },
                    child: Text(" تغيير كلمة المرور",
                        style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal')),
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

                Container(
                  height: 20,
                ),

                Container(
                 child: SizedBox(
                    child: ElevatedButton(onPressed:(){SaveEdit();},
                      child: Text('حفظ التغييرات',style:TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'))
                      ,style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFC2D961)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Color(0xFFC2D961),
                                )))),),
                ),),
                Container(
                  height: 100,
                )

                ],
            ),

          ),
        ),
      ),
    ),
  );

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
    if (!regex.hasMatch(formEmail)) return 'يرج إدخال عنوان بريد صحيح';
    return null;
  }

  String? validationPhoneNumber(String? formPhoneNumber) {
    RegExp regex =
    RegExp(r'^(00966|966|\+966|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{8})$');
    String phone1 = formPhoneNumber!;


    if (formPhoneNumber == null || formPhoneNumber.trim().isEmpty) {
      return "يرجى إدخال رقم هاتف";
    }
    else if (!regex.hasMatch(phone1)) return" يجب أن يبدأ الرقم بـ 966" ;
    else if (formPhoneNumber.length != 12) {
      return "يجب أن يحتوي الرقم على ١٢ خانة";
    }
    return null;
  }

  SaveEdit() async {
    if (_formKey.currentState!.validate()) {
      try {
        //  uploadimage(profilePic);
        // setState(() {
        // });
        await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: '${widget.cEmail}')
            .get()
            .then((value) {
          value.docs.forEach((element) {
            doc_id = element.id;
            print(doc_id);
          });
        });
        var imge = await FirebaseFirestore.instance
            .collection('users')
            .doc('${doc_id}').update({
          'description': _locationController.text.trim(),
          'firstname': _firstnameController.text.trim(),
          'phonenumber': _phonenumberController.text.trim(),
          'profilepic' :imageURL,
          'StartTime' : formattedStime,
          'EndTime' : formattedEtime,
        }
        );
        Navigator.of(context).pop();
        showPopup();
      }
      catch (error) {
        print("$error");
      }
    } else {
      print("خطأ في تغيير المعلومات الشخصية ");
    }
  }
    showPopup() {
      Alert(
        style: AlertStyle(descStyle:TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal') ),
        context: context,
        desc: "تم حفظ التعديلات بنجاح",
        // desc: "Check your Inbox!",
        closeFunction: null,
        closeIcon: Container(),
        buttons: [],
      ).show();

    }

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
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
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
        _photo = File(pickedFile.path);
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
        _photo = File(pickedFile.path);
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

      Reference ref = FirebaseStorage.instance.refFromURL(widget.cPic);

      //  var firebase_storage;
      // Reference ref = firebase_storage.FirebaseStorage.instance
      //     .ref(destination)
      //     .child('file/');
       await ref.putFile(_photo!);
       imageURL = await ref.getDownloadURL();
    } catch (e) {
      print('error occured');
    }
  }


}


