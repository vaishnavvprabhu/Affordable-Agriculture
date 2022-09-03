import 'package:agriot/screens/constant.dart';
import 'package:flutter/material.dart';

class InfoBtn extends StatelessWidget {
  final String? text;
  final  VoidCallback? onPressed;
  final bool? outlineBtn;
  final bool? isLoading;
  InfoBtn({this.text,  this.onPressed,  this.outlineBtn,  this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(
          left: 100.0,
        ),
        child: Image(
            image: AssetImage(
                "assets/images/info.png"
            )
        ),
      )
    );
  }
}
