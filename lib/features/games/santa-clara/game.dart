import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_3_keys/features/games/santa-clara/in_game_locations.dart';
import 'package:project_3_keys/features/games/santa-clara/info_key_1.dart';
import 'package:project_3_keys/features/games/santa-clara/riddles/riddle1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SantaClaraGame extends StatelessWidget {
  const SantaClaraGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title: const Text(
          "The journey begins", 
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )
        ),
        backgroundColor: Colors.white,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // vertical spacing of 50
          SizedBox(height: 20),
          // logo
          
          // step into the unknown traveller
          Text(
            "This game is about the magical world of Santa Clara...\n\nA vibrant city, where the future meets the past in perfect harmony.",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),



          // vertical spacing of 50
          SizedBox(height: 20),
          // logo

          ElevatedButton(
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Riddle1(),
                  ),
                );
            },
                
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
              textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold)),

            child: Text("Go to the riddles",style: TextStyle(color: Colors.white),),
          ),
        ],       
      ),

    );
  }
}