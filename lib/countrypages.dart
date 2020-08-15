import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  List countrydata;
  fetchcountrydata() async {
    http.Response response =
        await http.get('https://disease.sh/v3/covid-19/countries');

    setState(() {
      countrydata = json.decode(response.body);
    });
  }
  void initState(){

    fetchcountrydata();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries '),
      ),
      body: countrydata == null?Center(
        child: CircularProgressIndicator(),
      ):ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
            decoration: BoxDecoration(color: Colors.white,boxShadow: [
              BoxShadow(color: Colors.grey[100],blurRadius: 0,)]),
          child: Row(
          children: [
            Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(countrydata[index]['country'] ,style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black),),
            Image.network(countrydata[index]['countryInfo']['flag'],height: 60,width: 60,),
          ],
          ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            margin:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( "Total  "+countrydata[index]['cases'].toString() ,style: TextStyle(letterSpacing: 1,color: Colors.red ,fontWeight: FontWeight.bold ),),

                Text("Active  "+countrydata[index]['active'].toString(),style: TextStyle(letterSpacing: 1,color: Colors.blue ,fontWeight: FontWeight.bold )),
                Text("Recover  "+countrydata[index]['recovered'].toString(),style: TextStyle(letterSpacing: 1,color: Colors.green ,fontWeight: FontWeight.bold )),
                Text("Deaths  "+countrydata[index]['deaths'].toString(),style: TextStyle(letterSpacing: 1,color: Colors.blueGrey ,fontWeight: FontWeight.bold )),


              ],
            ),
          ))
          ],
          ),
          );
        },
        itemCount: countrydata == null ? 0 : countrydata.length,
      ),
    );
  }
}
