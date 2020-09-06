import 'package:flutter/material.dart';
import 'datasourse.dart';
import 'panel/worlwide.dart';
import 'panel/infopanel.dart';
import 'countrypages.dart';
import 'panel/mostcases.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Map worlddata;
  fetchWorldWidedat() async {
    http.Response response =await http.get('https://disease.sh/v3/covid-19/all');
    if(response.statusCode == 200)
      setState(() {
        worlddata =json.decode(response.body) ;


      });
  }
List countrydata;
fetchcountrydata() async {
  http.Response response =await http.get('https://disease.sh/v3/covid-19/countries');

    setState(() {
      countrydata =json.decode(response.body) ;
    });
}


void initState(){
    fetchWorldWidedat();
    fetchcountrydata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Covid-19' ,style: TextStyle(color: Colors.grey[200]),),
      ),
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.orange[100],
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            height: 100,
            child: Text(Datasourse.quotes ,style: TextStyle(color: Colors.orange[400] ,fontSize: 17,fontWeight: FontWeight.bold ),),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('WorldWide' ,style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>CountryPage() ));
                  },
                  child: Container(

                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color :Colors.black,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text('Regional' ,style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold , color: Colors.white),)),
                ),
              ],
            ),
          ),
          worlddata ==null?CircularProgressIndicator():WorldWide(worlddata: worlddata,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 20),
            child: Text('Some Countries cases' ,style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold),),
          ),
          countrydata ==null?CircularProgressIndicator():MostCases(countrydata: countrydata,),
          SizedBox(width: 20,),
          InfoPanel()



        ],
      )),
    );
  }
}
