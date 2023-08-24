import 'package:flutter/material.dart';

class TreasuryPage extends StatelessWidget {
  const TreasuryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Treasury Page"),
      ),
      body: Center(
        child: Text("This is Treasury Page"),
      ),
    );
  }
}