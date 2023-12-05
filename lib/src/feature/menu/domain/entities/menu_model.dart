// // To parse this JSON data, do
// //
// //     final menuModel = menuModelFromJson(jsonString);

// import 'dart:convert';

// MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

// String menuModelToJson(MenuModel data) => json.encode(data.toJson());

// class MenuModel {
//     Data? data;
//     bool status;

//     MenuModel({
//          this.data,
//         required this.status,
//     });

//     factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
//         data: Data.fromJson(json["data"]??{}),
//         status: json["status"],
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//         "status": status,
//     };
// }

// class Data {
//     int count;
//     List<MenuDataModel> data;

//     Data({
//         required this.count,
//         required this.data,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         count: json["count"],
//         data: List<MenuDataModel>.from(json["data"].map((x) => MenuDataModel.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "count": count,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class MenuDataModel {
//     int id;
//     String name;
//     int price;
//     String description;
//     String origin;
//     String banner;
//     int like;
//     bool likeStatus;
//     dynamic comments;
//     Restaurant restaurant;
//     List<Preference> preferences;
//     List<dynamic> allergies;
//     DateTime createdAt;
//     DateTime updatedAt;

//     MenuDataModel({
//         required this.id,
//         required this.name,
//         required this.price,
//         required this.description,
//         required this.origin,
//         required this.banner,
//         required this.like,
//         required this.likeStatus,
//         required this.comments,
//         required this.restaurant,
//         required this.preferences,
//         required this.allergies,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory MenuDataModel.fromJson(Map<String, dynamic> json) => MenuDataModel(
//         id: json["id"],
//         name: json["name"],
//         price:json["price"],
//         description: json["description"],
//         origin: json["origin"],
//         banner: json["banner"],
//         like: json["like"],
//         likeStatus: json["likeStatus"],
//         comments: json["comments"]??[],
//         restaurant: Restaurant.fromJson(json["restaurant"]),
//         preferences: List<Preference>.from(json["preferences"]?.map((x) => Preference.fromJson(x))??[]),
//         allergies: List<dynamic>.from(json["allergies"]?.map((x) => x)??[]),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "description": description,
//         "origin": origin,
//         "banner": banner,
//         "like": like,
//         "likeStatus": likeStatus,
//         "comments": comments,
//         "restaurant": restaurant.toJson(),
//         "preferences": List<dynamic>.from(preferences.map((x) => x.toJson())),
//         "allergies": List<dynamic>.from(allergies.map((x) => x)),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//     };
// }

// class Preference {
//     int id;
//     String name;

//     Preference({
//         required this.id,
//         required this.name,
//     });

//     factory Preference.fromJson(Map<String, dynamic> json) => Preference(
//         id: json["id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//     };
// }

// class Restaurant {
//     int id;
//     String name;
//     String phone;
//     String otherPhone;
//     String location;
//     int latitude;
//     int longitude;
//     String description;
//     String openHour;
//     String closeHour;
//     String banner;
//     int rating;
//     dynamic comments;
//     dynamic menu;

//     Restaurant({
//         required this.id,
//         required this.name,
//         required this.phone,
//         required this.otherPhone,
//         required this.location,
//         required this.latitude,
//         required this.longitude,
//         required this.description,
//         required this.openHour,
//         required this.closeHour,
//         required this.banner,
//         required this.rating,
//         required this.comments,
//         required this.menu,
//     });

//     factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"],
//         name: json["name"],
//         phone: json["phone"],
//         otherPhone: json["otherPhone"],
//         location: json["location"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         description: json["description"],
//         openHour: json["openHour"],
//         closeHour: json["closeHour"],
//         banner: json["banner"],
//         rating: json["rating"],
//         comments: json["comments"],
//         menu: json["menu"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "phone": phone,
//         "otherPhone": otherPhone,
//         "location": location,
//         "latitude": latitude,
//         "longitude": longitude,
//         "description": description,
//         "openHour": openHour,
//         "closeHour": closeHour,
//         "banner": banner,
//         "rating": rating,
//         "comments": comments,
//         "menu": menu,
//     };
// }
