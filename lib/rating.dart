import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';


class rating extends StatefulWidget {
  final  PetOwner_email;
  final  Clinic_email;
  final  appointment_ID;

  const rating(this.PetOwner_email, this.Clinic_email, this.appointment_ID,  {super.key});


  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
  late double RatingClinic=0;
  late TextEditingController _reviewTextController = TextEditingController();
  late bool RatedBefore = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var name = "";
  var namePetOwner ="";

  var profilePic = "";

  void initState() {
    super.initState();
    Profilepic();
    Name();
    NamePetOwner();
  }



  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(0),
      height: h*0.6,
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

                //SvgPicture.asset('img/reviews.svg',width: w*0.5,),
                SizedBox(height: h*0.08,),
                // SizedBox(height: 50,),
                Container(
                  height: h*0.52,

                  decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius:  BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),),
                  child: Column(

                    children: [

                      Container(
                        padding: EdgeInsets.only(top: 70),

                        alignment: Alignment.center,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'ElMessiri'),
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'كيف كانت تجربتك؟',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
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
                              Color.fromARGB(255, 96, 95, 99),
                              //itemPadding: EdgeInsets.only(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(

                                Icons.star_rate_rounded,
                                color: Color.fromARGB(
                                    255, 252, 162, 77),

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
                      SizedBox(height:10,),


                      SizedBox(height: h*0.02,),
                      SizedBox(
                          width: w * 0.9,
                          height: 60,
                          child: RatingClinic>0.5?
                          ElevatedButton(
                              onPressed:(() =>Ratebtn() ),


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
            ),      Container(

              color: Color.fromARGB(0, 255, 255, 255),
              child: Container(

                  width: w * 0.36,
                  height: w * 0.36,


                  //أحتاج اخذ صورة العيادة

                  child: CircleAvatar(
                      backgroundColor:
                      Color.fromARGB(255, 255, 255, 255),
                      backgroundImage: profilePic == " "
                          ? null
                          : NetworkImage(profilePic),
                      radius: 200.0),


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

                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(500),
                  )),
            ),
          ],
        ),
      ),

    );
  }

  /* Future Rating(Rate rate) async{
      final  _expertrating = FirebaseFirestore.instance.collection('Rating').doc();

    final json = rate.toJson();
      await _expertrating.set(json);

    }*/

  Ratebtn(){
    try{
      if(RatingClinic<1){
        showPopup2();
      }else{


        if(formKey.currentState!.validate()){

          addRating( RatingClinic, widget.Clinic_email, widget.PetOwner_email,  widget.appointment_ID , namePetOwner);
          Navigator.pop(context);
          showPopup();
        } }
    }catch(error){
      print(error);
    }
  }
  Future addRating(double rate, String clinic_email, String petOwner_email,String appointmentID,String namePetOwner) async {
    Timestamp date = Timestamp.now();
    try{
      await FirebaseFirestore.instance.collection('rating').add({
        'rate': rate,
        'clinic_email':clinic_email ,
        'petOwner_email': petOwner_email,
        'appointment_Id':appointmentID,
        'date': date,
        'petOwner_Name': namePetOwner
      });


      //مررااااااااجججعععععهههه

      // var test2 = await FirebaseFirestore.instance
      //     .collection('OfferPrice')
      //     .doc('${doc_id}');
      // test2.update({'rated': true ,
      // });}catch(error){
      // print(error);

    }catch(error){
      print(error);
    }

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
      ],
    ).show();

  }
  showPopup2() {
    Alert(
      style: AlertStyle(descStyle:TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal') ),
      context: context,

      desc: "تقييمك يهمنا",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
      ],
    ).show();

  }

  Name() {
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: widget.Clinic_email)
        .get()
        .then((snapshot) {
      setState(() {
        name = snapshot.docs[0].data()['firstname'];
      });

      print(name);
    });
    print(Name);
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



/*class Rate {

  late double rate;
  late String review;
  late String expert_email;
  late String ML_email;
  late String RequestID;
  Rate({

    required this.rate,
    required this.review,
     required this.expert_email,
    required this.ML_email,
    required this.RequestID,

  });

  Map<String, dynamic> toJson() =>{

    'rate': rate,
    'review': review,
    'expert_email':expert_email ,
    'ML_email': ML_email,
    'RequestID':RequestID,
   // 'time': time,

  };
}*/
