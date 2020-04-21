import 'dart:convert';
import 'package:http/http.dart' as http;
import 'to.dart';

import 'package:flutter/material.dart';

class TOP extends StatefulWidget {
  @override
  _TOPState createState() => _TOPState();
}

class _TOPState extends State<TOP> {
  List countryData;

  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    fetchCountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
       countryData==null?LinearProgressIndicator(): Top(countryData: countryData,),])
    );
  }
}
