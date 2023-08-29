import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Old HomePage. Just has logout button.

class AnimusPage extends StatelessWidget {
  AnimusPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Text("Logged in as ${user.email!}"),
      ),
    );
  }
}




// class AnimusPage extends StatelessWidget {
//   AnimusPage({super.key});

//   // HomePage({super.key});

//   final user = FirebaseAuth.instance.currentUser!;

//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: signUserOut,
//             icon: const Icon(Icons.logout))
//         ],
//       ),
//       body: Center(
//         child: Text("Logged in as " + user.email!),
//       ),
//     );
//   }
// }