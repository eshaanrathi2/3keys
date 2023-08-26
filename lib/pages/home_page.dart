import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'navigation/atlas.dart';
import 'navigation/exploranda.dart';
import 'navigation/treasury.dart';
import 'navigation/animus.dart';

// Old HomePage. Just has logout button.

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   final user = FirebaseAuth.instance.currentUser!;

//   void signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: signUserOut,
//             icon: const Icon(Icons.logout))
//         ],
//       ),
//       body: Center(
//         child: Text("Home Page of 3 Keys.\nLogged in as " + user.email!),
//       ),
//     );
//   }
// }


// New Home Page. Has 4 navigation buttons and links to those pages.
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Home Page'),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Atlas'),
//               Tab(text: 'Exploranda'),
//               Tab(text: 'Treasury'),
//               Tab(text: 'Animus'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             AtlasPage(),
//             ExplorandaPage(),
//             TreasuryPage(),
//             AnimusPage(),
//           ],
//         ),
//       ),
//     );
//   }
// }




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AtlasPage(),
    ExplorandaPage(),
    TreasuryPage(),
    AnimusPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Atlas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_out),
            label: 'Exploranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            label: 'Treasury',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Animus',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
