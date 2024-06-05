import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelmate/controller/postscreen_Controller/postscreen_controller.dart';
import 'package:travelmate/model/postModelclaa.dart';

class CustomPostWidgets extends StatelessWidget {
  const CustomPostWidgets({super.key, required this.post});
  final postModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      color: Colors.black.withOpacity(.5),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("name"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.add),
                      Text("follow"),
                      SizedBox(
                        width: 10,
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Text("delete"),
                              onTap: () {
                                context
                                    .read<postscreen_controller>()
                                    .deletePost(post.id!);
                              },
                            ),
                            PopupMenuItem(child: Text("edit")),
                          ];
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(post.caption ?? ""),
            ),
            Container(
              color: Colors.amber,
              height: 300,
              child: Image.network(
                post.image ?? "",
                fit: BoxFit.fill,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.thumb_up_alt_outlined),
                      Text("Like"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.comment),
                      Text("comment"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.recycling_rounded),
                      Text("repost"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share_outlined),
                      Text("share"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
