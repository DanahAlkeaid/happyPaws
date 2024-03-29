import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'clinic_home.dart';
import 'FirstScreen.dart';
import 'clinicChangeInfo.dart';

class clinicMyAccount extends StatefulWidget{
  const clinicMyAccount(cEmail, {Key? key}) : super(key: key);

  @override
  State<clinicMyAccount> createState() => _clinicMyAccount();
}
class _clinicMyAccount extends State<clinicMyAccount> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  late final Stream<QuerySnapshot> _reqStream;
  var cName='';
  var cEmail;
  var cPhone;
  var cLocation;
  var cPic;
  var cStart;
  var cEnd;


  void initState() {
    super.initState();
    getCurrentUser();
    clInfo();

  }


  getCurrentUser()  {
    final User user = _auth.currentUser! ;
    cEmail = user.email;
  }

  clInfo()  {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${cEmail}')
        .get()
        .then((snapshot) { print(snapshot.docs[0].data());
    var clinicName=snapshot.docs[0].data()['firstname'];
    var clinicPhone=snapshot.docs[0].data()['phonenumber'];
    var clinicLocation=snapshot.docs[0].data()['description'];
    var profilePic =snapshot.docs[0].data()['profilepic'];
    var startTime =snapshot.docs[0].data()['StartTime'];
    var endTime =snapshot.docs[0].data()['EndTime'];
    setState(() {
      cName='${clinicName} ';
      cPhone='${clinicPhone} ';
      cLocation='${clinicLocation}';
      cPic = '${profilePic}';
      cStart= '${startTime}';
      cEnd= '${endTime}';
    });

    }); }





  @override
  Widget build(BuildContext) => Scaffold(
    backgroundColor: Color(0xfffaf7f4),
    appBar: AppBar(
        leading: IconButton(
          icon: (Icon(Icons.arrow_back_ios)),
          color: Color(0xff034d23),
          iconSize: 36,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>clinic_home()));
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
                  width: 120.0,
                  height: 120.0,
                  decoration: new BoxDecoration(
                    // border: Border.all(width: 0.5, color: Colors.black),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(cPic)
                      )
                  )),

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
                            '${cName}',
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
                            '${cEmail}',
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
                            '${cPhone}',
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
                        child:Align(
                          child: Text(
                            '${cLocation}',
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

                  SizedBox(height: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          " أوقات العمل",
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
                            '${cStart} - ${cEnd}',
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
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => clinicChangeInfo(
                              cName, cLocation,cPhone, cEmail, cPic, cStart, cEnd)),
                    ).then((value) => _stateUpdate());
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

              SizedBox(height: 100,),

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
      " هل أنت متأكد من رغبتك بحذف الحساب؟",
      buttons: [
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "إلغاء",
            style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFC2D961),
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
    showPopup2();

  }

  showPopup2() {
    Alert(
      style: AlertStyle(descStyle: TextStyle(fontSize: 22, fontFamily: 'Tajawal')),
      context: context,
      //عيت تشتغل الصوره
      image: Image( width: 70,
        image: AssetImage("Assets/green.webp"),
      ),       /*SvgPicture.asset("gs://happypaws-49d3d.appspot.com/green.webp",width: 70,) ,*/
      desc: "تم حذف الحساب",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "حسناً",
            style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
          ),
          // onPressed: () => Navigator.pop(context),
          onPressed: () async {
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FirstScreen()));




          }, //to do
          color: Color(0xFFC2D961),

        ),
      ],
    ).show();

  }

  void _stateUpdate() {
    setState(() {
      getCurrentUser();
      clInfo();
    });
    print("تم تحديث البيانات");
  }

}