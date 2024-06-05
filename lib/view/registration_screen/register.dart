import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/registration_controller/registration_controller.dart';
import 'package:travelmate/view/homepage/homepage.dart';
import 'package:travelmate/view/login_screen/login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController dob_controller = TextEditingController();
  TextEditingController gender_controller = TextEditingController();
  var gender = "male";
  @override
  Widget build(BuildContext context) {
    final providerobj = context.watch<RegistrationScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register Now",
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
                    controller: username_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "User Name "),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    obscureText: true,
                    controller: passcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "phone number "),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "E-mail "),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now());
                      if (date != null) {
                        dob_controller.text = DateFormat("d/M/y").format(date);
                      }
                    },
                    obscureText: false,
                    controller: dob_controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Date of birth  "),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // TextField(
                  //   obscureText: true,
                  //   controller: gender_controller,
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(), hintText: "Gender "),
                  // ),
                  Row(
                    children: [
                      RadioMenuButton(
                        value: "male",
                        child: Text("Male"),
                        groupValue: gender,
                        onChanged: (value) {
                          gender = value ?? "";
                          setState(() {});
                        },
                      ),
                      RadioMenuButton(
                        value: "female",
                        groupValue: gender,
                        child: Text("Female"),
                        onChanged: (value) {
                          gender = value ?? "";
                          setState(() {});
                        },
                      ),
                      RadioMenuButton(
                        value: "others",
                        groupValue: gender,
                        child: Text("others"),
                        onChanged: (value) {
                          gender = value ?? "";
                          setState(() {});
                        },
                      ),
                    ],
                  )
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
                              passcontroller.text.isNotEmpty &&
                              username_controller.text.isNotEmpty) {
                            context
                                .read<RegistrationScreenController>()
                                .register(
                                    dob: dob_controller.text,
                                    gender: gender,
                                    username: username_controller.text,
                                    context: context,
                                    email: emailcontroller.text,
                                    password: passcontroller.text)
                                .then((value) {
                              // login sucess
                              if (value == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text("register sucess")));

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                    "enter valid email, password or username")));
                          }
                        },
                        child: Text("Register")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
