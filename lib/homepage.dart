import 'dart:convert';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid/info/worldinfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }
  List countryData;

  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  Future refreshedata() async{
    fetchWorldWideData();
    fetchCountryData();

}

  @override
  void initState() {
    // TODO: implement initState
    refreshedata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: RefreshIndicator(
        onRefresh:refreshedata ,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                color: Colors.orange[100],
                child: Text(
                  DataSource.quote,
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),

              worldData == null
                  ? CircularProgressIndicator()
                  : WorldInfo(
                      worldData: worldData,
                    ),


            ],
          ),
        ),
      ),
    );
  }
}

class DataSource {
  static String quote =
      "Please stay home, stay safe, stay clean. This are the only three ways to beat Corona";
  static List questionAnswers = [
    {
      "question": "What is CoronaVirus?",
      "answer":
          "Coronavirus disease 2019 (COVID-19) is an infectious disease caused by severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2).[9] The disease was first identified in December 2019 in Wuhan, the capital of China's Hubei province, and has since spread globally, resulting in the ongoing 2019–20 coronavirus pandemic.[10][11] Common symptoms include fever, cough, and shortness of breath.[5] Other symptoms may include fatigue, muscle pain, diarrhoea, sore throat, loss of smell, and abdominal pain.[5][12][13] The time from exposure to onset of symptoms is typically around five days but may range from two to fourteen days.[5][14] While the majority of cases result in mild symptoms, some progress to viral pneumonia and multi-organ failure.[10][15] As of 19 April 2020, more than 2.34 million cases have been reported across 185 countries and territories,[16] resulting in more than 161,000 deaths. More than 602,000 people have recovered."
    }
  ];
}
