import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_library/pages/home_page.dart';
import 'package:flutter_app_library/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main(){

  runApp(new MaterialApp(
    home: new MyApp(),
    routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => new Login_page(),
      '/home': (BuildContext context) => new HomePage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _logedin = false;




  @override
  void initState() {
    super.initState();
    _loadCounter();
    new Future.delayed(
        const Duration(seconds: 4),
            () {
              if (_logedin)
               return Navigator.of(context).pushReplacementNamed('/home');
              else
                return  Navigator.of(context).pushReplacementNamed('/login');
            }

    );
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _logedin = (prefs.getBool('login')?? false);
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: new Column(children: <Widget>[
          Divider(
            height: 240.0,
            color: Colors.white,
          ),
          new Image(image: new AssetImage("assets/library.jpeg"),
            fit: BoxFit.cover,),
          new Text('حسام الدین نادری'),
          Divider(
            height: 105.2,
            color: Colors.white,
          ),
        ]),
      ),
    );
  }
}
