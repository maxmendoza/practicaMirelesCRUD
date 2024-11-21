import 'package:flutter/material.dart';
import 'package:learning/moduls/map/map_sample.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'profile.dart';
import 'reservaciones.dart';
import 'top.dart';

class Navigation extends StatefulWidget {
  final bool tutorial;
  const Navigation({super.key, this.tutorial = false});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Top(),
    Reservaciones(),
    Profile(),
    MapSample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkTutorial();
  }

  Future<void> _checkTutorial() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? tutorial = prefs.getBool('tutorial');
    // await prefs.remove('tutorial');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Top 5',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.room_service),
              label: 'Reservacion',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp),
              label: 'Mapa',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 255, 0, 234),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ));
  }
}
