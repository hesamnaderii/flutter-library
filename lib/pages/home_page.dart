import 'package:flutter/material.dart';
import 'package:flutter_app_library/pages/about_page.dart';
import 'package:flutter_app_library/pages/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app_library/pages/pokemonDetail.dart';


class HomePage extends StatefulWidget {
  @override
  startAppState createState() {
    return new startAppState();
  }
}

class startAppState extends State<HomePage> {
  PokeHub pokeHub;
  var url =
      "https://api.myjson.com/bins/qjazd";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);

    var jsondecoder = json.decode(utf8.decode(res.bodyBytes));
    pokeHub = PokeHub.fromJson(jsondecoder);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("لیست کتابهای موجود"),
        backgroundColor: Colors.cyan,
      ),
      body: pokeHub == null
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon
            .map((poke) => Padding(
            padding: const EdgeInsets.all(1.5),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PokeDetail(pokemon: poke)));
                },
                child: Hero(
                    tag: poke.img,
                    child: Card(
                        color: Colors.cyan,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 3.0,
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(poke.img))),
                            ),
                            Text(
                              poke.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            )
                          ],
                        ))))))
            .toList(),
      ),
     drawer:Drawer(
       child: ListView(
         padding: EdgeInsets.zero,
         children: <Widget>[
           DrawerHeader(
             child: Text('منوی تنظیمات',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 28),),
             decoration: BoxDecoration(
               color: Colors.redAccent,
             ),
           ),
           ListTile(
             title: Text('درباره من',style: TextStyle(fontSize: 20),),
             onTap: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) =>
                           AboutPage()));
             },
           ),
         ],
       ),
     )
    );
  }
}
