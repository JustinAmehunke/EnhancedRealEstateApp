import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../location_horiziontal.dart';
import '../map_home.dart';
import '../map_locations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Final Year Project';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[
    mapHome(),
    Text(
      'Index 1: Business',
      style: optionStyle,

    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Accont',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Saved',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        selectedFontSize: 15,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.red, fontSize: 14),
        onTap: _onItemTapped,

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
/*........................................Bottom Navigation bar.......................*/
// BottomAppBar customBottomNavigationBar() {
//   return BottomAppBar(
//     child: Container(
//       height: 55,
//       padding: EdgeInsets.only(left: 10, right: 10,  top: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () {
//             },
//             child: Column(
//                 children:[
//                   Container(
//                       width: 30,
//                       height: 20,
//                       margin: const EdgeInsets .only(bottom: 5),
//                       child:
//                       const Icon(
//                           Icons.search_outlined,
//                           color: Colors.red,
//                       )
//
//                   ),
//                   const Text("Search")
//                 ]
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//             },
//             child: Column(
//                 children:[
//                   Container(
//                       width: 30,
//                       height: 20,
//                       margin: const EdgeInsets .only( bottom: 5),
//                       child:
//                       const Icon(
//                         Icons.favorite_border_outlined,
//                         color: Colors.red,
//                       )
//
//                   ),
//                   const Text("Saved")
//                 ]
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//             },
//             child: Column(
//                 children:[
//                   Container(
//                       width: 30,
//                       height: 20,
//                       margin: const EdgeInsets .only(bottom: 5),
//                       child:
//                       const Icon(
//                         Icons.notifications_outlined,
//                         color: Colors.red,
//                       )
//
//                   ),
//                   const Text("Notifications")
//                 ]
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//             },
//             child: Column(
//                 children:[
//                   Container(
//                       width: 30,
//                       height: 20,
//                       margin: const EdgeInsets .only( bottom: 5),
//                       child:
//                       const Icon(
//                         Icons.person_outline,
//                         color: Colors.red,
//                       )
//
//                   ),
//                   const Text("Account")
//                 ]
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
