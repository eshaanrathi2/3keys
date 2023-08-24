import 'package:flutter/material.dart';

class AtlasPage extends StatelessWidget {
  const AtlasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atlas Page"),
      ),
      body: Center(
        child: Text("This is Atlas Page"),
      ),
    );
  }
}