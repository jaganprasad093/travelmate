import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/postscreen_Controller/postscreen_controller.dart';
import 'package:travelmate/view/addpost%20screen/addpost1.dart';

import 'package:travelmate/view/event_screen/events.dart';
import 'package:travelmate/view/homepage/homepage.dart';
import 'package:travelmate/view/profile_main_screen/profilemain.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List listscreen = [
    EventsScreen(),
    Homepage(),
    ChangeNotifierProvider(
        create: (context) => postscreen_controller(), child: AddPostScreen()),
    Profilepage()
  ];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listscreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black12,
          currentIndex: selectedIndex,
          fixedColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note_rounded),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'profile',
            ),
          ]),
    );
  }
}
