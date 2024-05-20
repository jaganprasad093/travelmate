import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelmate/view/bottom_navigation_screen/bottomNavigation.dart';
import 'package:travelmate/view/homepage/homepage.dart';
import 'package:travelmate/view/login_screen/login.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      var user = FirebaseAuth.instance.currentUser;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                user == null ? LoginScreen() : BottomNavigationScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "splash screen",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
