// To parse this JSON data, do
//
//     final allergiesModel = allergiesModelFromJson(jsonString);

import 'dart:convert';

AllergiesModel allergiesModelFromJson(String str) => AllergiesModel.fromJson(json.decode(str));

String allergiesModelToJson(AllergiesModel data) => json.encode(data.toJson());

class AllergiesModel {
    Data data;
    bool status;

    AllergiesModel({
        required this.data,
        required this.status,
    });

    factory AllergiesModel.fromJson(Map<String, dynamic> json) => AllergiesModel(
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
    List<Allergy> allergy;

    Data({
        required this.count,
        required this.allergy,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        allergy: List<Allergy>.from(json["data"].map((x) => Allergy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(allergy.map((x) => x.toJson())),
    };
}

class Allergy {
    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    Allergy({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
