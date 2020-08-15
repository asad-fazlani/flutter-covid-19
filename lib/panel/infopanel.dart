import 'package:flutter/material.dart';
class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0) ,
            color: Colors.black,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Who" ,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                Icon(Icons.arrow_right,color: Colors.white,)
              ],
            ),

          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0) ,
            color: Colors.black,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Donate" ,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                Icon(Icons.arrow_right,color: Colors.white,)
              ],
            ),

          )
        ],
      ),
    );
  }
}
