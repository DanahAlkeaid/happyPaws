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
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/App_Header.png'),
                      fit: BoxFit.fill
                  )
              ),
            ),
            elevation: 0
        ),

        body: Column(children: [
          Row(children: const [
            Text('TEST')


          ],)
        ],)

    );
  }
}