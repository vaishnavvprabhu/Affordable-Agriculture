import 'package:agriot/screens/constant.dart';
import 'package:flutter/material.dart';

class SubInfo extends StatelessWidget {
  final String? text;
  final String? img;
  final String? title;
  final  VoidCallback? onPressed;
  final bool? outlineBtn;
  final bool? isLoading;
  SubInfo({this.text, this.img, this.title,  this.onPressed,  this.outlineBtn,  this.isLoading});

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
          horizontal: 32.0,
          vertical: 12.0,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image(
                  image: AssetImage(
                    img ?? "assets/images/humid.png"
                  ),
                width: 32.0,
                height: 38.0,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 5.0
                ),
                child: Text(
                  title ?? "Humidity",
                  style: Constants.subHead,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 5.0,
                ),
                child: Text(
                 text ?? "data",
                  style: Constants.subStatus,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}