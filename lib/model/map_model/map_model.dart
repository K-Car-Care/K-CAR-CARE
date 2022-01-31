// To parse this JSON data, do
//
//     final mapModel = mapModelFromJson(jsonString);

import 'dart:convert';

MapModel mapModelFromJson(String str) => MapModel.fromJson(json.decode(str));

String mapModelToJson(MapModel data) => json.encode(data.toJson());

class MapModel {
    MapModel({
        this.message,
        this.payload,
    });

    String? message;
    List<Payload>? payload;

    factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(
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
        this.coordinate,
        this.id,
        this.name,
        this.logo,
        this.cloudinaryId,
        this.location,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    Coordinate ?coordinate;
    String? id;
    String? name;
    String? logo;
    String? cloudinaryId;
    String? location;
    String? phone;
    DateTime? createdAt;
    DateTime? updatedAt;
    int ?v;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        coordinate: Coordinate.fromJson(json["coordinate"]),
        id: json["_id"],
        name: json["name"],
        logo: json["logo"],
        cloudinaryId: json["cloudinary_id"],
        location: json["location"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "coordinate": coordinate?.toJson(),
        "_id": id,
        "name": name,
        "logo": logo,
        "cloudinary_id": cloudinaryId,
        "location": location,
        "phone": phone,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Coordinate {
    Coordinate({
        this.x,
        this.y,
    });

    double? x;
    double? y;

    factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}
