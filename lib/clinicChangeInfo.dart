import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:untitled/clinicMyAccount.dart';
import 'package:untitled/userChangePass.dart';
import 'clinicChangePass.dart';


class clinicChangeInfo extends StatefulWidget{

  final cName;
  final cLocation;
  final cPhonenumber;
  final cEmail;
  const clinicChangeInfo(this.cName, this.cLocation, this.cPhonenumber, this.cEmail, {super.key} );

  @override
  State<clinicChangeInfo> createState() => _clinicChangeInfo();
}

class _clinicChangeInfo extends State<clinicChangeInfo> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstnameController = TextEditingController(text:widget.cName);
  late TextEditingController _emailController = TextEditingController(text:widget.cEmail);
  late TextEditingController _phonenumberController = TextEditingController(text:widget.cPhonenumber);
  late TextEditingController _locationController = TextEditingController(text:widget.cLocation);

  String errorMessage = '';
  var loading = false;
var doc_id;
var nameValue;
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

  SaveEdit() async {
    if (_formKey.currentState!.validate()) {
      try {
        //  uploadimage(profilePic);
        setState(() {
          nameValue = _firstnameController.text;
        });
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
          'phonenumber': _phonenumberController.text.trim()
        }
        );
        Navigator.of(context).pop();
        showPopup();
      }
      catch (error) {
        print("$error");
      }
    } else {
      print("حدث خطأ");
    }
  }
    showPopup() {
      Alert(
        style: AlertStyle(descStyle:TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal') ),
        context: context,
        desc: "تم حفط التعديلات بنجاح",
        // desc: "Check your Inbox!",
        closeFunction: null,
        closeIcon: Container(),
        buttons: [],
      ).show();

    }

  }


