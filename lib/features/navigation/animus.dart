import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class AnimusPage extends StatefulWidget {
  @override
  _AnimusPageState createState() => _AnimusPageState();
}

class _AnimusPageState extends State<AnimusPage> {
  File? _profileImage;
  // File? _backgroundImage;
  String? _profileImageUrl; // Add a field to store the profile image URL
  String baseUrl = 'https://console.firebase.google.com/u/4/project/keys-5bf5e/firestore/data/~2F'; // Database's base URL. Here Firestore.
  final user = FirebaseAuth.instance.currentUser!; // Current user.
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Instance of FirebaseFirestore.
  final FirebaseAuth _auth = FirebaseAuth.instance;


  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      final File imageFile = File(pickedImage.path);

      // Generate a unique filename for the image
      String fileName = "${user.uid}_profile_image.jpg";

      // Upload the image URL to Firebase Firestore
      // Replace 'users' with the actual collection name where user data is stored
      // Replace 'profileImageUrl' with the field where you want to store the profile image URL
      await _firestore.collection('users').doc(user.uid).update({
        'profileImageUrl': fileName,
      });

      setState(() {
        if (_profileImage == null) {
          _profileImage = imageFile;
        }
      });
    }
  }



  void _removeImage(bool isProfileImage) {
    setState(() {
      if (isProfileImage) {
        _profileImage = null;
      } else {
        // _backgroundImage = null;
      }
    });
  }


  @override
  void initState() {
    super.initState();
    // Retrieve the profile image URL from Firestore when the widget initializes
    // Replace 'users' and 'profileImageUrl' with the actual collection and field names
    _firestore.collection('users').doc(user.uid).get().then((document) {
      if (document.exists) {
        setState(() {
          _profileImageUrl = document.data()?['profileImageUrl'] as String;
        });
      }
    });
  }

  Widget _buildProfilePicArea() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(16),
      child: CircleAvatar(
        radius: 50, // Adjust the size as needed
        backgroundImage: AssetImage("assets/profile_image.jpg"), // Use your image asset
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.logout),
            )
          ],
          title: const Text(
            "Animus",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                // Profile Image
                _profileImage != null
                    ? Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: _profileImageUrl != null
                                ? NetworkImage(_profileImageUrl!)
                                : FileImage(_profileImage!) as ImageProvider,
                          ),

                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => _removeImage(true),
                          ),
                        ],
                      )
                    : CircleAvatar(
                        radius: 60.0,
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () => _pickImage(ImageSource.gallery),
                        ),
                      ),
                SizedBox(height: 20.0),
                
                // Other user information widgets can go here
                
                const TabBar(
                  tabs: [
                    Tab(
                      // text: 'Chronicles',
                      // Change the text color of this tab to black
                      // You can customize other styles here as well
                      iconMargin: EdgeInsets.all(0),
                      child: Text(
                        'Chronicles',
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                    ),

                    Tab(
                      // text: 'Tab 2',
                      // Change the text color of this tab to black
                      // You can customize other styles here as well
                      iconMargin: EdgeInsets.all(0),
                      child: Text(
                        'Ledger',
                        style: TextStyle(color: Colors.black,fontSize: 18),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}











// Old HomePage. Just has logout button.

// class AnimusPage extends StatefulWidget {
//   AnimusPage({super.key});
//   @override
//   State<AnimusPage> createState() => _AnimusPageState();
// }

// class _AnimusPageState extends State<AnimusPage> {

//   final user = FirebaseAuth.instance.currentUser!;

//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.grey, //change your color here
//         ),
//         actions: [
//           IconButton(
//             onPressed: signUserOut,
//             icon: const Icon(Icons.logout))
//         ],
//         title: const Text(
//           "Animus", 
//           style: TextStyle(
//             color: Colors.black
//           )
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Text("Logged in as ${user.email!}"),
//       ),
//     );
//   }
// }