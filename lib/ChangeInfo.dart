import 'package:flutter/material.dart';
import 'MyAccount.dart';
class ChangePass extends StatefulWidget{
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePass();
}

class _ChangePass extends State<ChangePass> {
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
                      height: 20,
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

                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "ادخل كلمة المرور الحالية",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
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

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "ادخل كلمة المرور الجديدة ",
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
                          width: 75,
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
                ),

                Container(
                  height: 20,
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
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  color: Color(0xFFC2D961),
                                )))),
                  ),
                ),

                Container(
                  height: 50,
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