import 'dart:convert';


import 'package:covid/homepage.dart';
import 'package:covid/info/Country.dart';
import 'pie chart.dart';
import 'package:covid/info/worldinfo2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'search.dart';


class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  int _selectedTabIndex = 0;
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

  List _pages = [
    HomePage(),
    TOP(),
    CountryPage(),
    Piechart(),
  ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Track Covid 19"), backgroundColor: Colors.lightBlue[900],centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){

            showSearch(context: context, delegate: Search(countryData));

          },)
        ],
      ),
      body: Center(child: _pages[_selectedTabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), title: Text("Top List")),
          BottomNavigationBarItem(
              icon: Icon(Icons.info), title: Text("Country Data")),
          BottomNavigationBarItem(
              icon: Icon(Icons.poll), title: Text("Chart")),
        ],
      ),
    );
  }
}