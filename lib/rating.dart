import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:untitled/petOwnerHome.dart';



class rating extends StatefulWidget {
  final  PetOwner_email;
  final  Clinic_email;
  final serviceName;

  const rating(this.PetOwner_email, this.Clinic_email, this.serviceName , {super.key});


  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
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
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xfffaf7f4),
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


                SizedBox(height: 20,),
                // SizedBox(height: 50,),
                Container(
                  height: h*0.52,

                  // decoration: BoxDecoration(color: Color(0xfffaf7f4),
                  //   borderRadius: BorderRadius.only(
                  //     topRight: Radius.circular(30),
                  //     topLeft: Radius.circular(30),
                  //   ),),
                  child: Column(

                    children: [

                      Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: new BoxDecoration(
                            // border: Border.all(width: 0.5, color: Colors.black),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(profilePic)
                              )
                          )),

                      Container(
                        padding: EdgeInsets.only(top: 30),

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
                      SizedBox(height:10,),


                      SizedBox(height: h*0.02,),
                      SizedBox(
                          width: w * 0.9,
                          height: 60,
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
        //if user didnt rate we will show popup msg asking her/him kindly to do
        showPopup2();
      }else{
        if(formKey.currentState!.validate()){
          Navigator.pop(context);
          addRating(RatingClinic);
          Navigator.pop(context);
          showPopup();
        } }
    }catch(error){
      print(error);
    }
  }

//adds rating to to rating collection in firebase cloud
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

  //updates rating status in appointment to rated
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

  //thank user after rating
  showPopup() {
    Alert(
      style:  AlertStyle(descStyle:TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal') ),
      context: context,
      title: "!شكراً لك",
      desc: "تقييمك محل تقدير",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [
        DialogButton(
          child: Text(
            "حسناً",
            style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal'),


          ),
          onPressed: () async => {
          //   Navigator.popUntil(context, ModalRoute.withName('/petOwnerHome')),
          //   // Navigator.pop(context),
          // //   Navigator.of(context).pop(),
            Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => petOwnerHome()))
           },
          color: Color(0xFFC2D961),
          radius: BorderRadius.all(Radius.circular(15)),

        )
      ],
    ).show();

  }

  //asking user for taring
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

  //the method that retrieves clinics name
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
  //the method that retrieves pet owners name
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

  //the method that retrieves clinics picture
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


