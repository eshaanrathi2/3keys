import 'package:flutter/material.dart';

class InGameLocation {
  final String name;
  final String id;
  final String imageUrl;
  final double latitude; // in game locations' latitude
  final double longitude; // in game locations' longitude


  InGameLocation({
    required this.name, 
    required this.id , 
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
  });
}

List<InGameLocation> inGameLocations = [
  InGameLocation(name: "Santa Clara University Library", id:"scu-library",imageUrl: "lib/assets/locations/santa-clara/scu-church.png", latitude: 37.785834, longitude: -122.406417,),
  InGameLocation(name: "Santa Clara University Library", id:"scu-library",imageUrl: "lib/assets/locations/santa-clara/scu-church.png", latitude: 25, longitude: 10,),
  InGameLocation(name: "Santa Clara University Library", id:"scu-library",imageUrl: "lib/assets/locations/santa-clara/scu-church.png", latitude: 25, longitude: 10,),
];