import 'package:flutter/material.dart';

class Custom_profile_data extends StatelessWidget {
  const Custom_profile_data(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Text(
              value,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            )
          ],
        )
      ],
    );
  }
}
