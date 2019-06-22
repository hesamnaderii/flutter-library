import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

      Container(
        margin: const EdgeInsets.only(left: 80.0,top: 60.0),
        height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: new AssetImage("assets/me.jpg"))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 80.0,top: 60.0),
              child: new Text('حسام الدین نادری',style: TextStyle(fontWeight: FontWeight.w500),),
            ),
            Container(
              margin: const EdgeInsets.only(left: 80.0,top: 60.0),
              child: new Text('Email:hesamnaeri87@gmail.com',style: TextStyle(fontWeight: FontWeight.w600),),
            ),
          ],
        ));
  }
}
