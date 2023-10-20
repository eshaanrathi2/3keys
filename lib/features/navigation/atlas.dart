import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// class AtlasPage extends StatelessWidget {
//   const AtlasPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Atlas", 
//           style: TextStyle(
//             color: Colors.black
//           )
//         ),
//         backgroundColor: Colors.white,
//       ),
//     );
//   }
// }



class AtlasPage extends StatefulWidget {
  const AtlasPage({super.key});

  @override
  State<AtlasPage> createState() => _AtlasPage();
}



class _AtlasPage extends State<AtlasPage> {

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





  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          _buildProfilePicArea(),
          SizedBox(height: 10), // Some spacing between the profile pic area and text
          _buildProfileText(),
          Expanded(child: _buildTabBar()),
        ],
      ),
    );
  }


  Widget _buildProfilePicArea() {
  return SingleChildScrollView(
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
        ],
      ),
    ),
  );
}


  Widget _buildProfileText() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "Your profile description goes here. You can add 1-2 lines of text.",
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTabBar() {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: "Chronicles"),
              Tab(text: "Ledger"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildChroniclesPage(),
                _buildLedgerPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChroniclesPage() {
    return Center(
      child: Text("Chronicles Page Content"),
    );
  }

  Widget _buildLedgerPage() {
    return Center(
      child: Text("Ledger Page Content"),
    );
  }
}
