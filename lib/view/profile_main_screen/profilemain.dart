import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/postscreen_Controller/postscreen_controller.dart';
import 'package:travelmate/global_widgets/custom_button.dart';
import 'package:travelmate/view/homepage/widgets/customPostWidgets.dart';
import 'package:travelmate/view/profile_main_screen/edit_profile/edit_profile.dart';
import 'package:travelmate/view/profile_main_screen/widgets/coustom_profile_widget.dart';
import 'package:travelmate/view/profile_main_screen/widgets/custompic.dart';
import 'package:travelmate/view/profile_screen_settings/profilescreen_settings.dart';

class Profilepage extends StatefulWidget {
  Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
                icon: Icon(Icons.menu))
          ],
          centerTitle: true,
          leadingWidth: 100,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "t__k",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.black.withOpacity(.1),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 43,
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Custom_profile_data(title: "6", value: "Posts"),
                          Custom_profile_data(title: "3563", value: "Follwers"),
                          Custom_profile_data(title: "863", value: "Following")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "human",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Chasing sunsets and dreams \n| Digital storyteller | \n Making memories around the world 🌎",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ));
                  },
                  child: CustomButton(
                      buttonColor: Colors.black,
                      havVBorder: true,
                      text: "Edit Profile"),
                ),
                SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 0,
                ),
                Consumer<postscreen_controller>(
                  builder: (context, value, child) => GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomPic()));
                      },
                      child: Container(
                        child: Image.network(
                          value.postList[index].image ?? "",
                          fit: BoxFit.cover,
                        ),
                        height: MediaQuery.sizeOf(context).width * .33,
                        width: MediaQuery.sizeOf(context).width * .33,
                      ),
                    ),
                    itemCount: value.postList.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
