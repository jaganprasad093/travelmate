import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/postscreen_Controller/postscreen_controller.dart';
import 'package:travelmate/model/postModelclaa.dart';
import 'package:travelmate/view/homepage/widgets/customPostWidgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.menu),
            title: Center(
                child: Column(
              children: [
                Text(
                  "Travelmates",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.6)),
                ),
              ],
            )),
            actions: [
              // CircleAvatar(
              //   // radius: 10,
              //   child: Icon(Icons.person),
              // ),
              Icon(Icons.search)
            ],
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://images.pexels.com/photos/1891882/pexels-photo-1891882.jpeg?auto=compress&cs=tinysrgb&w=400",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Consumer<postscreen_controller>(
            builder: (context, value, child) => SliverList.separated(
              itemBuilder: (context, index) => CustomPostWidgets(
                post: value.postList[index],
                //event: value.eventList[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: value.postList.length,
            ),
          )
        ],
      ),
    );
  }
}
