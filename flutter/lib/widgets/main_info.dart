import 'package:agriot/screens/constant.dart';
import 'package:flutter/material.dart';

class MainInfo extends StatelessWidget {
  final String? text;
  final  VoidCallback? onPressed;
  final bool? outlineBtn;
  final bool? isLoading;
  MainInfo({this.text,  this.onPressed,  this.outlineBtn,  this.isLoading});

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
          horizontal: 40.0,
          vertical: 10.0,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ESP8266",
                  style: Constants.mainHead,
                ),
                Row(
                  children: [
                    Text("Last Updated:",
                      style: Constants.mainStatus,
                    ),
                    Text(text.toString(),
                      style: Constants.mainStatus,
                    )
                  ],
                )
              ],
            ),
            Image(
              image: AssetImage(
                  "assets/images/esp_mod.png"
              ),
            )
              ],
        ),
      ),
    );
  }
}