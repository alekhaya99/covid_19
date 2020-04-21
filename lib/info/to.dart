import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  final List countryData;

  const Top({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
                  color: Colors.yellow[50],
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      countryData[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.network(
                      countryData[index]['countryInfo']['flag'],
                      height: 30,
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),

                SizedBox(
                  width: 10,
                ),
                Text(
                  'Critical: ' + countryData[index]['active'].toString(),
                  style:
                  TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.bold),
                ),
                Text(
                  'Deaths: ' + countryData[index]['deaths'].toString(),
                  style:
                  TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}