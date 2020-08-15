import 'package:flutter/material.dart';

class MostCases extends StatelessWidget {
  final List countrydata;

  const MostCases({Key key, this.countrydata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){

        return Container(

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),

            child: Row(

              children:<Widget> [
                Image.network(countrydata[index]['countryInfo']['flag'],height: 25,),
                SizedBox(width: 10,),
                Text(countrydata[index]['country']),
                SizedBox(width: 10,),
                Text('Deaths' + countrydata[index]['deaths'].toString() , style: TextStyle(color: Colors.red ,fontSize: 11 ,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Text('Total Cases' + countrydata[index]['cases'].toString() , style: TextStyle(color: Colors.blue ,fontSize: 11,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
        );

      },
      itemCount:5),
    );
  }
}
