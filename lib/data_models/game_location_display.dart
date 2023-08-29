import 'package:flutter/material.dart';
import 'game_loctions.dart';

import '../game_locations/santa-clara/game.dart';

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
            Text("Location id: ${location.id}", style: const TextStyle(fontSize: 20.0)),
            // Add more details about the hotel here
          
            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                if (location.id == "santa-clara") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SantaClaraGame(),
                    ),
                  );
                } else if (location.id == "cairo") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SantaClaraGame(),
                    ),
                  );
                } else if (location.id == "bali") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SantaClaraGame(),
                    ),
                  );
                }
                else if (location.id == "paris") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SantaClaraGame(),
                    ),
                  );
                }
                // Add more else-if conditions for other hotels as needed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
                textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold)),

              child: Text("Play Game",style: TextStyle(color: Colors.white),),
              
            
            ),

          
          ],
        ),
      ),
    );
  }
}
