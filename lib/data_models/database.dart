import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final db = FirebaseFirestore.instance;
  Future updateUserData() async {
    // use when a user signs up. need to create a register page first.

    // dummy data for testing
    final docData = {
      "stringExample": "Hello world!",
      "booleanExample": true,
      "numberExample": 3.14159265,
      "dateExample": Timestamp.now(),
      "listExample": [1, 2, 3],
      "nullExample": null
    };
    
    // connect to firestore db and write the data 
    db
    .collection("users")
    .doc(uid)
    .set(docData)
    .onError((e, _) => print("Error writing document: $e"));
  }
}