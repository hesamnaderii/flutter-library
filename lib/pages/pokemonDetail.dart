import 'package:flutter/material.dart';
import 'package:flutter_app_library/pages/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text(
          pokemon.name,
        ),
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[

              Positioned(
                  height: MediaQuery.of(context).size.height / 1.35,
                  width: MediaQuery.of(context).size.width-20,
                  left: 10,
                  top: MediaQuery.of(context).size.height /10,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 120.0,
                        ),
                        Text(pokemon.name,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Text("نویسنده: "+"${pokemon.writer}",style: TextStyle(fontSize: 19.0,color: Colors.grey),),
                        Text("قیمت: "+"${pokemon.cost}"+"  تومان",style: TextStyle(fontSize: 19.0,color: Colors.grey)),
                        Text(pokemon.detail,style: TextStyle(fontSize: 9.0),textAlign: TextAlign.center,),
                      ],
                    ),
                  )),

          Align(
            alignment: Alignment.topCenter,
            child:Hero(tag: pokemon.img, child:Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image:DecorationImage(
                      fit: BoxFit.cover,
                      image:NetworkImage(pokemon.img))),

      ))
          )
        ],
      );
}
