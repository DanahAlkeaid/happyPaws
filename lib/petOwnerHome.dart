import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:untitled/petOwner_appointments.dart';
import 'package:untitled/viewClinic.dart';
import 'NavigationDrawer.dart';


class petOwnerHome extends StatefulWidget {
  const petOwnerHome({Key? key}) : super(key: key);

  @override
  State<petOwnerHome> createState() => _petOwnerHomeState();
}


class _petOwnerHomeState extends State<petOwnerHome> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var clinicName;
  var clinicEmail;

  Future<QuerySnapshot>? list;
  String userNameText ='';

  TextEditingController textController = TextEditingController();
  var doc_id;
  //var clinicEmail;
  late Stream<QuerySnapshot> _clinics;

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

       /* print(avgRate);
        print(TotalRate);
        print(numRate);*/
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
              builder: (context) => viewClinic(clinicEmail,/*المفروض يتغير الكنستركتر تبع كلينك سيرفسس*/)));
    },
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Align(alignment: Alignment.centerRight,
            child: Text(
              data.docs[index]['firstname'],
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
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Color(0xfffaf7f4),
        // child:borderRadius: BorderRadius.circular(50),
        child: Image.network(data.docs[index]['profilepic']),)
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

  makeBody() => SingleChildScrollView(
    child: Center(
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
                ]),
            child: TextField(
              onChanged: (textEntered){
                setState(() {
                  userNameText = textEntered;
                });
                SearchingPost(textEntered);
              },
              decoration: InputDecoration(
                hintText: 'ابحث هنا .......',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                    BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                    BorderSide(color: Colors.white)),
                prefixIcon: IconButton(
                  onPressed: () {
                    SearchingPost(userNameText);
                  },
                  icon: Icon(Icons.search,
                    color: Color(0xff194919),
                    size: 25,),
                ),
                suffixIcon: IconButton(icon: Icon(
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
                                onPressed: () {/*SortByRate();*/},
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
      ]),
    ),
  );

  SearchingPost(String textEntered) {
    list = FirebaseFirestore.instance
        .collection('users')
        .where('type',isEqualTo: 'clinic')
        .where('firstname', isGreaterThanOrEqualTo: textEntered)
        .get();

    setState(() {
      list;
    });

  }

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
        /* Column(
             children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimSearchBar(width: 335,
                    textController: textController,
                    color: Color(0xFFC2D961),
                    onSuffixTap: () {
                      setState(() {
                        textController.clear();
                      });
                    },
                    helpText: "ابحث هنا.....",
                    closeSearchOnSuffixTap: true, onSubmitted: (String ) {  },
                  ),
                  IconButton(icon: Icon(
                    Icons.tune,
                    color: Color(0xff194919),
                    size: 30,),
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
                              onPressed: () {*//*SortByRate();*//*},
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
                ],
              ),


            ],
          ),*/
makeBody()

  );
//تحاج اعادة نظر
//   SortByRate() async {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .orderBy('rate', descending: true)
//         .get()
//         .then((value) {
//         value.docs.forEach((element) {
//         doc_id = element.id;
//         print(doc_id);
//       });
//     });
//   }




}