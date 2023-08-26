import 'package:flutter/material.dart';
import 'loctions.dart';

class LocationDisplayPage extends StatelessWidget {
  final Location location;

  const LocationDisplayPage({required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(location.imageUrl, height: 200, width: 200),
            Text("Name: ${location.name}", style: TextStyle(fontSize: 24.0)),
            // Text("Number of Players: ${location.numOfPlayers.toStringAsFixed(1)}", style: TextStyle(fontSize: 20.0)),
            // Text("Keys found: ${location.keysFound.toStringAsFixed(1)}", style: TextStyle(fontSize: 20.0)),
            // Text("Total keys available at this location: ${location.totalKeys.toStringAsFixed(1)}", style: TextStyle(fontSize: 20.0)),
            // Add more details about the hotel here
          ],
        ),
      ),
    );
  }
}
