import 'package:flutter/material.dart';

class Riddle1 extends StatelessWidget {
  const Riddle1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey, //change your color here
        ),
        title: const Text(
          "1st Key",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )
        ),
        backgroundColor: Colors.white,
      ),

      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
      
          children: [
            Text("Riddle 1... yada yada",style: TextStyle(fontSize: 20),)
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