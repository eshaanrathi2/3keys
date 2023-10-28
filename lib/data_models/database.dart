import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // Unique user id (uid) generated by firestore
  final String uid;
  // Constructor requires uid
  DatabaseService({required this.uid});

  final db = FirebaseFirestore.instance;
  
  // Dummy user data for testing:
  final user_datamodel = {
    "geo":{
      "locations":{
        "santa-clara":{"riddles-solved":0},
        "paris":{"riddles-solved":0},
      }
    },
  };
  
  Future initializeUserData() async {
    // Use when a user signs up. Need to create a register page first.
    // Set a document "users"
    return await 
    db
    .collection("users")
    .doc(uid)
    .set(this.user_datamodel)
    .onError((e, _) => print("Error writing document: $e"));

    // connect to firestore db and write the data 
    
  }
}