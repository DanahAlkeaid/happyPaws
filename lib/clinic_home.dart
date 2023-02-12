import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/clinicMyAccount.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/clinicMyAccount.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'FirstScreen.dart';
import 'MyAccount.dart';
import 'clinicServices.dart';
import 'clinic_appointments.dart';



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
  var profilepic1 ;

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
        .where('email', isEqualTo: '${cEmail}')
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
profilepic1 = snapshot.docs[0].data()['profilepic'];

      setState(() {
        cName='${clinicName} ';

        print(cName);

        // print(exBio);


      });

    }); }

  logout(){
    _auth.signOut();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FirstScreen()));

  }

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
SizedBox(height: 10,),
              // App Logo
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
                        image: new NetworkImage(profilepic1)
                    )
                )),

              //Greetings
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  const SizedBox(height: 20)

                  //Heading
                  ,Text("! مرحبًا  "
                      ,style:TextStyle(
                        fontFamily: "Elmessiri",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                  )
                ],),

              const SizedBox(height: 25)

              //ClinicName
              ,Container(child: Row(
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
                height: 70,
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
                              builder: (context) => clinicServices(cEmail)));
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
                height: 70,
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
                height: 70,
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
                              builder: (context) => clinicMyAccount(cEmail)));
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


              ,Container(
                height: 70,
                width: 270,
                decoration: BoxDecoration(
                    color: Color(0xFFC2D961),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFC2D963),
                      width: 1,
                    )),
                child: ElevatedButton(
                    onPressed: ()  => logout(),

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
          Row(children: [
            SizedBox(
              width: 150,
              height:25 ,
            ),
            Container(
              width: 30,
              height:25 ,
              child: Link(
                target: LinkTarget.blank,
                uri: Uri.parse('https://twitter.com/Happypaws_app'),
                builder: (context, followLink) => ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.twitter,
                    color: Color(0xff194919),
                    size: 30,
                  ),
                  onTap: followLink,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 30,
              height:25 ,
              child: ListTile(
                title: const Text(
                  '',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff194919),
                      fontFamily: 'Tajawal'),
                ),
                leading: const Icon(
                  Icons.mail,
                  color: Color(0xff194919),
                  size: 30,
                ),
                onTap: () async {
                  final toEmail = 'HappyPawsApp@hotmail.com';
                  final url = 'mailto:$toEmail';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
              ),
            )
          ]



          )],),
          ),
        )
    );
  }
}


