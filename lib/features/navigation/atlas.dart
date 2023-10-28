import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AtlasPage extends StatelessWidget {
  const AtlasPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Atlas", 
          style: TextStyle(
            color: Colors.black
          )
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text("This is Atlas Page"),
      ),
    );
  }
}