import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/viewClinic.dart';
import 'dart:async';
import 'clinic_services.dart';



class Report extends StatefulWidget {
  const Report({super.key});

  @override
  _ReportStatus createState() => _ReportStatus();
}

class _ReportStatus extends State<Report> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var clinicName;
  var clinicEmail;


  void initState() {
    super.initState();
    method1();
  }


  late Stream<QuerySnapshot> _clinicsStream;
  method1() {
    _clinicsStream = FirebaseFirestore.instance
        .collection('users')
        .where('type', isEqualTo: 'clinic')
        .snapshots();
  }





  rateAve(email){

    late  Stream<QuerySnapshot> _clinicRate = FirebaseFirestore.instance
        .collection('rating')
        .where('clinic_email', isEqualTo: email)
        .orderBy('date', descending: true)
        .snapshots();

    int numRate=0;
    double TotalRate =0;
    double avgRate=0;
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((snapshot){
      if(snapshot.docs.isNotEmpty){
        setState(() {
          numRate=snapshot.docs.length;

        });

        for(int i=0;i<numRate;i++){

          TotalRate += snapshot.docs[i].data()['rate'];}
        setState(() {
          avgRate=TotalRate/numRate;
        });

        print(avgRate);
        print(TotalRate);
        print(numRate);
      //  'rate' = avgRate;
      }
      else{

      }
    });
    return avgRate;
  }

  makeListTile(QuerySnapshot<Object?> data, int index) => (ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Icon(Icons.keyboard_arrow_left,
        color: Colors.white24, size: 40.0),
    onTap: () {
      clinicEmail = data.docs[index]['email'];
      //the rest of info needed for class clinic details

      // var token = data.docs[index]['token'];
      // var pic = data.docs[index]['EXprofilepic'];

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => viewClinic(title: '',/*المفروض يتغير الكنستركتر تبع كلينك سيرفسس*/)));
    },
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            data.docs[index]['firstname'],
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                fontFamily: 'Tajawal'),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    ),
    subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 252, 163, 77),
          size: 10,
        ),
        Text(//'.',
         rateAve(data.docs[index]['email']).toString(),
          style:
          TextStyle(color: Colors.grey, fontSize: 10),
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    ]),
    trailing:  Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(width: 1.0, color: Color(0xFFd6cdfe)))),

      //here the clinics pic
      child: Icon(
        Icons.warning_amber_rounded,
        color: Color.fromARGB(255, 252, 163, 77),
        size: 40,
      ),
    ),

  ));

  makeCard(QuerySnapshot<Object?> d, int index) => Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    child: Container(
      padding: EdgeInsets.all(10),
      //height: 60,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(1, 1),
                color: Colors.grey.withOpacity(0.20))
          ]),
      child: makeListTile(d, index),
    ),
  );

  makeBody() => Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: _clinicsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('حدث خطأ ما!');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("");
          }

          final data = snapshot.requireData;

          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.size,
            itemBuilder: (BuildContext context, int index) {
              return makeCard(data, index);
            },
          );
        },
      ));

  final topAppBar =  AppBar(
      iconTheme: IconThemeData(color: Color(0xff194919),size: 30),
      actions: [
        IconButton(
          icon: Icon(Icons.calendar_month,
            color: Color(0xff194919),
            size: 30,
          ),
          onPressed: () {
           // Navigator.push(context, MaterialPageRoute(builder: (context) => petOwner_appointments()));
          },
        )
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/App_Header.png'),
              fit: BoxFit.fill
          ),
        ),
      ),
      elevation: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: topAppBar,
      body: makeBody(),
    );
  }
}
