import 'package:agriot/screens/constant.dart';
import 'package:agriot/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 12.0,
                  right: 100.0,
                ),
                child: Text("Dashboard",
                  style: Constants.regularHeading,
                ),
              ),
              Text("Buttons"),
              Text("Buttons"),
              CustomBtn(
                text: "History",
                onPressed: (){
                  print("Clicked the History Button");
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
