import 'package:flutter/material.dart';

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
    );
  }
}