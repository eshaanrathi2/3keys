import 'package:flutter/material.dart';
import 'package:project_3_keys/data_models/location_display.dart';

import '../../data_models/loctions.dart';


class LocationItem extends StatelessWidget {
  final Location location;

  LocationItem({required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(location.imageUrl, height: 100, width: 100),
          Text(location.name, style: TextStyle(fontSize: 16.0)),
          // Text("Rating: ${location.keysFound.toStringAsFixed(1)}"),
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
      // appBar: AppBar(
      //   title: Text("Exploranda Page"),
      // ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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