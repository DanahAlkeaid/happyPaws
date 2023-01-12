import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class viewClinic extends StatefulWidget {
  // final title;
  // const viewClinic({Key? key, required this.title}) : super(key: key);

  final String cEmail;

  const viewClinic(this.cEmail, {super.key});

  @override
  State<viewClinic> createState() => _viewClinicState();
}

class _viewClinicState extends State<viewClinic> {
  static String mainFontName = "ElMessiri";
  static String secondaryFontName = "Tajawal";

  late TextEditingController _emailController =
  TextEditingController(text: widget.cEmail);

  var EndTime = '';
  var StartTime = '';
  var description = '';
  var email = '';
  var firstName = '';
  var phonenumber = '';
  var profilepic = '';
  var type = '';

  Map<String, dynamic> cServices = Map();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> mServices =
  []; // Medical services
  List<QueryDocumentSnapshot<Map<String, dynamic>>> mGrooming =
  []; // Grooming services
  List<QueryDocumentSnapshot<Map<String, dynamic>>> mTruck =
  []; // Truck services
  List<QueryDocumentSnapshot<Map<String, dynamic>>> mOthers =
  []; // others services

  static Color backgroundColor = Color(0xfffaf7f4);
  static Color mainTextColor = Color(0xff034d23);
  static Color secondaryTextColor = Color(0xff489f6d);

  static TextStyle titleTextStyle =
  TextStyle(color: mainTextColor, fontFamily: mainFontName, fontSize: 30);
  static TextStyle subTextStyle =
  TextStyle(color: secondaryTextColor, fontFamily: secondaryFontName, fontSize: 22);
  static TextStyle tileHeaderTextStyle = TextStyle(
      color: mainTextColor,
      fontFamily: mainFontName,
      fontSize: 16,
      fontWeight: FontWeight.bold);
  static TextStyle tileTextStyle =
  TextStyle(color: secondaryTextColor, fontFamily: secondaryFontName, fontSize: 15);

  String clinic_image_url = 'https://googleflutter.com/sample_image.jpg';

  void initState() {
    super.initState();
    //getSelectedClinic();
    email = '${widget.cEmail}';
    clInfo();
  }

  clInfo() async {
    // Process users
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: this.email)
        .get()
        .then((snapshot) {
      print(snapshot.docs[0].data());

      setState(() {
        EndTime = snapshot.docs[0].data()['EndTime'];
        StartTime = snapshot.docs[0].data()['StartTime'];
        description = snapshot.docs[0].data()['description'];
        firstName = snapshot.docs[0].data()['firstname'];
        phonenumber = snapshot.docs[0].data()['phonenumber'];
        profilepic = snapshot.docs[0].data()['profilepic'];
        type = snapshot.docs[0].data()['type'];
      });
    });

    // Services lists section
    // After collecting services,
    // Process services
    // Build list of services by medical
    await FirebaseFirestore.instance
        .collection('services')
        .where('type', isEqualTo: 'medical')
        .where('clinicEmail', isEqualTo: this.email)
        .get()
        .then((snapshot) {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> medicalServices =
          snapshot.docs;
      print(medicalServices);

      // Do this for others
      setState(() {
        mServices = medicalServices;
      });
    });

    // Process services
    // Build list of services by grooming
    await FirebaseFirestore.instance
        .collection('services')
        .where('type', isEqualTo: 'grooming')
        .where('clinicEmail', isEqualTo: this.email)
        .get()
        .then((snapshot) {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> grooming =
          snapshot.docs;
      print(grooming);

      setState(() {
        mGrooming = grooming;
      });
    });

    // Process services
    // Build list of services by truck
    await FirebaseFirestore.instance
        .collection('services')
        .where('type', isEqualTo: 'truck')
        .where('clinicEmail', isEqualTo: this.email)
        .get()
        .then((snapshot) {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> truckServices =
          snapshot.docs;
      print(truckServices);

      setState(() {
        mTruck = truckServices;
      });
    });

    // Process services
    // Build list of services by others
    await FirebaseFirestore.instance
        .collection('services')
        .where('type', isEqualTo: 'others')
        .where('clinicEmail', isEqualTo: this.email)
        .get()
        .then((snapshot) {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> othersServices =
          snapshot.docs;
      print(othersServices);

      setState(() {
        mOthers = othersServices;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
          leading: IconButton(
            icon: (const Icon(Icons.arrow_back_ios)),
            color: const Color(0xff034d23),
            iconSize: 36,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/App_Header.png'),
                    fit: BoxFit.fill)),
          ),
          elevation: 0), // appBar

      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
              ),
              Container(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xfffaf7f4),
                    // child:borderRadius: BorderRadius.circular(50),
                    child: Image.network(profilepic),
                  )),
              Container(
                height: 50,
              ),
              Text(
                '${firstName}',
                style: titleTextStyle,
              ),
              Text(
                '${description}',
                style: subTextStyle,
              ),
              Container(
                height: 25,
              ),
              ExpansionTile(
                title: Text(
                  "خدمات االتنظيف والتزيين",
                  textDirection: TextDirection.rtl,
                  style: tileHeaderTextStyle,
                ),
                children: getGroomingServicesTiles(),
              ),
              ExpansionTile(
                title: Text(
                  "خدمات علاجية",
                  textDirection: TextDirection.rtl,
                  style: tileHeaderTextStyle,
                ),
                children: getMedicalServicesTiles(),
              ),
              ExpansionTile(
                title: Text(
                  "خدمات متنقلة",
                  textDirection: TextDirection.rtl,
                  style: tileHeaderTextStyle,
                ),
                children: getMobileServicesTiles(),
              ),
              ExpansionTile(
                title: Text(
                  "خدمات اخرى",
                  textDirection: TextDirection.rtl,
                  style: tileHeaderTextStyle,
                ),
                children: getOtherTiles(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getGroomingServicesTiles() {
    List<Widget> services = [];

    mGrooming.forEach((element) {
      services.add(
        ListTile(
            leading: Text(
              element.data()['price'] + 'رس ',
              textDirection: TextDirection.rtl,
              style: tileTextStyle,
            ),
            title: Text(element.data()['name'],
                textDirection: TextDirection.rtl, style: tileTextStyle)),
      );
    });

    return services;
  }

  List<Widget> getMedicalServicesTiles() {
    List<Widget> services = [];

    mServices.forEach((element) {
      services.add(
        ListTile(
            leading: Text(
              element.data()['price'] + ' رس',
              textDirection: TextDirection.rtl,
              style: tileTextStyle,
            ),
            title: Text(element.data()['name'],
                textDirection: TextDirection.rtl, style: tileTextStyle)),
      );
    });

    return services;
  }

  List<Widget> getMobileServicesTiles() {
    List<Widget> services = [];

    mTruck.forEach((element) {
      services.add(
        ListTile(
            leading: Text(
              element.data()['price'] + 'رس ',
              textDirection: TextDirection.rtl,
              style: tileTextStyle,
            ),
            title: Text(element.data()['name'],
                textDirection: TextDirection.rtl, style: tileTextStyle)),
      );
    });

    return services;
  }

  List<Widget> getOtherTiles() {
    List<Widget> services = [];

    mOthers.forEach((element) {
      services.add(
        ListTile(
            leading: Text(
              element.data()['price'] + ' رس',
              textDirection: TextDirection.rtl,
              style: tileTextStyle,
            ),
            title: Text(element.data()['name'],
                textDirection: TextDirection.rtl, style: tileTextStyle)),
      );
    });

    return services;
  }
}
