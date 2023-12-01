// To parse this JSON data, do
//
//     final suggestedMenuModel = suggestedMenuModelFromJson(jsonString);

import 'dart:convert';

SuggestedMenuModel suggestedMenuModelFromJson(String str) => SuggestedMenuModel.fromJson(json.decode(str));

String suggestedMenuModelToJson(SuggestedMenuModel data) => json.encode(data.toJson());

class SuggestedMenuModel {
    Data data;
    bool status;

    SuggestedMenuModel({
        required this.data,
        required this.status,
    });

    factory SuggestedMenuModel.fromJson(Map<String, dynamic> json) => SuggestedMenuModel(
        data: Data.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
    };
}

class Data {
    int count;
    List<SuggestedMenuDataModel> data;

    Data({
        required this.count,
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<SuggestedMenuDataModel>.from(json["data"].map((x) => SuggestedMenuDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class SuggestedMenuDataModel {
    int id;
    String name;
    int price;
    String description;
    String origin;
    String banner;
    int like;
    bool likeStatus;
    dynamic comments;
    Restaurant restaurant;
    List<Allergy> preferences;
    List<Allergy> allergies;
    DateTime createdAt;
    DateTime updatedAt;

    SuggestedMenuDataModel({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.origin,
        required this.banner,
        required this.like,
        required this.likeStatus,
        required this.comments,
        required this.restaurant,
        required this.preferences,
        required this.allergies,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SuggestedMenuDataModel.fromJson(Map<String, dynamic> json) => SuggestedMenuDataModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        origin: json["origin"],
        banner: json["banner"],
        like: json["like"],
        likeStatus: json["likeStatus"],
        comments: json["comments"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        preferences: List<Allergy>.from(json["preferences"].map((x) => Allergy.fromJson(x))),
        allergies: List<Allergy>.from(json["allergies"].map((x) => Allergy.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "origin": origin,
        "banner": banner,
        "like": like,
        "likeStatus": likeStatus,
        "comments": comments,
        "restaurant": restaurant.toJson(),
        "preferences": List<dynamic>.from(preferences.map((x) => x.toJson())),
        "allergies": List<dynamic>.from(allergies.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Allergy {
    int id;
    String name;

    Allergy({
        required this.id,
        required this.name,
    });

    factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Restaurant {
    int id;
    String name;
    String phone;
    String otherPhone;
    String location;
    double latitude;
    double longitude;
    String description;
    String openHour;
    String closeHour;
    String banner;
    int rating;
    dynamic comments;
    dynamic menu;

    Restaurant({
        required this.id,
        required this.name,
        required this.phone,
        required this.otherPhone,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.description,
        required this.openHour,
        required this.closeHour,
        required this.banner,
        required this.rating,
        required this.comments,
        required this.menu,
    });

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        otherPhone: json["otherPhone"],
        location: json["location"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        description: json["description"],
        openHour: json["openHour"],
        closeHour: json["closeHour"],
        banner: json["banner"],
        rating: json["rating"],
        comments: json["comments"],
        menu: json["menu"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "otherPhone": otherPhone,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "openHour": openHour,
        "closeHour": closeHour,
        "banner": banner,
        "rating": rating,
        "comments": comments,
        "menu": menu,
    };
}
