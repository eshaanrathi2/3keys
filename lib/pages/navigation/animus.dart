import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AnimusPage extends StatefulWidget {
  @override
  _AnimusPageState createState() => _AnimusPageState();
}

class _AnimusPageState extends State<AnimusPage> {
  File? _profileImage;
  // File? _backgroundImage;

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      final File imageFile = File(pickedImage.path); // Convert XFile to File

      setState(() {
        if (_profileImage == null) {
          _profileImage = imageFile;
        } else {
          // _backgroundImage = imageFile;
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.grey, //change your color here
            ),
            actions: [
              IconButton(
                onPressed: signUserOut,
                icon: const Icon(Icons.logout))
            ],
            title: const Text(
              "Animus", 
              style: TextStyle(
                color: Colors.black
              )
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
                            backgroundImage: FileImage(_profileImage!),
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
                // Background Image
                // _backgroundImage != null
                //     ? Stack(
                //         alignment: Alignment.bottomRight,
                //         children: [
                //           Image.file(_backgroundImage!),
                //           IconButton(
                //             icon: Icon(Icons.close),
                //             onPressed: () => _removeImage(false),
                //           ),
                //         ],
                //       )
                //     : ElevatedButton(
                //         onPressed: () => _pickImage(ImageSource.gallery),
                //         child: Text('Upload Background Image'),
                //       ),
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