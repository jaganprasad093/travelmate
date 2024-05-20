import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/loginscreen_controller/login_controller.dart';
import 'package:travelmate/view/bottom_navigation_screen/bottomNavigation.dart';
import 'package:travelmate/view/homepage/homepage.dart';
import 'package:travelmate/view/registration_screen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerobj = context.watch<LoginscreenController>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login page",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "E-mail "),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "phone number "),
                ),
              ],
            ),
          ),
          Column(
            children: [
              providerobj.isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (emailcontroller.text.isNotEmpty &&
                            passcontroller.text.isNotEmpty) {
                          context
                              .read<LoginscreenController>()
                              .login(
                                  context: context,
                                  email: emailcontroller.text,
                                  password: passcontroller.text)
                              .then((value) {
                            // login sucess
                            if (value == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text("login sucess")));

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavigationScreen(),
                                  ));
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("enter valid email and password")));
                        }
                      },
                      child: Text("Login")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have a account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ));
                      },
                      child: Text("register")),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
