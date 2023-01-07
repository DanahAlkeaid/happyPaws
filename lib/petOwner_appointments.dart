import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class petOwner_appointments extends StatefulWidget {
  const petOwner_appointments ({Key? key}) : super (key: key);

  @override
  State<petOwner_appointments> createState() => _petOwner_appointmentsState();
}

class _petOwner_appointmentsState extends State<petOwner_appointments> {

//Get the current petOwner info
  FirebaseAuth _auth = FirebaseAuth.instance;
  late final Stream<QuerySnapshot> _reqStream;
  CollectionReference appointments = FirebaseFirestore.instance.collection('appointments');
  //currentUser info
  var pEmail;
  var pPhone;


  void initState() {
    super.initState();
    getCurrentUser();
    pInfo();
    openUsersCollection();
  }

  getCurrentUser()  {
    final User user = _auth.currentUser! ;
    pEmail = user.email;
  }

  pInfo()  {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${pEmail}')
        .get()
        .then((snapshot) { print(snapshot.docs[0].data());
    var petOwnerPhone = snapshot.docs[0].data()['phonenumber'];
    setState(() {
      pPhone ='${petOwnerPhone} ';
    });
    //TEST !!!
    print(pEmail);
    print(pPhone);
    }); }

  openUsersCollection() {
    _reqStream = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${pEmail}')
        .snapshots();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf7f4),

