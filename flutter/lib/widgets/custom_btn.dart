import 'package:agriot/screens/constant.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String? text;
  final  VoidCallback? onPressed;
  final bool? outlineBtn;
  final bool? isLoading;
  CustomBtn({this.text,  this.onPressed,  this.outlineBtn,  this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12.0,),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        child: Text(
          text ?? "Text ",
          style: Constants.smallbtn,
        ),
      ),
    );
  }
}
