import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:untitled/petOwnerHome.dart';

class clinic_Rate extends StatefulWidget {
  final  PetOwner_email;
  final  Clinic_email;
  final serviceName;

  const clinic_Rate(this.PetOwner_email, this.Clinic_email, this.serviceName , {super.key});


  @override
  State<clinic_Rate> createState() => _clinic_RateState();
}

class _clinic_RateState extends State<clinic_Rate> {
  late double RatingClinic=0;


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var nameClinic = "";
  var namePetOwner ="";

  var profilePic = "";

  void initState() {
    super.initState();
    Profilepic();
    NameClinic();
    NamePetOwner();
  }





  @override
  Widget build(BuildContext) => Scaffold(
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
    body:
    SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,

              child: Stack(
                alignment: Alignment.topCenter,
                children: [


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //pic


                      SizedBox(height: 20,),
                      // SizedBox(height: 50,),
                      Container(
                        height:60,

                        decoration: BoxDecoration(color: Color(0xfffaf7f4),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),),
                        child: Column(

                          children: [

                            Container(

                              color: Color(0xfffaf7f4),
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  child: CircleAvatar(
                                      backgroundColor:
                                      Color(0xfffaf7f4),
                                      backgroundImage: profilePic == " "
                                          ? null
                                          : NetworkImage(profilePic),
                                      radius: 200.0),

                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xfffaf7f4),
                                    borderRadius: BorderRadius.circular(500),
                                  )),


                              // child: CircleAvatar(
                              //   radius: 55,
                              //   backgroundColor: Color(0xfffaf7f4),
                              //   child: _photo != null
                              //       ? ClipRRect(
                              //     borderRadius: BorderRadius.circular(50),
                              //     child: Image.file(
                              //       _photo!,
                              //       width: 100,
                              //       height: 100,
                              //       fit: BoxFit.fitHeight,
                              //     ),
                              //   )
                              //       : Container(
                              //     decoration: BoxDecoration(
                              //         color: Colors.grey[200],
                              //         borderRadius: BorderRadius.circular(50)),
                              //     width: 100,
                              //     height: 100,
                              //     child: Icon(
                              //       Icons.camera_alt,
                              //       color: Colors.grey[800],
                              //     ),
                              //   ),)


                            ),

                            Container(
                              padding: EdgeInsets.only(top: 70),

                              alignment: Alignment.center,
                              child: Text(
                                nameClinic,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color:Color(0xff034d23),
                                    fontFamily: 'ElMessiri'),
                              ),
                            ),
                            SizedBox(height: 20,),

                            Container(
                              padding: EdgeInsets.only(left: 20),
                              alignment: Alignment.center,
                              child: Text(
                                'كيف كانت تجربتك؟',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontFamily: 'Tajawal'),
                              ),
                            ),
                            SizedBox(height: 5,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  // width: w * 0.8,
                                  child: RatingBar.builder(
                                    glow: true,
                                    //initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 50,
                                    unratedColor:
                                    Colors.grey,
                                    //itemPadding: EdgeInsets.only(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(

                                      Icons.star_rate_rounded,
                                      color: Color.fromARGB(255, 252, 163, 77),

                                    ),
                                    //ignoreGestures: true,
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        RatingClinic=rating;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),


                            SizedBox(height: 20,),
                            Container(
                                child: RatingClinic>0.5?
                                ElevatedButton(
                                    onPressed: () {
                                      Ratebtn();
                                    },

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
                                    child: Text(
                                      'تقييم',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Tajawal'),
                                    )): ElevatedButton(
                                    onPressed:null,


                                    style: ButtonStyle(

                                        shape: MaterialStateProperty
                                            .all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ))),
                                    child: Text(
                                      'تقييم',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Tajawal'),
                                    ))
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),

          ),
        ),
      ),

    ),
  );


  Ratebtn(){
    try{
      if(RatingClinic<1){
        showPopup2();
      }else{
        if(formKey.currentState!.validate()){
          Navigator.pop(context);
          addRating(RatingClinic);
          showPopup();
        } }
    }catch(error){
      print(error);
    }
  }


  Future addRating(rate) async {
    try{
      await FirebaseFirestore.instance.collection('rating').add({
        'rate': rate,
        'clinic_email':widget.Clinic_email
      });
      updateAppointment();
    }catch(error){
      print(error);
    }

  }

  Future updateAppointment() async {
    var doc_id;
    await FirebaseFirestore.instance
        .collection('appointments')
        .where('clinicEmail', isEqualTo: widget.Clinic_email)
        .where('petOwnerEmail', isEqualTo: widget.PetOwner_email)
        .where('service', isEqualTo: widget.serviceName)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        doc_id = element.id;
        print(doc_id);
      });
    });
    await FirebaseFirestore.instance
        .collection('appointments')
        .doc('${doc_id}').update({
      'rated':'rated',
    }
    );
  }

  showPopup() {
    Alert(
      style:  AlertStyle(descStyle:TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal') ),
      context: context,
      title: "شكراً لك!",
      desc: "تقييمك محل تقدير",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
        DialogButton(
          child: Text(
            "حسناً",
            style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'),


          ),
          onPressed: () => {Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => petOwnerHome()))},
          color: Color(0xFFC2D961),
          radius: BorderRadius.all(Radius.circular(15)),

        )
      ],
    ).show();

  }
  void showPopup2() {
    Alert(
      style: AlertStyle(descStyle:TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal') ),
      context: context,
      desc: "تقييمك يهمنا",
      // desc: "Check your Inbox!",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
        DialogButton(
          child: Text(
            "حسناً",
            style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'),


          ),
          onPressed: () =>Navigator.pop(context),
          color: Color(0xFFC2D961),
          radius: BorderRadius.all(Radius.circular(15)),

        )
      ],
    ).show();

  }

  NameClinic() {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: widget.Clinic_email)
        .get()
        .then((snapshot) {
      setState(() {
        nameClinic = snapshot.docs[0].data()['firstname'];
      });

      print(nameClinic);
    });
    print(NameClinic);
  }
  NamePetOwner()  {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: widget.PetOwner_email)
        .get()
        .then((snapshot) {
      setState(() {
        namePetOwner=snapshot.docs[0].data()['firstname'];
      });



    });


  }

  Profilepic() {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: '${widget.Clinic_email}')
        .get()
        .then((snapshot) {
      setState(() {
        profilePic = snapshot.docs[0].data()['profilepic'];
      });
    });
  }






}