import 'package:flutter/material.dart';

class Location {
  final String name;
  final String imageUrl;
  final int numOfPlayers;
  final int keysFound;
  final int totalKeys;

  Location({required this.name, required this.imageUrl, required this.numOfPlayers, required this.keysFound, required this.totalKeys});
}

List<Location> locations = [
  Location(name: "Santa Clara", imageUrl: "lib/assets/locations/santa-clara/scu-church.png", numOfPlayers: 25, keysFound: 10, totalKeys: 100),
];