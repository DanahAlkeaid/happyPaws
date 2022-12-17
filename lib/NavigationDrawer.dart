import 'package:untitled/FirstScreen.dart';
import 'package:untitled/gpi_page.dart';

import 'petOwnerHome.dart';
import 'MyAccount.dart';
import 'Alert.dart';
import 'gpi_page.dart';
import 'FirstScreen.dart';
import 'package:flutter/material.dart';
class NavigationDrawer extends StatefulWidget{
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) => Drawer(
      backgroundColor: Color(0xfffaf7f4),
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          )
      )
  );

  Widget buildHeader(BuildContext context) => Container(
    color: Color(0xfffaf7f4),
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Column(
      children: const [
        CircleAvatar(
          radius: 50,
          child: Image(image: AssetImage('Assets/profile-icon.png'),
          ),
        ),
        SizedBox(height: 10),
        Text(
          " ",
          style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Tajawal'),
        )
      ],
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle,color: Color(0xff194919),size: 30,),
            title: const Text('حسابي',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyAccount(),
              ));
            },
          ),
          const Divider(color: Colors.black54,),
          ListTile(
            leading: const Icon(Icons.notifications_active,color: Color(0xff194919),size: 30,),
            title: const Text('تنبيهات',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Alert(),
              ));
            },
          ),
          const Divider(color: Colors.black54,),
          ListTile(
            leading: const Icon(Icons.medical_information,color: Color(0xff194919),size: 30,),
            title: const Text('معلومات عامة',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const gpi_page(),
              ));
            },
          ),
          const Divider(color: Colors.black54,),
          ListTile(
            leading: const Icon(Icons.logout,color: Color(0xff194919),size: 30,),
            title: const Text('تسجيل خروج',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const FirstScreen(),
              ));
            },
          ),
          const Divider(color: Colors.black54,),
          Text('تواصل معنا',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
          ListTile(
            title: const Text('@HappyPaws_App',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            leading: const Icon(Icons.telegram,color: Color(0xff194919),size: 30,),
            onTap: (){
              Uri.parse('https://www.twetter.com');
            },
          ),
          ListTile(
            title: const Text('HappyPawsApp@hotmail.com',style: TextStyle(fontSize: 20,color: Color(0xff194919),fontFamily: 'Tajawal'),),
            leading: const Icon(Icons.mail,color: Color(0xff194919),size: 30,),
            onTap: (){
              Uri(
                scheme: 'mailto',
                path: 'HappyPaws_App@hotmail.com',
              );
            },
          )
        ],
      )
  );
}