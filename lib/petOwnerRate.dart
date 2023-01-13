import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'NavigationDrawer.dart';
import 'rating.dart';



class petOwnerRate extends StatefulWidget {
  final  petOwner_email;

  const petOwnerRate(this.petOwner_email, {super.key});

  @override
  _petOwnerRateStatus createState() => _petOwnerRateStatus();
}

class _petOwnerRateStatus extends State<petOwnerRate> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var clinicName;
  var clinicEmail;

  var doc_id;

  void initState() {
    super.initState();
    method1();
  }
  //هذا بيكون ميثود عند كلاس كلينك ابوينتمنت لما يخلص الموعد ويغير الحاله لدن,بيخلي الريت مبدئيا صفر
  // Future addRating(double rate) async {
  //   // Timestamp date = Timestamp.now();
  //   try{
  //     await FirebaseFirestore.instance.collection('rating').add({
  //       'rate': 0,
  //       'clinic_email':widget.Clinic_email ,
  //       'petOwner_email': widget.PetOwner_email,
  //       'clinic_name':widget.Clinic_name,
  //       'clinic_pic':widget.Clinic_pic,
  //       'status':'yet',
  //     });
  //
  //   }catch(error){
  //     print(error);
  //   }
  //
  // }

  late Stream<QuerySnapshot> _clinicsStream;
  method1() {
    _clinicsStream = FirebaseFirestore.instance
        .collection('rating')
        .where('petOwner_email', isEqualTo: '${widget.petOwner_email}').where('status', isEqualTo:'yet')
        .snapshots();
  }



  makeListTile(QuerySnapshot<Object?> data, int index) => (ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Icon(Icons.keyboard_arrow_left,
        color: Colors.white24, size: 40.0),
    onTap: () {
      clinicEmail = data.docs[index]['clinic_email'];

      MaterialPageRoute(
      builder: (context) => rating(widget.petOwner_email,clinicEmail));


      //the rest of info needed for class clinic details


    },
    //
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            data.docs[index]['clinic_name'],
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
    trailing:  Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(width: 1.0, color: Color(0xFFd6cdfe)))),

      //here the clinics pic
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Color(0xfffaf7f4),
        // child:borderRadius: BorderRadius.circular(50),
        child: Image.network(data.docs[index]['clinic_pic']),)
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

  makeBody() => Column(
    children: [
      Text(
        ' تقييم العيادات ',
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Color(0xff194919),fontFamily: 'ElMessiri'),
      ),
      SizedBox(height: 20,),
  SingleChildScrollView(
  child: SingleChildScrollView(
     child: Container(
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
          )),
  ),
  ),
    ],
  );


  final topAppBar =  AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/App_Header.png'),
                fit: BoxFit.fill
            )
        ),
      ),
      elevation: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: topAppBar,
      drawer: const NavigationDrawer(),
      body: makeBody(),
    );
  }



}


