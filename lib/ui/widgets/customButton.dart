// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  String? text;
  double? height;
  double? width;
  Color? textColor;
  final Function? onPress;
  Color? buttonColor = Colors.lightGreen;
  CustomTextButton(
      {this.height,
      this.width,
      required this.buttonColor,
      required this.text,
      super.key,
      this.onPress,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
            child: Text(
          text ?? "",
          style:  TextStyle(
            fontSize: 15,
            color:textColor?? Colors.white,
          ),
        )),
      ),
    );
  }
}
