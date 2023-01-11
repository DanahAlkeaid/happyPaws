import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataCotroller extends GetxController{
  
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }
  
  Future queryData(String queryString) async{
    return FirebaseFirestore.instance
        .collection('users')
        .where('type',isEqualTo: 'clinic')
        .where('firstname',isGreaterThanOrEqualTo:queryString )
        .get();
  }
  
}