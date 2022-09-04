import 'dart:async';

import 'package:agriot/screens/constant.dart';
import 'package:agriot/widgets/custom_btn.dart';
import 'package:agriot/widgets/info_btn.dart';
import 'package:agriot/widgets/main_info.dart';
import 'package:agriot/widgets/sub_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';



class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

Future<String> getMoistureJsonData() async{
  Response response = await get(Uri.parse('https://api.thingspeak.com/channels/1714621/fields/field1/1.json?api_key=G63QV5S759X5OXZ9&results=1'));
  print(response.body);
  final data = jsonDecode(await response.body);

  //data.forEach((element) {
  //Map obj = element;
  String humidityRaw = data['field1'];
  int humidityPercent = int.parse(humidityRaw);
  double humidityPercentCalc = 100  * humidityPercent/1024;
  String humidity = "" + humidityPercentCalc.toInt().toString() + "%";
  //String pump_state = obj ['field2'];
  //});
  return humidity;
}

Future<String> getDateJsonData() async{
  Response response = await get(Uri.parse('https://api.thingspeak.com/channels/1714621/fields/field1/1.json?api_key=G63QV5S759X5OXZ9&results=1'));
  print(response.body);
  final data = jsonDecode(await response.body);

  //data.forEach((element) {
  //Map obj = element;
  String lastupdated = data['created_at'];
  String lastupdate = lastupdated.substring(11,19);
  print("object ");
  print(lastupdate);
  //String pump_state = obj ['field2'];
  //});
  return lastupdate;
}

Future<String> getPumpJsonData() async{
  Response response = await get(Uri.parse('https://api.thingspeak.com/channels/1714621/fields/field3/1.json?api_key=G63QV5S759X5OXZ9&results=1'));
  print(response.body);
  final data = jsonDecode(await response.body);

  //data.forEach((element) {
  //Map obj = element;
  String pumpState = data['field3'];
  String pumpStatus;
  if (pumpState == 0)
    {
      pumpStatus = "OFF";
    }
  /*else if(pumpState == 1)
    {
      pumpStatus = "ON";
    }*/
  else
    {
      pumpStatus = "ON";
    }
  return pumpStatus;
}

  funcThatMakesAsyncCall() async {
    String result = await getMoistureJsonData();
    print(result);
    final String stringHumidity=result;
    }

class _LandingPageState extends State<LandingPage> {
  var field1 = null;
  var field3 = null;
  var date = null;

  Future<String> moisture = getMoistureJsonData();
  String baseMoisture() => moisture.toString();


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
                  right: 20.0,
                ),
                margin: EdgeInsets.only(
                  right: 10.0,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 25.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Dashboard",
                        style: Constants.regularHeading,
                      ),
                      InfoBtn()
                    ],
                  ),
                ),
              ),
              MainInfo(
                text: date,
              ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SubInfo(
                      img: "assets/images/humid.png",
                      title: "Moisture %",
                      text: field1,
                    ),
                    SubInfo(
                      img: "assets/images/pump.png",
                      title: "Pump State",
                      text: field3,
                    ),
                  ],
                ),
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



  @override
  void initState() {
    getMoistureJsonData().then((humidity) {
      setState(() {
        field1 = humidity;
      });
    });
    getPumpJsonData().then((pumpStatus) {
      setState(() {
        field3 = pumpStatus;
      });
    });
    getDateJsonData().then((lastUpdate) {
      setState(() {
        date = lastUpdate;
      });
    });
    super.initState();
  }
}
