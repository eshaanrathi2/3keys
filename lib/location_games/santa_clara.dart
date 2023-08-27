import 'package:flutter/material.dart';

class SantaClaraGame extends StatelessWidget {
  const SantaClaraGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title: const Text(
          "Welcome to the world of Santa Clara", 
          style: TextStyle(
            color: Colors.black
          )
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}