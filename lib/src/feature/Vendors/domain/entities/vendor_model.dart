// To parse this JSON data, do
//
//     final vendorModel = vendorModelFromJson(jsonString);

import 'dart:convert';

VendorModel vendorModelFromJson(String str) => VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
    Data data;
    bool status;

    VendorModel({
        required this.data,
        required this.status,
    });

    factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
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
    List<VendorDataModel> data;

    Data({
        required this.count,
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<VendorDataModel>.from(json["data"].map((x) => VendorDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class VendorDataModel {
    int id;
    String name;
    String phone;
    String otherPhone;
    String email;
    String location;
    DateTime openHour;
    DateTime closeHour;
    String banner;
    DateTime createdAt;
    DateTime updatedAt;
    List<Menu>? menu;

    VendorDataModel({
        required this.id,
        required this.name,
        required this.phone,
        required this.otherPhone,
        required this.email,
        required this.location,
        required this.openHour,
        required this.closeHour,
        required this.banner,
        required this.createdAt,
        required this.updatedAt,
        this.menu,
    });

    factory VendorDataModel.fromJson(Map<String, dynamic> json) => VendorDataModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        otherPhone: json["otherPhone"],
        email: json["email"],
        location: json["location"],
        openHour: DateTime.parse(json["openHour"]),
        closeHour: DateTime.parse(json["closeHour"]),
        banner: json["banner"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        menu: json["menu"] == null ? [] : List<Menu>.from(json["menu"]!.map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "otherPhone": otherPhone,
        "email": email,
        "location": location,
        "openHour": openHour.toIso8601String(),
        "closeHour": closeHour.toIso8601String(),
        "banner": banner,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "menu": menu == null ? [] : List<dynamic>.from(menu!.map((x) => x.toJson())),
    };
}

class Menu {
    int id;
    String name;
    int price;
    String description;
    String banner;

    Menu({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.banner,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        banner: json["banner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "banner": banner,
    };
}
