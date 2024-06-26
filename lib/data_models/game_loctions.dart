import 'package:flutter/material.dart';

class Location {
  final String name;
  final String id;
  final String imageUrl;
  final int numOfPlayers;
  final int keysFound;
  final int totalKeys;

  Location({
    required this.name, 
    required this.id , 
    required this.imageUrl, 
    required this.numOfPlayers, 
    required this.keysFound, 
    required this.totalKeys,
  });
}

List<Location> locations = [
  Location(name: "Santa Clara", id:"santa-clara",imageUrl: "lib/assets/locations/santa-clara/scu-church.png", numOfPlayers: 25, keysFound: 10, totalKeys: 100),
  Location(name: "Cairo, Egypt", id:"cairo",imageUrl: "lib/assets/locations/cairo/mosque-of-sultan.jpg", numOfPlayers: 35, keysFound: 20, totalKeys: 150),
  Location(name: "Bali, Indonesia", id:"bali", imageUrl: "lib/assets/locations/bali/monkey-forest.png", numOfPlayers: 45, keysFound: 10, totalKeys: 200),
  Location(name: "Paris, France", id:"paris", imageUrl: "lib/assets/locations/paris/eiffel-tower.png", numOfPlayers: 30, keysFound: 15, totalKeys: 100),
];