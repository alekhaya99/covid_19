import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldInfo extends StatelessWidget {
  final Map worldData;


  const WorldInfo({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(

        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            image: 'https://www.commondreams.org/sites/default/files/styles/cd_large/public/headlines/shutter_2.jpeg?itok=FQ6cS3zG',
            title: 'CONFIRMED CASES',
            panelColor: Colors.yellow[50],
            textColor: Colors.yellow[900],
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            image: 'https://images.dailykos.com/images/768636/original/coronavirus-1.jpg?1582228516',
            title: 'ACTIVE CASES',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            image: 'https://imagevars.gulfnews.com/2020/03/16/COVID-19-recovered-cases_170e30fb882_original-ratio.jpg',
            title: 'RECOVERED CASES',
            panelColor: Colors.green[100],
            textColor: Colors.green[900],
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            image: 'https://cnnphilippines.com/.imaging/mte/demo-cnn-new/750x450/dam/cnn/2020/4/11/US-Coronavirus-deaths_CNNPH.jpg/jcr:content/US-Coronavirus-deaths_CNNPH.jpg',
            title: 'TOTAL DEATHS',
            panelColor: Colors.red[100],
            textColor: Colors.red[900],
            count: worldData['deaths'].toString(),
          ),

          StatusPanel(
            image: 'https://assets.nst.com.my/images/articles/BARU_COVID_19-0704_1586253324.jpg',
            title: 'TODAY CASES',
            panelColor: Colors.orange[100],
            textColor: Colors.orange[900],
            count: worldData['todayCases'].toString(),
          ),
          StatusPanel(
            image: 'https://www.commondreams.org/sites/default/files/styles/cd_large/public/headlines/shutter_2.jpeg?itok=FQ6cS3zG',
            title: 'CRITICAL CASES',
            panelColor: Colors.red[100],
            textColor: Colors.red[900],
            count: worldData['critical'].toString(),
          ),
          StatusPanel(
            image: 'https://foreignpolicy.com/wp-content/uploads/2020/03/coronavirus-map-041620-mobile.png',
            title: 'AFFECTED COUNTRIES',
            panelColor: Colors.purple[100],
            textColor: Colors.purple[900],
            count: worldData['affectedCountries'].toString(),
          ),
          StatusPanel(
            image: 'https://en.as.com/en/imagenes/2020/04/19/other_sports/1587256772_730795_1587290252_noticia_normal_recorte1.jpg',
            title: 'TODAY DEATHS',
            panelColor: Colors.pink[100],
            textColor: Colors.pink[900],

            count: worldData['todayDeaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  final String image;


  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count,this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    



    return Container(
     margin: EdgeInsets.all(5),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: panelColor,
        image: DecorationImage(

          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.2),
              BlendMode.dstATop),
    ),
      ),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(alignment: Alignment.center,child: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 52, color: textColor),)),

          Text(count,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32,color: textColor),)
        ],
      ),
    );
  }
}
