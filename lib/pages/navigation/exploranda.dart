import 'package:flutter/material.dart';
import 'package:project_3_keys/data_models/location_display.dart';

import '../../data_models/loctions.dart';


class LocationItem extends StatelessWidget {
  final Location location;

  const LocationItem({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey),
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Image.asset(location.imageUrl, fit: BoxFit.cover)
          ),

          Text(location.name, style: const TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}



class ExplorandaPage extends StatelessWidget {
  const ExplorandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Exploranda", 
          style: TextStyle(
            color: Colors.black
          )
        ),
        backgroundColor: Colors.white,
      ),

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ), 
        itemCount: locations.length,
        itemBuilder: (context, index){
          final location  = locations[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => LocationDisplayPage(location: location),
                )
              );
            },
            child: LocationItem(location:location),
          );
        }
      ),
    );
  }
}