import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_3_keys/features/games/santa-clara/in_game_locations.dart';
import 'package:project_3_keys/features/games/santa-clara/info_key_1.dart';

class Riddle1 extends StatefulWidget {
  // final InGameLocation inGameLocation;
  const Riddle1({
    super.key, 
    // required this.inGameLocation,
  });

  @override
  State<Riddle1> createState() => _Riddle1State();
}

class _Riddle1State extends State<Riddle1> {


  bool canExplore = false;
  

  @override
  void initState() {
    super.initState();
    _checkDistanceToHotel();
  }


Future<void> _checkDistanceToHotel() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return Future.error('Location Not Available');
        }
      } else {
        throw Exception('Error');
      }

      permission = await Geolocator.requestPermission();
      
      final userLocation = await Geolocator.getCurrentPosition();
      final hotelLocation = inGameLocations[0];

      final distance = Geolocator.distanceBetween(
        userLocation.latitude,
        userLocation.longitude,
        hotelLocation.latitude,
        hotelLocation.longitude,
      );
      print(userLocation.latitude);
      print(userLocation.longitude);
      print(hotelLocation.latitude);
      print(hotelLocation.longitude);

      if (distance <= 10) {
        setState(() {
          canExplore = true;
        });
      } else {
        setState(() {
          canExplore = false;
        });
      }
    } catch (e) {
      print("Error checking distance: $e");
    }
  }







  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title: const Text(
          "1st Key is hidden at...",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )
        ),
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
      
          children: [
            const Text("Riddle 1... yada yada\n\n",style: TextStyle(fontSize: 20),),
            const Text("User should goto the coordinates specified by this riddle.\n",style: TextStyle(fontSize: 20),),
            const Text("If the user’s current location is within 500 meters of the coordinates of the location then allow user to click on the check button.\n",style: TextStyle(fontSize: 20),),
            const Text("Else prompt the user that “you are away, try again” when he clicks on the explore  button.",style: TextStyle(fontSize: 20),),
          
          
          // Explore button
          ElevatedButton(
            onPressed: canExplore
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoKey1(),
                      ),
                    );
                  }
                : () {
                    // Display a message to the user indicating they are too far from the hotel
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("You are too far"),
                          content: Text("Try again when you are closer to the riddle location."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  },
            child: Text("Grab 1st Key 1"),
          ),

          ],
        ),
      ),


    );
  }
}

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
          "Game: Santa Clara", 
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )
        ),
        backgroundColor: Colors.white,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // vertical spacing of 50
          SizedBox(height: 20),
          // logo
          
          // step into the unknown traveller
          Text(
            "About the Location...\nYada Yada",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),




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

            child: Text("Goto 1st riddle",style: TextStyle(color: Colors.white),),
          ),
        ],       
      ),

    );
  }
}