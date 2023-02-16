import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:untitled/clinic_home.dart';
import 'package:untitled/addGrooming.dart';
import 'package:untitled/addMedical.dart';
import 'package:untitled/addOther.dart';
import 'package:untitled/addTruck.dart';
import 'package:untitled/book_appointment.dart';
import 'editService.dart';

class clinicServices extends StatefulWidget {


  final String cEmail;

  const clinicServices(this.cEmail, {super.key});

  @override
  State<clinicServices> createState() => _clinicServicesState();
}

class _clinicServicesState extends State<clinicServices> {
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

  static double fontScale = 6;
  static double addSize = 30;
  static double editDeleteSize = 26;

  static TextStyle titleTextStyle =
  TextStyle(color: mainTextColor, fontFamily: mainFontName, fontSize: 30 + fontScale);
  static TextStyle subTextStyle = TextStyle(
      color: secondaryTextColor, fontFamily: secondaryFontName, fontSize: 22 + fontScale);
  static TextStyle tileHeaderTextStyle = TextStyle(
      color: mainTextColor,
      fontFamily: mainFontName,
      fontSize: 16 + fontScale,
      fontWeight: FontWeight.bold);

  static TextStyle tileTextStyle = TextStyle(
      color: secondaryTextColor, fontFamily: secondaryFontName, fontSize: 15 + fontScale);

  String clinic_image_url = 'https://googleflutter.com/sample_image.jpg';

  void initState() {
    super.initState();
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

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
          leading: IconButton(
            icon: (const Icon(Icons.arrow_back_ios)),
            color: const Color(0xff034d23),
            iconSize: 36,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => clinic_home()));
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

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 10,
              ),
              Text(
                'الخدمات المقدمة',
                style: titleTextStyle,
              ),
              Container(
                height: 50,
              ),
              ExpansionTile(
                title: Text(
                  "خدمات التنظيف والتزيين",
                  textDirection: TextDirection.rtl,
                  style: tileHeaderTextStyle,
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: mainTextColor,
                    size: addSize,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                addGrooming(email)));
                  },
                ),
                children: getGroomingServicesTiles(),
              ),
              ExpansionTile(
                title: Text(
                  "خدمات علاجية",
                  textDirection: TextDirection.rtl,
                  style: tileHeaderTextStyle,
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: mainTextColor,
                    size: addSize,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                addMedical(email)));
                  },
                ),
                children: getMedicalServicesTiles(),
              ),
              ExpansionTile(
                title: Text(
                  "خدمات متنقلة",
                  textDirection: TextDirection.rtl,
                  style: tileHeaderTextStyle,
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: mainTextColor,
                    size: addSize,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                addTruck(email)));
                  },
                ),
                children: getMobileServicesTiles(),
              ),
              ExpansionTile(
                title: Text(
                  "خدمات اخرى",
                  textDirection: TextDirection.rtl,
                  style: tileHeaderTextStyle,
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: mainTextColor,
                    size: addSize,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                addOther(email)));
                  },
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
            onTap: () => navigateToAppointment(element.data()['name'], element.data()['price']),
            title: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.centerStart,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(element.data()['name'] + '، ' + element.data()['price'] + 'رس ',
                          textDirection: TextDirection.rtl, style: tileTextStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: secondaryTextColor,
                          size: editDeleteSize,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editService(email, element.data()['name'], element.data()['price'],element.data()['availability'])));                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: secondaryTextColor,
                          size: editDeleteSize,
                        ),
                        onPressed: () => deleteService(element.reference),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      );
    });

    return services;
  }

  List<Widget> getMedicalServicesTiles() {
    List<Widget> services = [];

    mServices.forEach((element) {
      services.add(
          ListTile(
            onTap: () => navigateToAppointment(element.data()['name'], element.data()['price']),
            title: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.centerStart,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(element.data()['name'] + '، ' + element.data()['price'] + 'رس ',
                          textDirection: TextDirection.rtl, style: tileTextStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: secondaryTextColor,
                          size: editDeleteSize,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editService(email, element.data()['name'], element.data()['price'],element.data()['availability'])));                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: secondaryTextColor,
                          size: editDeleteSize,
                        ),
                        onPressed: () => deleteService(element.reference),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      );
    });

    return services;
  }

  List<Widget> getMobileServicesTiles() {
    List<Widget> services = [];

    mTruck.forEach((element) {
      services.add(
          ListTile(
            onTap: () => navigateToAppointment(element.data()['name'], element.data()['price']),
            title: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.centerStart,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(element.data()['name'] + '، ' + element.data()['price'] + 'رس ',
                          textDirection: TextDirection.rtl, style: tileTextStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: secondaryTextColor,
                          size: editDeleteSize,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editService(email, element.data()['name'], element.data()['price'],element.data()['availability'])));                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: secondaryTextColor,
                          size: editDeleteSize,
                        ),
                        onPressed: () => deleteService(element.reference),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      );
    });

    return services;
  }

  List<Widget> getOtherTiles() {
    List<Widget> services = [];

    mOthers.forEach((element) {
      services.add(
          ListTile(
            onTap: () => navigateToAppointment(element.data()['name'], element.data()['price']),
            title: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.centerStart,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(element.data()['name'] + '، ' + element.data()['price'] + 'رس ',
                          textDirection: TextDirection.rtl, style: tileTextStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: secondaryTextColor,
                          size: editDeleteSize,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editService(email, element.data()['name'], element.data()['price'],element.data()['availability'])));                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: secondaryTextColor,
                          size: editDeleteSize,
                        ),
                        onPressed: () => deleteService(element.reference),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      );
    });

    return services;
  }

  void navigateToAppointment(serviceName, servicePrice) {
    String clinicNameWithArea = firstName + '، ' + description;

    Map<String, String> clinicInfo = Map();
    clinicInfo["clinicName"] = clinicNameWithArea;
    clinicInfo["clinicEmail"] = email;
    clinicInfo["clinicPhone"] = phonenumber;
    clinicInfo["clinicServiceName"] = serviceName;
    clinicInfo["clinicServicePrice"] = servicePrice;

    Future.delayed(Duration.zero, () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => book_appointments(clinicInfo),));
    });
  }

  void deleteService(DocumentReference<Map<String, dynamic>> reference) {
    Alert(
      style: AlertStyle(
          titleStyle: TextStyle(
              fontSize: 23, color: Colors.black, fontFamily: 'Tajawal'),
          descStyle: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: 'Tajawal')),
      closeIcon: Container(),
      context: context,
      title: "حذف الخدمة",
      desc: " هل أنت متأكد من رغبتك بحذف الخدمة؟",
      buttons: [
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "إلغاء",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFC2D961),
        ),
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "حذف",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'),
          ),
          onPressed: () async {
            await FirebaseFirestore.instance
                .runTransaction((Transaction myTransaction) async {
              await myTransaction.delete(reference);
              Navigator.pop(context);

              // Reload firebase data to reflect the deletion
              clInfo();
              ConfirmDel();
            });

          },
          color: Color.fromARGB(255, 200, 62, 62),
        ),
      ],
    ).show();
  }

  ConfirmDel() {
    Alert(
      style:
      AlertStyle(descStyle: TextStyle(fontSize: 22, fontFamily: 'Tajawal')),
      context: context,
      desc: "تم حذف الخدمة",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "حسناً",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFC2D961),
        ),
      ],
    ).show();
  }
}
