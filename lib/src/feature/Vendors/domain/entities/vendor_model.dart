// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

import 'package:foodivoire/src/feature/menu/domain/entities/menu_model.dart';

RestaurantModel restaurantModelFromJson(String str) => RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) => json.encode(data.toJson());

class RestaurantModel {
    Data data;
    bool status;

    RestaurantModel({
        required this.data,
        required this.status,
    });

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
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
    List<RestaurantDataModel> data;

    Data({
        required this.count,
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<RestaurantDataModel>.from(json["data"].map((x) => RestaurantDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class RestaurantDataModel {
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
    num rating;
    List<Comment>? comments;
    List<Menu>? menu;
    DateTime createdAt;
    DateTime updatedAt;

    RestaurantDataModel({
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
        required this.createdAt,
        required this.updatedAt,
    });

    factory RestaurantDataModel.fromJson(Map<String, dynamic> json) => RestaurantDataModel(
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
        comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
        menu: json["menu"] == null ? [] : List<Menu>.from(json["menu"]!.map((x) => Menu.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "menu": menu == null ? [] : List<dynamic>.from(menu!.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Comment {
    int id;
    String comment;
    Customer customer;
    DateTime createdAt;

    Comment({
        required this.id,
        required this.comment,
        required this.customer,
        required this.createdAt,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        comment: json["comment"],
        customer: Customer.fromJson(json["customer"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "customer": customer.toJson(),
        "createdAt": createdAt.toIso8601String(),
    };
}

class Customer {
    int id;
    String lastName;
    String otherName;
    String avatar;

    Customer({
        required this.id,
        required this.lastName,
        required this.otherName,
        required this.avatar,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        lastName: json["lastName"],
        otherName: json["otherName"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "lastName": lastName,
        "otherName": otherName,
        "avatar": avatar,
    };
}

class Menu {
    int id;
    String name;
    int price;
    String description;
    String origin;
    String banner;
    int like;
    bool likeStatus;
    dynamic comments;
    dynamic restaurant;
    dynamic preferences;
    dynamic allergies;

    Menu({
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
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        origin: json["origin"],
        banner: json["banner"],
        like: json["like"],
        likeStatus: json["likeStatus"],
        comments: json["comments"],
        restaurant: json["restaurant"],
        preferences: json["preferences"],
        allergies: json["allergies"],
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
        "restaurant": restaurant,
        "preferences": preferences,
        "allergies": allergies,
    };
}
