 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;

 
 class Piechart extends StatefulWidget {
   @override
   _PiechartState createState() => _PiechartState();
 }
 
 class _PiechartState extends State<Piechart> {
   Map worldData;

   fetchWorldWideData() async {
     http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
     setState(() {
       worldData = json.decode(response.body);
     });
   }
   Map countryData;

   fetchCountryData() async {
     http.Response response = await http.get('https://corona.lmao.ninja/v2/countries/singapore');
     setState(() {
       countryData = json.decode(response.body);
     });
   }
   @override
  void initState() {
    // TODO: implement initState
     fetchWorldWideData();
     fetchCountryData();
     super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: SingleChildScrollView(
         child: Column(
           children:<Widget>[
             Container(

                margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[300],


                borderRadius: BorderRadius.circular(10.0),
              ),
             child:Column(

              children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('World Chart',style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                      SizedBox(height:20),
                   worldData == null
                        ? CircularProgressIndicator()
                        :Container(
                       child: PieChart(dataMap: {
                        'Confirmed Cases':worldData['cases'].toDouble(),
                        'Active Cases':worldData['active'].toDouble(),
                        'Recovered Cases':worldData['recovered'].toDouble(),
                        'Death Cases':worldData['deaths'].toDouble(),
                        'Today Cases':worldData['todayCases'].toDouble(),
                        'Critical Cases':worldData['cases'].toDouble(),


                      },
                 colorList: [
                       Colors.blue,
                       Colors.yellow,
                       Colors.green,
                       Colors.red,
                       Colors.purple,
                       Colors.deepOrange,


                 ],
                        animationDuration: Duration(milliseconds: 800),
                        chartRadius: MediaQuery.of(context).size.width / 2.7,
                        showChartValuesInPercentage: true,
                        chartType: ChartType.ring,

                      ),
                ),
                    ],
                  ),
              ],)


           ),
             Container(

                 margin: EdgeInsets.all(5),
                 decoration: BoxDecoration(
                   color: Colors.grey[300],


                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 child:Column(

                   children: <Widget>[
                     Column(
                       children: <Widget>[
                         Text('Country Chart',style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                         SizedBox(height:20),
                         countryData == null
                             ? CircularProgressIndicator()
                             :Container(
                           child: PieChart(dataMap: {
                             'Confirmed Cases':countryData['cases'].toDouble(),
                             'Active Cases':countryData['active'].toDouble(),
                             'Death Cases':countryData['deaths'].toDouble(),
                             'Critical Cases':countryData['critical'].toDouble(),
                             'Recovered Cases':countryData['recovered'].toDouble(),
                             'Today Cases':countryData['todayCases'].toDouble(),
                           },
                             colorList: [
                               Colors.blue,
                               Colors.yellow,
                               Colors.red,
                               Colors.deepOrange,
                               Colors.green,
                               Colors.pink
                             ],
                             animationDuration: Duration(milliseconds: 800),
                             chartRadius: MediaQuery.of(context).size.width / 2.7,
                             showChartValuesInPercentage: true,
                             chartType: ChartType.disc,

                           ),
                         ),
                       ],
                     ),
                   ],)


             ),

         ]),
       ),);
   }
 }
 