
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:untitled/petOwner_appointments.dart';
import 'package:untitled/rating.dart';
import 'package:untitled/viewClinic.dart';
import 'NavigationDrawer.dart';


class petOwnerHome extends StatefulWidget {
  const petOwnerHome({Key? key}) : super(key: key);

  @override
  State<petOwnerHome> createState() => _petOwnerHomeState();
}
//test

class _petOwnerHomeState extends State<petOwnerHome> {


  var clinicName;
  var clinicEmail;
  var petOwnerEmail;
  var doc_id;
  var sorted=false;
  var clinicsNo;


  TextEditingController search = TextEditingController();
  String searchValue = '';


  void initState() {
    super.initState();
    getCurrentUser();
    method1();
    SortByRate();
    rateAverage();
    rate();
  }

  getCurrentUser()  {
    final User user = FirebaseAuth.instance.currentUser! ;
    petOwnerEmail = user.email;
  }

  late Stream<QuerySnapshot> _clinicsStream;
  late Stream<QuerySnapshot> _sortedclinics;

  method1() {
    _clinicsStream = FirebaseFirestore.instance
        .collection('users')
        .where('type', isEqualTo: 'clinic')
        .snapshots();
    clinicsNo=_clinicsStream.length;
  }
var sortedDocs;
  SortByRate() async {

    // _sortedclinics = FirebaseFirestore.instance
    //     .collection('users')
    //     .where('type', isEqualTo: 'clinic')
    //     .orderBy('rate', descending: false)
    //     .snapshots();

    sortedDocs=FirebaseFirestore.instance
        .collection('users')
        .where('type', isEqualTo: 'clinic')
        .orderBy('rate', descending: false).get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        snapshot.docs.forEach((element) {
          doc_id = element.id;
        });
    }
        });
    print('got in method sortbyrate');
  }

  rate(){
    int numRate=0;
    FirebaseFirestore.instance
        .collection('appointments')
        .where('petOwnerEmail', isEqualTo: petOwnerEmail)
        .where('status',isEqualTo: 'موعد مكتمل')
        .where('rated',isEqualTo: 'yet')
        .get()
        .then((snapshot){
      if(snapshot.docs.isNotEmpty){
        setState(() {
          numRate=snapshot.docs.length;

        });
        var clinicE;
        var serviceName;
        for(int i=0;i<numRate;i++){
          clinicE= snapshot.docs[i].data()['clinicEmail'];
          serviceName= snapshot.docs[i].data()['service'];
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => rating(petOwnerEmail,clinicE,serviceName)));

        };

      }
      else{

      }
    });



  }

  rateAverage(){
    var email;
    FirebaseFirestore.instance
        .collection('users')
        .where('type', isEqualTo: 'clinic').get()
        .then((snapshot){
      if(snapshot.docs.isNotEmpty){
        snapshot.docs.forEach((element) {
          doc_id = element.id;
          print(doc_id);
        });
        setState(() {
          clinicsNo=snapshot.docs.length;

        });

        for (int j=0; j<clinicsNo;j++){
          email= snapshot.docs[j]['email'];
          int numRate=0;
          double TotalRate =0;
          double avgRate=0;
          FirebaseFirestore.instance
              .collection('rating')
              .where('clinic_email', isEqualTo: email)
          // .where('status',isEqualTo: 'rated')
              .get()
              .then((snapshot){
            if(snapshot.docs.isNotEmpty){
              setState(() {
                numRate=snapshot.docs.length;

              });

              for(int i=0;i<numRate;i++){

                TotalRate += snapshot.docs[i].data()['rate'];}

              avgRate=TotalRate/numRate;
              setState(() async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('${doc_id}').update({
                  "rate":avgRate,
                }
                );
              });
            }
            else{
            }
          });
        }
      }
      else{}
    });
  }




  rateAve(email) {

    int numRate=0;
    double TotalRate =0;
    double avgRate=0;
    FirebaseFirestore.instance
        .collection('rating')
        .where('clinic_email', isEqualTo: email)
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
        print('in ratAve method');
        changeRate(avgRate , email);

      }
      else{

      }
    });
    return avgRate;
  }
  var document;
  changeRate(rate , email)  {
    try {
      print('in changeRate method');
      FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          document = element.id;
        });
      });
      FirebaseFirestore.instance
          .collection('users')
          .doc('${document}').update({
        "rate": rate,
      }
      );
      print('finished ratAve method');
    }
    catch (error) {
      print("$error");
    }

  }

  // void changesorted() async{
  //   // setState(() {
  //     sorted=!sorted;
  //   // });
  // }

  makeListTile(List<QueryDocumentSnapshot<Object?>> data, int index) => (ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Icon(Icons.keyboard_arrow_left,
        color: Colors.white24, size: 40.0),
    onTap: () {
      clinicEmail = data[index]['email'];
      //the rest of info needed for class clinic details

      // var token = data.docs[index]['token'];
      // var pic = data.docs[index]['EXprofilepic'];

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => viewClinic(clinicEmail)));
    },
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Align(alignment: Alignment.centerRight,
            child: Text(
              data[index]['firstname'],
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Tajawal'),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Align(alignment: Alignment.centerRight,
            child: Text(
              data[index]['description'],
              style: TextStyle(
                  fontSize: 12,
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
    subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 252, 163, 77),
          size: 10,
        ),
        Text(
            data[index]['rate'].toStringAsFixed(2),
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
        child: CircleAvatar(
          radius: 55,
          backgroundColor: Color(0xfffaf7f4),
          // child:borderRadius: BorderRadius.circular(50),
          child: Image.network(data[index]['profilepic']),)
    ),

  ));

  makeCard(List<QueryDocumentSnapshot<Object?>> d, int index) => Card(
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

  makeBody() => SingleChildScrollView(
    child: Column(
        children:[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.26))
                ]
            ),
            child: TextField(
              controller: search,
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
              },
              decoration: InputDecoration(
                hintText: '....... ابحث هنا',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                    BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                    BorderSide(color: Colors.white)),
                prefixIcon:Icon(Icons.search,
                  color: Color(0xff194919),
                  size: 25,
                ),
                suffixIcon:IconButton(icon: Icon(
                  Icons.tune,
                  color: Color(0xff194919),
                  size: 25,),
                  onPressed: () {
                    showModalBottomSheet(
                        isDismissible: true,
                        context: context,
                        builder: (builder){
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 50),
                                height: 200,
                                child: Text(
                                  'الترتيب',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 25,color: Color(0xff194919),fontFamily: 'Tajawal',fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                              Container(height: 20,),
                              ElevatedButton(
                                onPressed: () {
                                  sorted=!sorted;
                                  // changesorted();
                                  // setState(() {
                                  //   sorted=!sorted;
                                  // });
                                },
                                child: Text("التقييم",
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
                            ],
                          );
                        }
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),
          SingleChildScrollView(
            child: SingleChildScrollView(
              child: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                  children: [ StreamBuilder<QuerySnapshot>(
                      stream: _clinicsStream ,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('!حدث خطأ ما');
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Text("");
                        }

                        var documents = snapshot.data!.docs;
                        //filter clinics depending on searchVaule
                        if (searchValue.length > 0) {
                          documents = documents.where((element)
                          {
                            return element
                                .get('firstname')
                                .contains(searchValue);
                          }).toList();
                        }

                        if(sorted){
                          documents=sortedDocs;
                        }

                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          primary: false,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return makeCard(documents, index);
                          },
                        );
                      },
                    ),
                  ],)),
            ),
          ),
        ]),
  );


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
  Widget build(BuildContext context) =>Scaffold(
      backgroundColor: Color(0xfffaf7f4),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xff194919),size: 30),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_month,
                color: Color(0xff194919),
                size: 30,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => petOwner_appointments()));
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
      ),
      drawer: const NavigationDrawer(),
      body:
      makeBody()

  );


}