import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/postscreen_Controller/postscreen_controller.dart';
import 'package:travelmate/model/postModelclaa.dart';
import 'package:travelmate/view/bottom_navigation_screen/bottomNavigation.dart';
import 'package:travelmate/view/homepage/homepage.dart';

class PostScreen extends StatefulWidget {
  final File imagefile;
  const PostScreen({super.key, required this.imagefile});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          "New Post",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 400,
                    width: 300,
                    child: Image.file(widget.imagefile),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: captionController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Write a caption"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.location_on_outlined),
                      border: UnderlineInputBorder(),
                      hintText: "Add location"),
                )
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () async {
              log("uploading");
              context.read<postscreen_controller>().Uploading = true;
              context.read<postscreen_controller>().notifyListeners();
              var imageUrl = await context
                  .read<postscreen_controller>()
                  .addPostImage(widget.imagefile,
                      DateTime.now().millisecondsSinceEpoch.toString());
              log("uploading complete");

              await context.read<postscreen_controller>().addPost(postModel(
                  image: imageUrl,
                  caption: captionController.text,
                  location: locationController.text));
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("sucess")));
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen(),
                  ));
            },
            child: Container(
              height: 60,
              color: Colors.grey,
              child: Center(
                child: Consumer<postscreen_controller>(
                  builder: (context, value, child) {
                    if (value.Uploading) {
                      return CircularProgressIndicator();
                    } else {
                      return Text(
                        "Share",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
