import 'package:flutter/material.dart';

class WorldWide extends StatelessWidget {
  final Map worlddata;

  const WorldWide({Key key, this.worlddata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,childAspectRatio: 2),
      children: [
        StatusPanel(
          title: 'Confirmed',
          panelColor: Colors.red[100],
          textColor: Colors.red,
          count:worlddata['cases'].toString(),
        ),
      StatusPanel(
        title: 'Active',
        panelColor: Colors.blue[100],
        textColor: Colors.blue,
        count:worlddata['active'].toString(),
      ),
      StatusPanel(
        title: 'Recover',
        panelColor: Colors.green[100],
        textColor: Colors.green,
        count:worlddata['recovered'].toString(),
      ),
      StatusPanel(
        title: 'Deaths',
        panelColor: Colors.blueGrey[100],
        textColor: Colors.grey,
        count:worlddata['deaths'].toString(),
      ),



        ],),

    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;


  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);@override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Container(
     margin: EdgeInsets.all(5),
      height: 80,
      width: width/2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold , color: textColor), ),
          Text(count,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: textColor),)
        ],
      ),
    );
  }
}
