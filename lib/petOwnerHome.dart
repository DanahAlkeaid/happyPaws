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
              AnimSearchBar(width: 400,
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
              Container(),
            ],
          ),
        ),
      ));

}