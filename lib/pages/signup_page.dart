import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _login = false;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _login = (prefs.getBool('login')?? false);
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _login = true;
    });
    prefs.setBool('login', _login);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(75.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'ثبت نام',
                    style:
                    TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  new Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          labelText: 'نام کاربری',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),),
                  SizedBox(height: 10.0),
                  new Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          labelText: 'رمز عبور ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),),
                  SizedBox(height: 10.0),
                  new Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          labelText: 'تکرار رمز عبور ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(12.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            _incrementCounter();
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                          child: Center(
                            child: Text(
                              'ثبت نام',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                        child:

                        Center(
                          child: Text('بازگشت',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),


                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }
}
