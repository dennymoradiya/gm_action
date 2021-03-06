// To parse this JSON data, do
//
//     final topgame = topgameFromMap(jsonString);

import 'dart:convert';

class Topgame {
    Topgame({
        this.status,
        this.message,
        this.data,
    });

    final bool ?status;
    final String ?message;
    final List<Datum>? data;

    factory Topgame.fromJson(String str) => Topgame.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Topgame.fromMap(Map<String, dynamic> json) => Topgame(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.catId,
        this.catName,
        this.rating,
        this.description,
        this.website,
        this.image,
        this.icon,
        this.top,
    });

    final int ?id;
    final String ?name;
    final String ?catId;
    final CatName ?catName;
    final String ?rating;
    final String ?description;
    final String ?website;
    final String ?image;
    final String ?icon;
    final bool? top;

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        catId: json["cat_id"],
        catName: catNameValues.map![json["cat_name"]],
        rating: json["rating"],
        description: json["description"],
        website: json["website"],
        image: json["image"],
        icon: json["icon"],
        top: json["top"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "cat_id": catId,
        "cat_name": catNameValues.reverse[catName],
        "rating": rating,
        "description": description,
        "website": website,
        "image": image,
        "icon": icon,
        "top": top,
    };
}

enum CatName { ACTION, ADVENTURE, STRATEGY, SPORT_RACING, ARCADE, PUZZLE_LOGIC }

final catNameValues = EnumValues({
    "Action": CatName.ACTION,
    "Adventure": CatName.ADVENTURE,
    "Arcade": CatName.ARCADE,
    "Puzzle & Logic": CatName.PUZZLE_LOGIC,
    "Sport & Racing": CatName.SPORT_RACING,
    "Strategy": CatName.STRATEGY
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        // ignore: prefer_conditional_assignment
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => MapEntry(v, k));
        }
        return reverseMap!;
    }
}
