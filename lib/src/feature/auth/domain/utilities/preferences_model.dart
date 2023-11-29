// To parse this JSON data, do
//
//     final preferencesModel = preferencesModelFromJson(jsonString);

import 'dart:convert';

PreferencesModel preferencesModelFromJson(String str) => PreferencesModel.fromJson(json.decode(str));

String preferencesModelToJson(PreferencesModel data) => json.encode(data.toJson());

class PreferencesModel {
    Data data;
    bool status;

    PreferencesModel({
        required this.data,
        required this.status,
    });

    factory PreferencesModel.fromJson(Map<String, dynamic> json) => PreferencesModel(
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
    List<Preference> data;

    Data({
        required this.count,
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<Preference>.from(json["data"].map((x) => Preference.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Preference {
    int id;
    String name;
    DateTime createdAt;
    DateTime updatedAt;

    Preference({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Preference.fromJson(Map<String, dynamic> json) => Preference(
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
