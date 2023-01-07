import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'clinic_services.dart';






class editMedical extends StatefulWidget {
  final cEmail;
  final sName;
  const editMedical ( this.cEmail,this.sName,{super.key} );

  @override
  State<editMedical> createState() => _editMedical();
}

class _editMedical extends State<editMedical> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _serviceName = TextEditingController();
  final TextEditingController _price = TextEditingController();


  String errorMessage = '';
  var doc_id;
  var loading = false;
  void dispose() {
    _serviceName.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xfffaf7f4),

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
      Padding(
        padding:const EdgeInsets.symmetric(vertical: 20,horizontal:16),
        child:SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisSize:MainAxisSize.max,
            children: [

              Column(

                children:[


                  Container(
                    margin:const EdgeInsets.fromLTRB(0, 0, 0, 16),


                    child:
                    Align(
                      alignment:const Alignment(0.8, 0.1),
                      child:Padding(
                        padding:const EdgeInsets.all(16),
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
                                      padding:const EdgeInsets.symmetric(vertical: 0,horizontal:16),
                                      child:
                                      Column(
                                        mainAxisAlignment:MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisSize:MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:Alignment.center,
                                            child:Row(
                                              mainAxisAlignment:MainAxisAlignment.start,
                                              crossAxisAlignment:CrossAxisAlignment.center,
                                              mainAxisSize:MainAxisSize.max,
                                              children:[


                                                const Padding(
                                                  padding:EdgeInsets.fromLTRB(170, 0, 0, 0),
                                                  child:Text(
                                                    "تفاصيل الخدمة",
                                                    textAlign: TextAlign.right,
                                                    overflow:TextOverflow.clip,
                                                    style:TextStyle(
                                                      fontWeight:FontWeight.w600,
                                                      fontFamily: "Almarai",
                                                      fontSize:19,
                                                      color:Color(0xff034d23),
                                                    ),
                                                  ),
                                                ),
                                              ],),),
                                          const Divider(
                                            color:Color(0xff5f5d5d),
                                            height:13,
                                            thickness:0,
                                            indent:0,
                                            endIndent:0,
                                          ),
                                          SizedBox(height: 20,),
                                          const Align(
                                            alignment:Alignment.centerRight,
                                            child:Text(
                                              "اسم الخدمة",
                                              textAlign: TextAlign.start,
                                              maxLines:1,
                                              overflow:TextOverflow.clip,
                                              style:TextStyle(
                                                fontWeight:FontWeight.w500,
                                                fontFamily: "Almarai",
                                                fontSize:18,
                                                color:Color(0xff034d23),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 20,
                                                      offset: Offset(1, 1),
                                                      color: Colors.grey.withOpacity(0.26))
                                                ]),
                                            child: TextFormField(
                                              autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                              controller: _serviceName,
                                              validator: validateService,
                                              decoration: InputDecoration(
                                                  hintText: (" "),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                      borderSide:
                                                      BorderSide(color: Colors.white)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                      borderSide:
                                                      BorderSide(color: Colors.white)),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15))),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          const Padding(
                                            padding:EdgeInsets.symmetric(vertical: 4,horizontal:0),
                                            child:Align(
                                              alignment:Alignment.centerRight,
                                              child:Text(
                                                "السعر",
                                                textAlign: TextAlign.start,
                                                maxLines:1,
                                                overflow:TextOverflow.ellipsis,
                                                style:TextStyle(
                                                  fontWeight:FontWeight.w500,
                                                  fontFamily: "Almarai",
                                                  fontSize:18,
                                                  color:Color(0xff034d23),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 20,
                                                      offset: Offset(1, 1),
                                                      color: Colors.grey.withOpacity(0.26))
                                                ]),
                                            child: TextFormField(
                                              autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                              controller: _price,
                                              validator: validatePrice,
                                              decoration: InputDecoration(
                                                  hintText: (" "),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                      borderSide:
                                                      BorderSide(color: Colors.white)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15),
                                                      borderSide:
                                                      BorderSide(color: Colors.white)),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(15))),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Center(
                                            child: Row(children: [
                                              SizedBox(width: 40,),
                                              ElevatedButton(
                                                //radius: const BorderRadius.all(Radius.circular(6)),
                                                style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all<Color>(
                                                        Colors.red),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(15),
                                                            side: BorderSide(
                                                              color: Colors.red,
                                                            )))),
                                                child: Text(
                                                  "إلغاء",
                                                  style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
                                                ),
                                                // onPressed: () => Navigator.pop(context),
                                                onPressed: () => Navigator.pop(context),//to do
                                                // color: Color.fromARGB(255, 200, 62, 62),

                                              ),
                                              SizedBox(width: 20,),
                                              ElevatedButton(
                                                //radius: const BorderRadius.all(Radius.circular(6)),
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
                                                  "حفظ التغييرات",
                                                  style: TextStyle(fontSize: 20, color: Colors.black,  fontFamily: 'Tajawal'),
                                                ),
                                                onPressed: () => Navigator.pop(context),
                                                // color: Color(0xFFC2D961),
                                              ),
                                              SizedBox(width: 20,),

                                            ]),
                                          ),
                                        ],),),),
                                ],),),
                          ],),),),
                  ),
                ],),
            ],),),),
    );
  }
  SaveEdit() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
        });
        await FirebaseFirestore.instance
            .collection('services')
            .where('clinicEmail', isEqualTo: '${widget.cEmail}')
            .where('name', isEqualTo:'${widget.sName}')
            .get()
            .then((value) {
          value.docs.forEach((element) {
            doc_id = element.id;
            print(doc_id);
          });
        });
         await FirebaseFirestore.instance
            .collection('services')
            .doc('${doc_id}').update({
          "name":_serviceName.text.trim(),
          "price":_price.text.trim(),
        }
        );
        Navigator.of(context).pop();
        showPopup();
      }
      catch (error) {
        print("$error");
      }
    } else {
      print("خطأ في تغيير بيانات الخدمة ");
    }
  }
  showPopup() {
    Alert(
      style: AlertStyle(descStyle:TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Tajawal') ),
      context: context,
      desc: "تم حفظ التعديلات بنجاح",
      // desc: "Check your Inbox!",
      closeFunction: null,
      closeIcon: Container(),
      buttons: [],
    ).show();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => clinic_services(/*راح يكون هنا ايميل العيادة*/)));

  }
}


String? validatePrice(String? formPrice) {
  //String msg = '';
  if (formPrice == null || formPrice.trim().isEmpty) {
    return "يرجى إدخال قيمة";
  }

  return null;
}

String? validateService(String? formService) {
  //String msg = '';
  if (formService == null || formService.trim().isEmpty) {
    return "يرجى إدخال اسم الخدمة";
  }

  return null;
}