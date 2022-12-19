import 'package:flutter/material.dart';
import 'package:untitled/petOwnerHome.dart';
import 'ChangePass.dart';
class MyAccount extends StatefulWidget{
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();

  String errorMessage = '';
  var loading = false;

  void dispose() {
    _firstnameController.dispose();
    _emailController.dispose();
    _phonenumberController.dispose();
    super.dispose();
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
    body: Form(
    child:SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
          child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'حسابي',
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

              Container(
                child: CircleAvatar(
                  radius: 50,
                  child: Image(image: AssetImage('Assets/profile-icon.png'),
                  ),
                ),
              ),

              Container(
                height: 30,
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
                              prefixIcon: IconButton(
                                icon: Icon(Icons.edit,color: Color(0xff194919),),
                                onPressed: () { },
                              ),
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
                              prefixIcon: IconButton(
                                icon: Icon(Icons.edit,color: Color(0xff194919),),
                                onPressed: () { },
                              ),
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
                              prefixIcon: IconButton(
                                icon: Icon(Icons.edit,color: Color(0xff194919),),
                                onPressed: () { },
                              ),
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
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: Icon(Icons.edit,color: Color(0xff194919),),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePass()));
                              },
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
                    ],
                  ),
                ],
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
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: Color(0xFFC2D961),
                              )))),
                ),
              ),

SizedBox(height: 50,),

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
    //String msg = '';
    if (formPhoneNumber == null || formPhoneNumber.trim().isEmpty) {
      return "يرجى إدخال رقم هاتف";
    }

    if (formPhoneNumber.length != 12) {
      return "يجب أن يحتوي الرقم على ١٢ خانة";
    }
    return null;
  }
}




