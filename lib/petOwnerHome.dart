import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool isSortedalpha = true;
  bool bottom_sheet = false;
  var clinicsNo;


  TextEditingController search = TextEditingController();
  String searchValue = '';

  
  void initState() {
    super.initState();
    getCurrentUser();
    sortAlpha();
    rateAverage();
    rate();
  }

  getCurrentUser()  {
    final User user = FirebaseAuth.instance.currentUser! ;
    petOwnerEmail = user.email;
  }

  late Stream<QuerySnapshot> _clinicsStream;

  sort() {
    if(isSortedalpha) {
      sortAlpha();
    }
    else {
      sortRate();
    }
  }

  //sorts clinics alphabetically
  sortAlpha() {
    _clinicsStream = FirebaseFirestore.instance
        .collection('users')
        .where('type', isEqualTo: 'clinic').orderBy('firstname')
        .snapshots();
    clinicsNo = _clinicsStream.length;
  }

  //sorts clinics depending on rate
  sortRate() {
    _clinicsStream = FirebaseFirestore.instance
        .collection('users')
        .where('type', isEqualTo: 'clinic').orderBy('rate',descending: true)
        .snapshots();
  }

  //checks if there is a clinic need to be rated by petowner after completed appointment
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

  //calculates the average rate for each clinic
  var noclinics;
  rateAverage(){
    var email;
    FirebaseFirestore.instance
        .collection('users')
        .where('type', isEqualTo: 'clinic').get()
        .then((snapshot){
      if(snapshot.docs.isNotEmpty){
        noclinics=snapshot.docs.length;
        snapshot.docs.forEach((element) {
          email=element['email'];
          int numRate=0;
          double TotalRate =0;
          double avgRate=0;
          FirebaseFirestore.instance
              .collection('rating')
              .where('clinic_email', isEqualTo: email)
              .get()
              .then((snapshot){
            if(snapshot.docs.isNotEmpty){
                numRate=snapshot.docs.length;

              for(int i=0;i<numRate;i++){
                TotalRate += snapshot.docs[i].data()['rate'];}

              avgRate=TotalRate/numRate;
              setState(() async {
                await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                  await myTransaction.update(element.reference, { "rate":avgRate }) ;
                });
              });
            }
            else{
            }
          });
        });
      }
      else{}
    });
  }

  makeListTile(List<QueryDocumentSnapshot<Object?>> data, int index) => (ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Icon(Icons.keyboard_arrow_left,
        color: Colors.white24, size: 40.0),
    onTap: () {
      clinicEmail = data[index]['email'];

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
        child: Container(
            width: 55.0,
            height: 55.0,
            decoration: new BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(data[index]['profilepic'])
                )
            )),

        // child: CircleAvatar(
        //   radius: 55,
        //   backgroundColor: Color(0xfffaf7f4),
        //   // child:borderRadius: BorderRadius.circular(50),
        //   child: Image.network(data[index]['profilepic']),)
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
                                  '..... الترتيب حسب ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 25,color: Color(0xff194919),fontFamily: 'Tajawal',fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                              Container(height: 20,),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isSortedalpha = !isSortedalpha;
                                    sort();
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text(isSortedalpha? "التقييم" : "الأبجدية",
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