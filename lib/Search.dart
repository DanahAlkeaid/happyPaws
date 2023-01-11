import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/DataController.dart';
import 'package:untitled/petOwnerHome.dart';
import 'package:untitled/viewClinic.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search>{
  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshotData;
  late bool isExcecuted = false;
  @override
  Widget build(BuildContext context) {

    Widget searchData(){
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder:(BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              Get.to(viewClinic(snapshotData.docs[index]['email']),
              transition: Transition.downToUp,
              arguments: snapshotData.docs[index]);
            },
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              trailing:  Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1.0, color: Color(0xFFd6cdfe)))),

                  //here the clinics pic
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xfffaf7f4),
                    // child:borderRadius: BorderRadius.circular(50),
                    child: Image.network(snapshotData.docs[index]['profilepic']),)
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(alignment: Alignment.centerRight,
                      child: Text(
                        snapshotData.docs[index]['firstname'],
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 252, 163, 77),
                    size: 10,
                  ),
                  Text(//'.',
                    rateAve(snapshotData.docs[index]['email']).toString(),
                    style:
                    TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              ]),

            ),
          );
        }
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.clear,color: Color(0xFFC2D961),),
        onPressed: (){
        setState(() {
          isExcecuted = false;
        });
        },
      ),
      backgroundColor: Color(0xfffaf7f4),
      appBar: AppBar(
        actions: [
          GetBuilder<DataCotroller>(
            init: DataCotroller(),
            builder: (val){
              return IconButton(icon: Icon(Icons.search, color: Color(0xff194919),),onPressed: (){
                val.queryData(searchController.text).then((value) {
                  snapshotData = value;
                  setState(() {
                    isExcecuted = true;
                  });
                });
              },
              );
            },
          )
        ],
          title: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'ابحث هنا .......',
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                  BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                  BorderSide(color: Colors.white)),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/App_Header.png'),
                  fit: BoxFit.fill
              ),
            ),
          ),
          elevation: 0
      ),
      body: isExcecuted ? searchData():
      Container(
        child: Center(
          child: Text('ابحث عن عيادة',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                fontFamily: 'Tajawal'
          ),
          ),
        ),
      ),
    );
  }

  rateAve(email){

    // late  Stream<QuerySnapshot> _clinicRate = FirebaseFirestore.instance
    //     .collection('rating')
    //     .where('clinic_email', isEqualTo: email)
    //     .where('status',isEqualTo: 'rated')
    //     .snapshots();

    int numRate=0;
    double TotalRate =0;
    double avgRate=0;
    FirebaseFirestore.instance
        .collection('rating')
        .where('clinic_email', isEqualTo: email)
        .where('status',isEqualTo: 'rated')
        .get()
        .then((snapshot){
      if(snapshot.docs.isNotEmpty){
        setState(() {
          numRate=snapshot.docs.length;

        });

        for(int i=0;i<numRate;i++){

          TotalRate += snapshot.docs[i].data()['rate'];}
        setState(() {
          avgRate=TotalRate/numRate;
        });

        /* print(avgRate);
        print(TotalRate);
        print(numRate);*/
        //  'rate' = avgRate;
      }
      else{

      }
    });
    return avgRate;
  }

}