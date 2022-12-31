import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:untitled/petOwner_appointments.dart';
import 'package:untitled/viewClinic.dart';

import 'NavigationDrawer.dart';

import 'book_appointment.dart';

class petOwnerHome extends StatefulWidget {
  const petOwnerHome({Key? key}) : super(key: key);

  @override
  State<petOwnerHome> createState() => _petOwnerHomeState();
}


class _petOwnerHomeState extends State<petOwnerHome> {

  TextEditingController textController = TextEditingController();
  var doc_id;

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
                              onPressed: () {SortByRate();},
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
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>viewClinic(title: 'clinic',)));
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

  SortByRate() async {
    await FirebaseFirestore.instance
        .collection('users')
        .orderBy('rate', descending: true)
        .get()
        .then((value) {
        value.docs.forEach((element) {
        doc_id = element.id;
        print(doc_id);
      });
    });
  }
}