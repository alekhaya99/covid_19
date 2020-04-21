import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Search extends SearchDelegate{

  final List countryData;

  Search(this.countryData);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';

      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    final suggestionList
    =
    query.isEmpty?
    countryData:
    countryData.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
          return Card(

            color: Colors.white,
            child: Container(
              height: 150,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(),

                image: DecorationImage(

                  image: NetworkImage(suggestionList[index]['countryInfo']['flag']),
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
                                    suggestionList[index]['country'],
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

                                        suggestionList[index]['cases'].toString(),
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

                                        suggestionList[index]['active'].toString(),
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
                                        suggestionList[index]['recovered'].toString(),
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

                                        suggestionList[index]['deaths'].toString(),
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
        });
  }

}
