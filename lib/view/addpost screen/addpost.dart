import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelmate/view/addpost%20screen/postscreen.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.close),
            title: Text(
              "New Post",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostScreen(),
                        ));
                  },
                  child: Text("post"))
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 400,
                    color: Colors.black,
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Icon(
                        Icons.expand,
                        color: Colors.white,
                        size: 30,
                      ))
                ])
              ],
            ),
          ),
          SliverGrid(
              delegate:
                  SliverChildBuilderDelegate((context, index) => Container(
                        color: Colors.amberAccent,
                      )),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                mainAxisExtent: 100,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ))
        ],
      ),
    );
  }
}
