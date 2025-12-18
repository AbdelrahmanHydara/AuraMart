import 'package:cloud_firestore/cloud_firestore.dart';
import 'database_services.dart';

class FireStoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;



  // Add Data to Database
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      await firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }



  // Get Data from Database
  @override
  Future<dynamic> getData({
    String? docId,
    Map<String, dynamic>? query,
    required String path,
  }) async {
    try {
      if (docId != null) {
        var data = await firestore.collection(path).doc(docId).get();
        return data.data() ?? {};
      } else {
        Query<Map<String, dynamic>> collectionRef = firestore.collection(path);
        if (query != null) {
          if (query["orderBy"] != null) {
            var orderByField = query["orderBy"];
            var descending = query["descending"] == true;
            collectionRef = collectionRef.orderBy(orderByField, descending: descending);
          }
          if (query['limit'] != null) {
            collectionRef = collectionRef.limit(query['limit']);
          }
        }
        var snapshot = await collectionRef.get();
        if (snapshot.docs.isEmpty) return <Map<String, dynamic>>[];

        return snapshot.docs.map((doc) => doc.data()).toList();
      }
    } catch (e) {
      return <Map<String, dynamic>>[];
    }
  }




  // Check Data Exists in Database
  @override
  Future<bool> checkDataExists({
    required String docId,
    required String path,
  }) async {
    var doc = await firestore.collection(path).doc(docId).get();
    return doc.exists;
  }
}
