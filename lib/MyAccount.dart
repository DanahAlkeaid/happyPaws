import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/petOwnerHome.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'ChangeInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyAccount extends StatefulWidget{
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

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
    body:
    SingleChildScrollView(
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
                        child:Align(
                        child: Text(
                          'petOwner Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Tajawal'),
                        ),
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
                        child:Align(
                          child: Text(
                            'petOwner Email',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Tajawal'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                        child:Align(
                          child: Text(
                            'petOwner Phone',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Tajawal'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),

              Container(
                height: 30,
              ),

              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePass()));
                    },
                    child: Text("تعديل المعلومات",
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
                    onPressed: () {
                      showPopup();
                    },
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
  );


  showPopup() {
    Alert(
      style: AlertStyle(titleStyle: TextStyle(fontSize: 23, color: Colors.black,  fontFamily: 'Tajawal'),descStyle: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal')),
      closeIcon: Container(),
      context: context,
      title: "حذف الحساب",
      desc:
      "هل أنت متأكد من رغبتك بحذف الحساب؟",
      buttons: [
        DialogButton(
          child: Text(
            "إلغاء",
            style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFC2D961),
          radius: BorderRadius.circular(0.0),
        ),
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "حذف",
            style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
          ),
          // onPressed: () => Navigator.pop(context),
          onPressed: () async {
            await DeleteAcc();



          }, //to do
          color: Color.fromARGB(255, 200, 62, 62),

        ),
      ],
    ).show();
  }


   DeleteAcc() async {
    User? user = FirebaseAuth.instance.currentUser;
    user!.delete();
    showPopup2();

    /*final String uid;

    MyAccount({this.uid});

    final CollectionReference userCollection =
    Firestore.instance.collection('users');
    return userCollection.document(uid).delete();*/
  }

  showPopup2() {
    Alert(
      style: AlertStyle(descStyle: TextStyle(fontSize: 22, fontFamily: 'Tajawal')),
      context: context,
      //مو متأكدة من الصورة
      image:SvgPicture.asset("gs://happypaws-49d3d.appspot.com/green.webp",width: 70,) ,
      desc: "تم حذف الحساب",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [



      ],
    ).show();

  }

  }




