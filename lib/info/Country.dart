import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  fetchCountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: countryData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(

            color: Colors.white,
            child: Container(
              height: 150,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),




            image: DecorationImage(

              image: NetworkImage(countryData[index]['countryInfo']['flag']),
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.white.withOpacity(1.0),
                  BlendMode.dstATop),
            ),
          ),
              child: Column(

                children: <Widget>[

                  SizedBox(height:75),


                  Expanded(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.95), BlendMode.dstATop),

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))


                          ),

                          child: Column(

                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  Text(
                                    countryData[index]['country'],
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'CONFIRMED:' ,

                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,fontSize: 16),
                                      ),
                                      Text(

                                            countryData[index]['cases'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,fontSize: 16),
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'ACTIVE:' ,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,fontSize: 16),
                                      ),
                                      Text(

                                            countryData[index]['active'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,fontSize: 16),
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'RECOVERED:' ,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,fontSize: 16),
                                      ),
                                      Text(
                                        countryData[index]['recovered'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,fontSize: 16),
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'DEATHS:' ,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 16,
                                            color:Colors.grey[900]),
                                      ),
                                      Text(

                                            countryData[index]['deaths'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[900],fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        itemCount: countryData == null ? 0 : countryData.length,
      ),
    );
  }
}