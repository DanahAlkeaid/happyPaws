import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:untitled/petOwner_appointments.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignup.dart';
import 'signupScreen.dart';
import 'FirstScreen.dart';
import 'NavigationDrawer.dart';
import 'gpi_page.dart';
import 'Alert.dart';
import 'MyAccount.dart';
import 'loginScreen.dart';

//test

class petOwnerHome extends StatefulWidget {
  const petOwnerHome({Key? key}) : super(key: key);

  @override
  State<petOwnerHome> createState() => _petOwnerHomeState();
}


class _petOwnerHomeState extends State<petOwnerHome> {
  TextEditingController textController = TextEditingController();
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
                    onPressed: () {},
                  ),
                ],
              ),
             Column(
               children: [
                 ListTile(
                   title: Text('اسم العيادة',
                     textAlign: TextAlign.right,
                     style:TextStyle(
                       fontWeight:FontWeight.w400,
                       fontFamily: "Almarai",
                       fontSize:16,
                       color:Color(0xff034d23),
                     ),
                   ),
                   subtitle: const  Padding(padding: EdgeInsets.fromLTRB(79, 0, 0, 0),
                     child:Align(
                       alignment:Alignment.centerRight,
                       child:Chip(
                         labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal:2),
                         label:const Text("نوع العيادة"),
                         labelStyle: const TextStyle( fontSize:14,
                         fontWeight:FontWeight.w400,
                         fontFamily: "Almarai",
                         color:Color(0xff034d23),
                       ),
                         backgroundColor:Color(0xffD5E694),
                         elevation:0,
                         shadowColor:Color(0xff808080),
                       ),
                     ),
                   ),
                   trailing: const CircleAvatar(radius: 20,
                   child: Image(image: AssetImage('Assets/Pet_House.png')),),
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){},
                 ),
                 Container(height: 20,),
                 const Divider(color: Colors.black54,),
                 ListTile(
                   title: Text('اسم العيادة',
                     textAlign: TextAlign.right,
                     style:TextStyle(
                       fontWeight:FontWeight.w400,
                       fontFamily: "Almarai",
                       fontSize:16,
                       color:Color(0xff034d23),
                     ),
                   ),
                   subtitle: const  Padding(padding: EdgeInsets.fromLTRB(79, 0, 0, 0),
                     child:Align(
                       alignment:Alignment.centerRight,
                       child:Chip(
                         labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal:2),
                         label:const Text("نوع العيادة"),
                         labelStyle: const TextStyle( fontSize:14,
                           fontWeight:FontWeight.w400,
                           fontFamily: "Almarai",
                           color:Color(0xff034d23),
                         ),
                         backgroundColor:Color(0xffD5E694),
                         elevation:0,
                         shadowColor:Color(0xff808080),
                       ),
                     ),
                   ),
                   trailing: const CircleAvatar(radius: 20,
                     child: Image(image: AssetImage('Assets/Pet_House.png')),),
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){},
                 ),
                 Container(height: 20,),
                 const Divider(color: Colors.black54,),
                 ListTile(
                   title: Text('اسم العيادة',
                     textAlign: TextAlign.right,
                     style:TextStyle(
                       fontWeight:FontWeight.w400,
                       fontFamily: "Almarai",
                       fontSize:16,
                       color:Color(0xff034d23),
                     ),
                   ),
                   subtitle: const  Padding(padding: EdgeInsets.fromLTRB(79, 0, 0, 0),
                     child:Align(
                       alignment:Alignment.centerRight,
                       child:Chip(
                         labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal:2),
                         label:const Text("نوع العيادة"),
                         labelStyle: const TextStyle( fontSize:14,
                           fontWeight:FontWeight.w400,
                           fontFamily: "Almarai",
                           color:Color(0xff034d23),
                         ),
                         backgroundColor:Color(0xffD5E694),
                         elevation:0,
                         shadowColor:Color(0xff808080),
                       ),
                     ),
                   ),
                   trailing: const CircleAvatar(radius: 20,
                     child: Image(image: AssetImage('Assets/Pet_House.png')),),
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){},
                 ),
                 Container(height: 20,),
                 const Divider(color: Colors.black54,),
                 ListTile(
                   title: Text('اسم العيادة',
                     textAlign: TextAlign.right,
                     style:TextStyle(
                       fontWeight:FontWeight.w400,
                       fontFamily: "Almarai",
                       fontSize:16,
                       color:Color(0xff034d23),
                     ),
                   ),
                   subtitle: const  Padding(padding: EdgeInsets.fromLTRB(79, 0, 0, 0),
                     child:Align(
                       alignment:Alignment.centerRight,
                       child:Chip(
                         labelPadding:EdgeInsets.symmetric(vertical: 0,horizontal:2),
                         label:const Text("نوع العيادة"),
                         labelStyle: const TextStyle( fontSize:14,
                           fontWeight:FontWeight.w400,
                           fontFamily: "Almarai",
                           color:Color(0xff034d23),
                         ),
                         backgroundColor:Color(0xffD5E694),
                         elevation:0,
                         shadowColor:Color(0xff808080),
                       ),
                     ),
                   ),
                   trailing: const CircleAvatar(radius: 20,
                     child: Image(image: AssetImage('Assets/Pet_House.png')),),
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){},
                 ),

               ],
             ),

            ],
          ),
          ),
        ),
      ),
  );

}