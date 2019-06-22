class PokeHub {
  List<Pokemon> pokemon;

  PokeHub({this.pokemon});

  PokeHub.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      pokemon = new List<Pokemon>();
      json['books'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['books'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String id;
  String name;
  String img;
  String writer;
  String cost;
  String detail;


  Pokemon(
      {this.id,
        this.name,
        this.img,
        this.writer,
        this.cost,
        this.detail
      });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    writer = json['writer'];
    cost = json['cost'];
    detail=json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['writer'] = this.writer;
    data['cost'] = this.cost;
    data['detail'] = this.detail;

    return data;
  }
}

