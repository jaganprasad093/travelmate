import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonColor,
      required this.havVBorder,
      required this.text,
      this.onTap});

  final Color buttonColor;
  final bool havVBorder;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
          border: havVBorder == true
              ? Border.all(color: Colors.black.withOpacity(.4))
              : null,
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
