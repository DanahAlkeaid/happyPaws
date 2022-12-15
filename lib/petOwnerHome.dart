import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'main.dart';
import 'clinicsign.dart';
import 'petOwnerSignin.dart';
import 'signinScreen.dart';
import 'FirstScreen.dart';
import 'NavigationDrawer.dart';
import 'gpi_page.dart';
import 'Alert.dart';
import 'MyAccount.dart';
import 'loginScreen.dart';
import 'petAppointment.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => petAppointment()));
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
        Container(
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
                    closeSearchOnSuffixTap: true,
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
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){},
                 ),
                 Container(height: 20,),
                 const Divider(color: Colors.black54,),
                 ListTile(
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){},
                 ),
                 Container(height: 20,),
                 const Divider(color: Colors.black54,),
                 ListTile(
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){},
                 ),
                 Container(height: 20,),
                 const Divider(color: Colors.black54,),
                 ListTile(
                   leading: const Icon(Icons.star,color: Color(0xffe8c60b),size: 20,),
                   onTap: (){},
                 ),
               ],
             ),

            ],
          ),
          
        ),
      ));

}