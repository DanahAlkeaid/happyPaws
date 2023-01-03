import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:untitled/petOwner_appointments.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignup.dart';
import 'signupScreen.dart';
import 'FirstScreen.dart';
import 'NavigationDrawer.dart';
import 'gpi_page.dart';
import 'PetNotification.dart';
import 'MyAccount.dart';
import 'loginScreen.dart';
import 'book_appointment.dart';
import 'clinic_services.dart';

class petOwnerHome extends StatefulWidget {
  const petOwnerHome({Key? key}) : super(key: key);

  @override
  State<petOwnerHome> createState() => _petOwnerHomeState();
}


class _petOwnerHomeState extends State<petOwnerHome> {

  TextEditingController textController = TextEditingController();
  var doc_id;
  var clinicEmail;
  late Stream<QuerySnapshot> _clinics;

  void initState() {
    super.initState();
    method1();
  }

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
      body:SafeArea(
        child:
        SingleChildScrollView(
          child:SingleChildScrollView(
            child: Column(
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
                ],
              ),
             Column(
               children: [
                 ListTile(
                   title: Text(' ',
                     textAlign: TextAlign.right,
                     style:TextStyle(
                       fontWeight:FontWeight.w400,
                       fontFamily: "Almarai",
                       fontSize:20,
                       color:Color(0xff034d23),
                     ),
                   ),
                   trailing: const CircleAvatar(radius: 20,
                   child: Image(image: AssetImage('Assets/Pet_House.png')),),
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>book_appointments()));
                     },
                 ),
                 Container(height: 20,),
                 const Divider(color: Colors.black54,),

               ],
             ),

            ],
          ),
          ),
        ),
      ),
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

  method1() {
    _clinics = FirebaseFirestore.instance
        .collection('users')
        .where('type', isEqualTo: 'clinic')
        .snapshots();
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
              builder: (context) => clinic_services(/*المفروض يتغير الكنستركتر تبع كلينك سيرفسس*/)));
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
          Text(
            rateAve(data.docs[index]['email'])+"/5",
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

        }
        else{

        }
      });
    return avgRate;
  }

}