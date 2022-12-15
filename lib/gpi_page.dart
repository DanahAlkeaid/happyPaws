import 'package:flutter/material.dart';

class gpi_page extends StatefulWidget {
  const gpi_page ({Key? key}) : super (key: key);

  @override
  State<gpi_page> createState() => _gpi_pageState();
}

class _gpi_pageState extends State<gpi_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffaf7f4),

        appBar: AppBar(
            leading: IconButton(
              icon: (Icon(Icons.arrow_back_ios)),
              color: Color(0xff034d23),
              iconSize: 36,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => gpi_page()));
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
        ),

        body:
        //Scrollable page
        SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              const SizedBox(height: 10)

              ,Image.asset(
                'Assets/Pet_House.png',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              )
              ,const SizedBox(height: 30)

              //Each row represents an info
              ,Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.75, 0),
                      child: Text(
                        'رتب مواعيد منتظمة لزيارة الطبيب البيطري ',
                        textAlign: TextAlign.end,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontFamily: "Elmessiri",
                          fontSize:20,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'Assets/paw_icon.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ],
              )
              ,const SizedBox(height: 20)

              ,Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.75, 0),
                      child: Text(
                        'احرص على اعطاء حيوانك الأليف اللقاحات اللازمة في وقتها ',
                        textAlign: TextAlign.end,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontFamily: "Elmessiri",
                          fontSize:20,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'Assets/paw_icon.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ],
              )
              ,const SizedBox(height: 20)

              ,Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.75, 0),
                      child: Text(
                        'لا تطعم حيوانك الأليف بقايا طعامك ',
                        textAlign: TextAlign.end,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontFamily: "Elmessiri",
                          fontSize:20,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'Assets/paw_icon.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ],
              )
              ,const SizedBox(height: 20)

              ,Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.75, 0),
                      child: Text(
                        'وفر المأوى المناسب للحيوان الأليف من الحرارة والبرودة والمطر   ',
                        textAlign: TextAlign.end,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontFamily: "Elmessiri",
                          fontSize:20,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'Assets/paw_icon.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ],
              )
              ,const SizedBox(height: 20)

              ,Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.75, 0),
                      child: Text(
                        'جهز منزلك للحيوان الأليف و ابعد مصادر الخطر ( كالسكاكين و الاطعمة المسممة )   ',
                        textAlign: TextAlign.end,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontFamily: "Elmessiri",
                          fontSize:20,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'Assets/paw_icon.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ],
              )
              ,const SizedBox(height: 20)

              ,Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.75, 0),
                      child: Text(
                        'تأكد من تنظيف حيوانك الأليف و اماكن معيشته ( على الاقل مرة كل اسبوعين ) ',
                        textAlign: TextAlign.end,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontFamily: "Elmessiri",
                          fontSize:20,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'Assets/paw_icon.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ],
              )
              ,const SizedBox(height: 20)

            ],),
          ),
        )

    );
  }
}