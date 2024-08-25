import 'package:chat_app_firebase/pages/home_page.dart';
import 'package:chat_app_firebase/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
     SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SalomonBottomBar(
        curve: Easing.standard,
        itemShape: const StadiumBorder(),
        unselectedItemColor:Colors.redAccent ,
        selectedItemColor: const Color.fromRGBO(109, 203, 192, 1),
        backgroundColor: const Color.fromRGBO(65, 70, 69, 1),
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items:[
         SalomonBottomBarItem(
          icon: const Icon(Icons.home), title: const Text("Home")),

        SalomonBottomBarItem(
          icon: const Icon(Icons.settings), title: const Text("Settings")), // Added 'const' here

        
        ]
        ),
      /*bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),*/
    );
  }
}