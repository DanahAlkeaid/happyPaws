import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/clinicMyAccount.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Alert.dart';
import 'FirstScreen.dart';
import 'MyAccount.dart';
import 'clinic_appointments.dart';
import 'clinic_services.dart';


class clinic_home extends StatefulWidget {
  const clinic_home ({Key? key}) : super (key: key);

  @override
  State<clinic_home> createState() => _clinic_homeState();
}

class _clinic_homeState extends State<clinic_home> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late final Stream<QuerySnapshot> _reqStream;
  var cEmail;
  var cName='';
 // var requestID;
 // late String category;
 // late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    clName();
    openCollection();


  }

  openCollection() {
    _reqStream = FirebaseFirestore.instance
        .collection('users')
        .where('mlEmail', isEqualTo: '${cEmail}')
        .snapshots();
  }

  getCurrentUser()  {
    final User user = _auth.currentUser! ;

    cEmail = user.email;

    print(cEmail) ;

  }


   clName()  {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${cEmail}')
        .get()
        .then((snapshot) { print(snapshot.docs);
      var clinicName=snapshot.docs[0].data()['firstname'];


      setState(() {
        cName='${clinicName} ';

        print(cName);

        // print(exBio);


      });

    }); }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
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

        body:
        SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [

              // App Logo
              Container(
                  child: const Image(alignment: Alignment.center
                      ,fit: BoxFit.contain
                      ,image: AssetImage("Assets/App_Logo.png"
                      ),
                    width: 110,
                    height: 110,
                  )
              )

              //Greetings
              ,Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [

                  //Heading
                  Text("! مرحبًا  "
                      ,style:TextStyle(
                        fontFamily: "Elmessiri",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                  )
                ],),

              //ClinicName
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(' عيادة ${cName}' //Get Clinic Name From DB
                      ,style:TextStyle(
                       fontFamily: "Tajawal",
                        fontSize: 30,
                        color: Color(0xff034D23),
                      )
                  ),
                ],))
              ,const SizedBox(height: 12)

              //Menu Headings
              ,Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 1,
                    )),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => clinic_services()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFC2D961)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: Color(0xFFC2D961),
                                )))),
                    child: const Text(" الخدمات المقدمة",
                        style: TextStyle(fontSize: 28,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              )

              ,const SizedBox(height: 15)

              ,Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 1,
                    )),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => clinic_appointments()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFC2D961)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: Color(0xFFC2D961),
                                )))),
                    child: const Text(" المواعيد المسجلة",
                        style: TextStyle(fontSize: 28,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              )

              ,const SizedBox(height: 15)

              ,Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 1,
                    )),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Alert()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFC2D961)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: Color(0xFFC2D961),
                                )))),
                    child: const Text(" التنبيهات",
                        style: TextStyle(fontSize: 28,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              )

              ,const SizedBox(height: 15)

              ,Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 1,
                    )),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => clinicMyAccount()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFC2D961)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: Color(0xFFC2D961),
                                )))),
                    child: const Text(" حسابي",
                        style: TextStyle(fontSize: 28,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              )

              ,const SizedBox(height: 15)

              /*,Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 1,
                    )),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFC2D961)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: Color(0xFFC2D961),
                                )))),
                    child: const Text(" تواصل معنا",
                        style: TextStyle(fontSize: 28,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              )*/

             /* ,const SizedBox(height: 15)*/

              ,Container(
                height: 60,
                width: 270,
                decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 1,
                    )),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFC2D961)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: Color(0xFFC2D961),
                                )))),
                    child: const Text(" تسجيل الخروج",
                        style: TextStyle(fontSize: 28,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
              ),
Row(children: [SizedBox(width: 150,),Expanded(child: Container(

    child: Link(
      target: LinkTarget.blank,
      uri: Uri.parse('https://twitter.com/Happypaws_app'),
      builder: (context, followLink)=>ListTile(

        leading: const Icon(FontAwesomeIcons.twitter,color: Color(0xff194919),size: 30,),
        onTap: followLink,
      ),
    ),)),
Expanded(child: Container(
  child:  ListTile(
    title: const Text('HappyPawsApp@hotmail.com',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
    leading: const Icon(Icons.mail,color: Color(0xff194919),size: 30,),
    onTap: () async{
      final toEmail='HappyPawsApp@hotmail.com';
      final url='mailto:$toEmail';
      if(await canLaunch (url)){
        await launch(url);
      }
    },
  ),
) ,)

,SizedBox(width: 150,)
],),

/*Row(mainAxisAlignment: MainAxisAlignment.center,
  children: [





],),*/


            ],),
          ),
        )
    );
  }
}


