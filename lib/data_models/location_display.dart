import 'package:flutter/material.dart';
import 'loctions.dart';

class LocationDisplayPage extends StatelessWidget {
  final Location location;

  const LocationDisplayPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title: Text(
          location.name,
          style: const TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(location.imageUrl, height: 400, width: 400),
            Text("${location.name}", style: const TextStyle(fontSize: 20.0)),
            Text("Players: ${location.numOfPlayers}", style: const TextStyle(fontSize: 20.0)),
            // Text("Keys found: ${location.keysFound.toStringAsFixed(1)}", style: TextStyle(fontSize: 20.0)),
            Text("Keys hidden: ${location.totalKeys}", style: const TextStyle(fontSize: 20.0)),
            // Add more details about the hotel here
          ],
        ),
      ),
    );
  }
}
