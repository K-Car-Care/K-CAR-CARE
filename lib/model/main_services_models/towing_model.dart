// To parse this JSON data, do
//
//     final towingService = towingServiceFromJson(jsonString);

import 'dart:convert';

TowingServiceModel towingServiceFromJson(String str) => TowingServiceModel.fromJson(json.decode(str));

String towingServiceToJson(TowingServiceModel data) => json.encode(data.toJson());

class TowingServiceModel {
    TowingServiceModel({
        this.message,
        this.payload,
    });

    String? message;
    List<Payload>? payload;

    factory TowingServiceModel.fromJson(Map<String, dynamic> json) => TowingServiceModel(
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
        this.location,
        this.phone,
        this.type,
        this.updatedAt,
        this.createdAt,
        this.v,
    });

    String? id;
    String ?name;
    String? img;
    String? cloudinaryId;
    String? location;
    int? phone;
    String? type;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? v;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["_id"],
        name: json["name"],
        img: json["img"],
        cloudinaryId: json["cloudinary_id"],
        location: json["location"],
        phone: json["phone"],
        type: json["type"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "img": img,
        "cloudinary_id": cloudinaryId,
        "location": location,
        "phone": phone,
        "type": type,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
    };
}
