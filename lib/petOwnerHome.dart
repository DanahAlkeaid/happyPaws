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
import 'book_appointment.dart';

const List<Widget> category = <Widget>[
  Text('التقيمم'),
  Text('المسافة'),
  Text('النوع'),
];
//test

class petOwnerHome extends StatefulWidget {
  const petOwnerHome({Key? key}) : super(key: key);

  @override
  State<petOwnerHome> createState() => _petOwnerHomeState();
}


class _petOwnerHomeState extends State<petOwnerHome> {
  final List<bool> _selectedCategory = <bool>[false,true,false];
  bool vertical = false;
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
                            Divider(color: Colors.black54,),
                            ToggleButtons(
                                direction: vertical ? Axis.vertical : Axis.horizontal,
                                onPressed: (int index){
                                  setState(() {
                                    _selectedCategory[index] = !_selectedCategory[index];
                                  });
                                },
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              selectedBorderColor: Color(0xFFC2D961),
                              selectedColor: Color(0xff194919),
                              fillColor: Color(0xFFC2D961),
                              color: Color(0xff194919),
                              constraints: const BoxConstraints(
                                minHeight: 40.0,
                                minWidth: 80.0,
                              ),
                              isSelected: _selectedCategory,
                              children: category,
                            ),
                            Container(height: 20,),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("تطبيق",
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
                   subtitle:
                       Row(
                         children: [
                           const  Padding(padding: EdgeInsets.fromLTRB(79, 0, 0, 0),
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
                           const  Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                             child:Align(
                               alignment:Alignment.center,
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
                         ],
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

}