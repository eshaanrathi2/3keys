import 'package:flutter/material.dart';

class AnimusPage extends StatelessWidget {
  const AnimusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animus Page"),
      ),
      body: Center(
        child: Text("This is Animus Page"),
      ),
    );
  }
}