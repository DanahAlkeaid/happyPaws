import 'dart:io';
import 'package:untitled/FirstScreen.dart';
import 'package:untitled/clinic_Rate.dart';
import 'package:untitled/gpi_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/petOwnerRate.dart';
import 'package:url_launcher/link.dart';
import 'petOwnerHome.dart';
import 'MyAccount.dart';
import 'PetNotification.dart';
import 'gpi_page.dart';
import 'FirstScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/services/platform_channel.dart';
import 'package:url_launcher/src/link.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/gpi_page.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MyAccount.dart';
import 'PetNotification.dart';

class NavigationDrawer extends StatefulWidget{
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late final Stream<QuerySnapshot> _reqStream;
  var pEmail;
  var pName='';

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    petName();
    openCollection();
  }

  openCollection() {
    _reqStream = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${pEmail}')
        .snapshots();
  }

  getCurrentUser()  {
    final User user = _auth.currentUser! ;

    pEmail = user.email;

    print(pEmail) ;

  }

  petName()  {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${pEmail}')
        .get()
        .then((snapshot) { print(snapshot.docs);
    var petOwnerName=snapshot.docs[0].data()['firstname'];

    setState(() {
      pName='${petOwnerName} ';

      print(pName);
    });

    }); }

  logout(){
    _auth.signOut();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FirstScreen()));

  }

  @override
  Widget build(BuildContext context) => Drawer(
      backgroundColor: Color(0xfffaf7f4),
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          )
      )
  );

  Widget buildHeader(BuildContext context) => Container(
    color: Color(0xfffaf7f4),
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Column(
      children: [
        SizedBox(height: 10),
        Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle,

            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: CircleAvatar(

            backgroundColor: Colors.white70,
            radius: 50,
            child: Icon(
              Icons.person,
              color: Color(0xff194919),
              size: 90,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '${pName}',
          style:
          TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Tajawal'),
        ),
      ],
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle,color: Color(0xff194919),size: 30,),
            title: const Text('حسابي',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyAccount(pEmail),
              ));
            },
          ),

          const Divider(color: Colors.black54,),
          ListTile(
            leading: const Icon(Icons.medical_information,color: Color(0xff194919),size: 30,),
            title: const Text('معلومات عامة',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const gpi_page(),
              ));
            },
          ),

          const Divider(color: Colors.black54,),
          ListTile(
            leading: const Icon(Icons.logout,color: Color(0xff194919),size: 30,),
            title: const Text('تسجيل خروج',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            onTap: ()   => logout(),
          ),
          const Divider(color: Colors.black54,),
          Text('تواصل معنا',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),

  Row(children: [
  SizedBox(
  width: 5,
  height:10 ,
  ),
  Container(
  width: 30,
  height:15 ,
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
  width: 20,
  ),
  Container(
  width: 30,
  height:15 ,
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
  )],
      ),
  );
}