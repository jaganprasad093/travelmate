import 'package:flutter/material.dart';
import 'package:travelmate/model/postModelclaa.dart';

class CustomPostWidgets extends StatelessWidget {
  const CustomPostWidgets({super.key, required this.post});
  final postModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
              height: 280,
              child: Image.network(
                post.image ?? "",
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
