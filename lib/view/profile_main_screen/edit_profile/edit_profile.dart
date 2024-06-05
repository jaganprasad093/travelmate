import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/edit_controller/edit_controller.dart';
import 'package:travelmate/controller/event_controller/eventcontroller.dart';
import 'package:travelmate/model/editModelclass.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<editControlScreen>(context, listen: false).addEventListner();
    });
    super.initState();
  }

  TextEditingController name_controller = TextEditingController();
  TextEditingController uname_controller = TextEditingController();
  TextEditingController bio_controller = TextEditingController();
  TextEditingController gender_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          "Edit profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Change profile pic",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: name_controller,
              decoration: InputDecoration(hintText: "Name"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: uname_controller,
              decoration: InputDecoration(hintText: "User name"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: bio_controller,
              decoration: InputDecoration(hintText: "Bio"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: gender_controller,
              decoration: InputDecoration(hintText: "Gender"),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () async {
                await context.read<editControlScreen>()
                  ..addData(EditModel(
                    bio: bio_controller.text,
                    uname: uname_controller.text,
                    name: name_controller.text,
                  ));
                print("sucess");
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("sucess")));
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    "UPDATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
