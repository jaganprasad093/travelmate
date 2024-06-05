import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/postscreen_Controller/postscreen_controller.dart';
import 'package:travelmate/view/homepage/widgets/customPostWidgets.dart';

class CustomPic extends StatefulWidget {
  const CustomPic({super.key});

  @override
  State<CustomPic> createState() => _CustomPicState();
}

class _CustomPicState extends State<CustomPic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<postscreen_controller>(
                builder: (context, value, child) => ListView.separated(
                    itemBuilder: (context, index) =>
                        CustomPostWidgets(post: value.postList[index]),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 3))
          ],
        ),
      ),
    );
  }
}
