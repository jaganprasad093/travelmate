import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/event_controller/eventcontroller.dart';
import 'package:travelmate/controller/loginscreen_controller/login_controller.dart';
import 'package:travelmate/controller/postscreen_Controller/postscreen_controller.dart';
import 'package:travelmate/controller/registration_controller/registration_controller.dart';
import 'package:travelmate/firebase_options.dart';
import 'package:travelmate/view/splash_screen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Travelmate());
}

class Travelmate extends StatelessWidget {
  const Travelmate({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => eventsControllerScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginscreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => postscreen_controller(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SpalshScreen(),
      ),
    );
  }
}
