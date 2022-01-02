// To parse this JSON data, do
//
//     final mainServiceModel = mainServiceModelFromJson(jsonString);

import 'dart:convert';

MainServiceModel mainServiceModelFromJson(String str) => MainServiceModel.fromJson(json.decode(str));

String mainServiceModelToJson(MainServiceModel data) => json.encode(data.toJson());

class MainServiceModel {
    MainServiceModel({
        this.message,
        this.payload,
    });

    String? message;
    List<Payload>? payload;

    factory MainServiceModel.fromJson(Map<String, dynamic> json) => MainServiceModel(
        message: json["message"],
        payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
    };
}

class Payload {
    Payload({
        this.id,
        this.name,
        this.img,
        this.cloudinaryId,
        this.updatedAt,
        this.createdAt,
        this.v,
    });

    String? id;
    String? name;
    String? img;
    String? cloudinaryId;
    DateTime? updatedAt;
    DateTime? createdAt;
    int ?v;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["_id"],
        name: json["name"],
        img: json["img"],
        cloudinaryId: json["cloudinary_id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "img": img,
        "cloudinary_id": cloudinaryId,
        "updatedAt": updatedAt!.toIso8601String(),
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
    };
}