      appBar: AppBar(
          leading: IconButton(
            icon: (Icon(Icons.arrow_back_ios)),
            color: Color(0xff034d23),
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
      ),

      body:Padding(
        //Scrollable page
        padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
        child:SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize:MainAxisSize.max,
            children: [
              Align(
                alignment:Alignment(0.8, 0.0),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisSize:MainAxisSize.max,
                  children:const [
                    Align(
                      alignment:Alignment.centerRight,
                      child:Text(
                        "المواعيد ",
                        textAlign: TextAlign.right,
                        overflow:TextOverflow.clip,
                        style:TextStyle(
                          fontWeight:FontWeight.w700,
                          fontFamily: "Almarai",
                          fontSize:37,
                          color:Color(0xff034d23),
                        ),
                      ),
                    ),
                    Align(
                  alignment:Alignment.centerRight,
                      child:Icon(
                        Icons.calendar_today,
                        color:Color(0xff034d23),
                        size:33,
                      ),
                    ),
                  ],),),

          const SizedBox(height: 20)

              ,ListView(
                scrollDirection: Axis.vertical,
                padding:EdgeInsets.all(0),
                shrinkWrap:true,
                physics:ScrollPhysics(),
                children:[

                  //Get all petOwner appointments and display them as cards
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("appointments").where('petOwnerPhone', isEqualTo: '${pPhone}').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                      if(snapshot.hasData) {
                        final snap = snapshot.data!.docs;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics:ScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: snap.length,

                          itemBuilder: (context, index) {
                            return Card(
                              margin:EdgeInsets.fromLTRB(0, 0, 0, 16),
                              color:Color(0xffffffff),
                              shadowColor:Color(0x4d939393),
                              elevation:1,
                              shape:RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(4.0),
                                side: BorderSide(color:Color(0x4d9e9e9e), width:1),
                              ),
                              child:
                              Align(
                                alignment:Alignment(0.8, 0.1),
                                child:Padding(
                                  padding:EdgeInsets.all(16),
                                  child:Row(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    mainAxisSize:MainAxisSize.max,
                                    children:[

                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.start,
                                          crossAxisAlignment:CrossAxisAlignment.center,
                                          mainAxisSize:MainAxisSize.max,
                                          children:[

                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
                                                child:
                                                Column(
                                                  mainAxisAlignment:MainAxisAlignment.end,
                                                  crossAxisAlignment:CrossAxisAlignment.start,
                                                  mainAxisSize:MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:Alignment(-0.0, 0.0),
                                                      child:Row(
                                                        mainAxisAlignment:MainAxisAlignment.start,
                                                        crossAxisAlignment:CrossAxisAlignment.center,
                                                        mainAxisSize:MainAxisSize.max,
                                                        children:[

                                                          IconButton(
                                                            icon:const Icon(
                                                                Icons.clear
                                                            ),
                                                            onPressed:(){CancelApp(snapshot.data!.docs[index].reference);},
                                                            color:Color(0xff212435),
                                                            iconSize:24,
                                                          ),
                                                          Align(
                                                            alignment:Alignment.topLeft,
                                                            child:MaterialButton(
                                                              onPressed:(){
                                                               showDialog<void>(
                                                               context: context,
                                                               barrierDismissible: false, // user must tap button!
                                                               builder: (BuildContext context) {
                                                                return AlertDialog(
                                                                  content: SingleChildScrollView(
                                                                    child: ListBody(
                                                                      children: <Widget>[
                                                                        Align(alignment : Alignment.centerRight ,
                                                                          child: Text( "${snap[index]['date']} :تاريخ الموعد" ,
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontFamily: 'Tajwal',
                                                                                  color: Colors.black)),
                                                                        ),
                                                                        Align(alignment : Alignment.centerRight ,
                                                                          child: Text('${snap[index]['time']} :وقت الموعد',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontFamily: 'Tajwal',
                                                                                  color: Colors.black)),
                                                                        ),
                                                                        Align(alignment : Alignment.centerRight ,
                                                                          child: Text('${snap[index]['clinicPhone']} :رقم هاتف العيادة',
                                                                              style: TextStyle(fontSize: 18,
                                                                                  fontFamily: 'Tajwal',
                                                                                  color: Colors.black)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    Align(alignment : Alignment.center ,
                                                                      child: ElevatedButton(
                                                                          onPressed: () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          style: ButtonStyle(
                                                                              backgroundColor: MaterialStateProperty.all<Color>(
                                                                                  Color(0xFFC2D961)),
                                                                              shape: MaterialStateProperty
                                                                                  .all<RoundedRectangleBorder>(
                                                                                  RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(15),
                                                                                      side: const BorderSide(
                                                                                        color: Color(0xFFC2D961),
                                                                                      )))),
                                                                          child: const Text("حسناً",
                                                                              style: TextStyle(fontSize: 18,fontFamily: 'Tajawal', color: Color(0xFF034D23)))),
                                                                    ),
                                                                  ],
                                                                );
                                                               },
                                                               );
                                                              },
                                                              color:Color(0xffffffff),
                                                              elevation:0,
                                                              shape:const RoundedRectangleBorder(
                                                                borderRadius:BorderRadius.zero,
                                                                side:BorderSide(color:Color(0xffffffff),width:0),
                                                              ),
                                                              padding:EdgeInsets.fromLTRB(12, 1, 16, 1),
                                                              child:Text("التفاصيل", style: TextStyle( fontSize:16,
                                                                fontWeight:FontWeight.w400,
                                                                fontFamily: "Almarai",
                                                              ),),
                                                              textColor:Color(0xff034d23),
                                                              height:9,
                                                              minWidth:10,
                                                            ),
                                                          ),
                                                        ],),),
                                                    Align(
                                                      alignment:Alignment.centerRight,
                                                      child:Text(
                                                        "${snap[index]['service']}",
                                                        textAlign: TextAlign.start,
                                                        maxLines:1,
                                                        overflow:TextOverflow.clip,
                                                        style:TextStyle(
                                                          fontWeight:FontWeight.w700,
                                                          fontFamily: "Almarai",
                                                          fontSize:20,
                                                          color:Color(0xff034d23),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:EdgeInsets.symmetric(vertical: 4,horizontal:0),
                                                      child:Align(
                                                        alignment:Alignment.centerRight,
                                                        child:Text(
                                                          "${snap[index]['clinic']}",
                                                          textAlign: TextAlign.start,
                                                          maxLines:1,
                                                          overflow:TextOverflow.ellipsis,
                                                          style:TextStyle(
                                                            fontWeight:FontWeight.w400,
                                                            fontFamily: "Almarai",
                                                            fontSize:18,
                                                            color:Color(0xff009245),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:MainAxisAlignment.start,
                                                      crossAxisAlignment:CrossAxisAlignment.center,
                                                      mainAxisSize:MainAxisSize.max,
                                                      children: [

                                                        Padding(
                                                          padding:EdgeInsets.fromLTRB(25, 0, 33, 0),
                                                          child:Text(
                                                            "${snap[index]['date']}",
                                                            textAlign: TextAlign.start,
                                                            overflow:TextOverflow.clip,
                                                            style:TextStyle(
                                                              fontWeight:FontWeight.w400,
                                                              fontFamily: "Almarai",
                                                              fontSize:17,
                                                              color:Color(0xff034d23),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:EdgeInsets.fromLTRB(69, 0, 0, 0),
                                                          child:Align(
                                                            alignment:Alignment.centerRight,
                                                            child:Text(
                                                              "${snap[index]['time']}",
                                                              textAlign: TextAlign.start,
                                                              overflow:TextOverflow.clip,
                                                              style:TextStyle(
                                                                fontWeight:FontWeight.w400,
                                                                fontFamily: "Almarai",
                                                                fontSize:17,
                                                                color:Color(0xff034d23),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],),
                                                  ],),),),
                                          ],),),
                                      Container(
                                        alignment:Alignment.center,
                                        margin:EdgeInsets.all(0),
                                        padding:EdgeInsets.all(10),
                                        width:50,
                                        decoration: BoxDecoration(
                                          color:Color(0xfffaf7f4),
                                          shape:BoxShape.circle,
                                          border:Border.all(color:Color(0xff034d23),width:1),
                                        ),
                                        child:
                                        const Align(
                                          alignment:Alignment(0.1, 0.0),
                                          child:
                                          Image(
                                            image:AssetImage("Assets/Pet_House.png"),
                                            height:50,
                                            width:266,
                                            fit:BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],),),),
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                ],),
            ],),),),
    );

  }


  CancelApp(DocumentReference index) {
    Alert(
      style: AlertStyle(titleStyle: TextStyle(fontSize: 23, color: Colors.black,  fontFamily: 'Tajawal'),descStyle: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal')),
      closeIcon: Container(),
      context: context,
      title: "حذف الموعد",
      desc:
      " هل أنت متأكد من رغبتك بحذف الموعد؟",
      buttons: [
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "إلغاء",
            style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFC2D961),
        ),
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "حذف",
            style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
          ),
          // onPressed: () => Navigator.pop(context),
          onPressed: () async {
            await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
              await myTransaction.delete(index);
              Navigator.pop(context);
              ConfirmCancel();
            });
          }, //to do
          color: Color.fromARGB(255, 200, 62, 62),

        ),
      ],
    ).show();
  }

  ConfirmCancel() {
    Alert(
      style: AlertStyle(descStyle: TextStyle(fontSize: 22, fontFamily: 'Tajawal')),
      context: context,
      desc: "تم حذف الموعد",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
        DialogButton(
          radius: const BorderRadius.all(Radius.circular(6)),
          child: Text(
            "حسناً",
            style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFFC2D961),

        ),
      ],
    ).show();

  }


}

