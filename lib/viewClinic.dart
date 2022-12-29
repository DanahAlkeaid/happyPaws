import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class viewClinic extends StatefulWidget {
  const viewClinic({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<viewClinic> createState() => _viewClinicState();
}

class _viewClinicState extends State<viewClinic> {
  static String mainFontName = "ElMessiri-VariableFont_wght";
  static String secondaryFontName = "Tajawal-Regular";
  static String testFont = "AR_GESS"; // لاختبار الخط ينحذف بعدين

  // العنوان
  String title = "اسم العيادة";

  // العنوان الثاني
  String subtitle = "وصف العيادة";

  static Color backgroundColor = Color(0xfffaf7f4);
  static Color mainTextColor = Color(0xff034d23);
  static Color secondaryTextColor = Color(0xff489f6d);

  static TextStyle titleTextStyle =
  TextStyle(color: mainTextColor, fontFamily: testFont, fontSize: 30);
  static TextStyle subTextStyle =
  TextStyle(color: secondaryTextColor, fontFamily: testFont, fontSize: 22);
  static TextStyle tileHeaderTextStyle = TextStyle(
      color: mainTextColor,
      fontFamily: testFont,
      fontSize: 16,
      fontWeight: FontWeight.bold);
  static TextStyle tileTextStyle =
  TextStyle(color: secondaryTextColor, fontFamily: testFont, fontSize: 15);

  String clinic_image_url = 'https://googleflutter.com/sample_image.jpg';

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
          )
          ,flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/App_Header.png'),
                fit: BoxFit.fill
            )
        ),
      ),
          elevation: 0
      ), // appBar

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
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(clinic_image_url),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                height: 50,
              ),
              Text(
                'اسم العيادة',
                style: titleTextStyle,
              ),
              Text(
                'وصف العيادة',
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
                children: getCleaningServicesTiles(),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // يتم توليد االقائمة من فايربيس لاحقاً
  List<Widget> getCleaningServicesTiles() {
    // TODO populate tiles from Firebase
    // ١. اول خطوة الاتصال بقاعدة البيانات للحصول على الخدمات
    // ٢. حفظ النتائج الجيسن في مصفوفة لست
    // ٣. لوب في المصفوفة باستخدام foreach لبناء ودجتس
    //
    // مثال
    // https://stackoverflow.com/a/45456173/2880778

    return <Widget>[
      Column(
        children: [
          ListTile(
              leading: Text(
                "٥٠ رس",
                style: tileTextStyle,
              ),
              title: Text('قص أظافر',
                  textDirection: TextDirection.rtl, style: tileTextStyle)),
          ListTile(
              leading: Text(
                "٤٠ رس",
                style: tileTextStyle,
              ),
              title: Text(
                'ترويش',
                textDirection: TextDirection.rtl,
                style: tileTextStyle,
              )),
        ],
      ),
    ];
  }

  // يتم توليد االقائمة من فايربيس لاحقاً
  List<Widget> getMedicalServicesTiles() {
    // TODO populate tiles from Firebase
    // ١. اول خطوة الاتصال بقاعدة البيانات للحصول على الخدمات
    // ٢. حفظ النتائج الجيسن في مصفوفة لست
    // ٣. لوب في المصفوفة باستخدام foreach لبناء ودجتس
    //
    // مثال
    // https://stackoverflow.com/a/45456173/2880778

    return <Widget>[
      Column(
        children: [
          ListTile(
              leading: Text(
                "١٠ رس",
                style: tileTextStyle,
              ),
              title: Text(
                'TBD',
                textDirection: TextDirection.rtl,
                style: tileTextStyle,
              )),
          ListTile(
              leading: Text(
                "١٠ رس",
                style: tileTextStyle,
              ),
              title: Text(
                'TBD',
                textDirection: TextDirection.rtl,
                style: tileTextStyle,
              )),
        ],
      ),
    ];
  }

  // يتم توليد االقائمة من فايربيس لاحقاً
  List<Widget> getMobileServicesTiles() {
    // TODO populate tiles from Firebase
    // ١. اول خطوة الاتصال بقاعدة البيانات للحصول على الخدمات
    // ٢. حفظ النتائج الجيسن في مصفوفة لست
    // ٣. لوب في المصفوفة باستخدام foreach لبناء ودجتس
    //
    // مثال
    // https://stackoverflow.com/a/45456173/2880778

    return <Widget>[
      Column(
        children: [
          ListTile(
              leading: Text(
                "١٠ رس",
                style: tileTextStyle,
              ),
              title: Text(
                'TBD',
                textDirection: TextDirection.rtl,
                style: tileTextStyle,
              )),
          ListTile(
              leading: Text(
                "١٠ رس",
                style: tileTextStyle,
              ),
              title: Text(
                'TBD',
                textDirection: TextDirection.rtl,
                style: tileTextStyle,
              )),
        ],
      ),
    ];
  }

  // يتم توليد االقائمة من فايربيس لاحقاً
  List<Widget> getOtherTiles() {
    // TODO populate tiles from Firebase
    // ١. اول خطوة الاتصال بقاعدة البيانات للحصول على الخدمات
    // ٢. حفظ النتائج الجيسن في مصفوفة لست
    // ٣. لوب في المصفوفة باستخدام foreach لبناء ودجتس
    //
    // مثال
    // https://stackoverflow.com/a/45456173/2880778

    return <Widget>[
      Column(
        children: [
          ListTile(
              leading: Text(
                "١٠ رس",
                style: tileTextStyle,
              ),
              title: Text(
                'TBD',
                textDirection: TextDirection.rtl,
                style: tileTextStyle,
              )),
          ListTile(
              leading: Text(
                "١٠ رس",
                style: tileTextStyle,
              ),
              title: Text(
                'TBD',
                textDirection: TextDirection.rtl,
                style: tileTextStyle,
              )),
        ],
      ),
    ];
  }
}