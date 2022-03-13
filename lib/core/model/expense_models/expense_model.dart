// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators

import 'dart:convert';

ExpenseModel expenseModelFromJson(String str) => ExpenseModel.fromJson(json.decode(str));

String expenseModelToJson(ExpenseModel data) => json.encode(data.toJson());

class ExpenseModel {
    ExpenseModel({
        this.message,
        this.payload,
    });

    String? message;
    List<Payload>? payload;

    factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
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
        this.price,
        this.duration,
        this.id,
        this.note,
        this.status,
        this.garageId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.type,
        this.serviceId,
    });

    Price? price;
    Duration? duration;
    String? id;
    String? note;
    String? status;
    GarageId ?garageId;
    String? userId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? type;
    ServiceId? serviceId;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        price: Price.fromJson(json["price"]),
        duration: json["duration"] == null ? null : Duration.fromJson(json["duration"]),
        id: json["_id"],
        note: json["note"],
        status: json["status"],
        garageId: json["garage_id"] == null ? null : GarageId.fromJson(json["garage_id"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        type: json["type"] == null ? null : json["type"],
        serviceId: json["service_id"] == null ? null : ServiceId.fromJson(json["service_id"]),
    );

    Map<String, dynamic> toJson() => {
        "price": price!.toJson(),
        "duration": duration == null ? null : duration!.toJson(),
        "_id": id,
        "note": note,
        "status": status,
        "garage_id": garageId == null ? null : garageId!.toJson(),
        "user_id": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "type": type == null ? null : type,
        "service_id": serviceId == null ? null : serviceId?.toJson(),
    };
}

class Duration {
    Duration({
        this.num,
        this.type,
        this.alertDate,
    });

    int? num;
    String? type;
    DateTime ?alertDate;

    factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        num: json["num"],
        type: json["type"],
        alertDate: DateTime.parse(json["alertDate"]),
    );

    Map<String, dynamic> toJson() => {
        "num": num,
        "type": type,
        "alertDate": alertDate?.toIso8601String(),
    };
}

class GarageId {
    GarageId({
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

    Coordinate? coordinate;
    String? id;
    String? name;
    String? logo;
    String? cloudinaryId;
    String? location;
    String? phone;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory GarageId.fromJson(Map<String, dynamic> json) => GarageId(
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

    double ?x;
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

class Price {
    Price({
        this.riel,
        this.dollar,
    });

    int? riel;
    int? dollar;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        riel: json["riel"] == null ? null : json["riel"],
        dollar: json["dollar"] == null ? null : json["dollar"],
    );

    Map<String, dynamic> toJson() => {
        "riel": riel == null ? null : riel,
        "dollar": dollar == null ? null : dollar,
    };
}

class ServiceId {
    ServiceId({
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
    String? name;
    String? img;
    String? cloudinaryId;
    String? location;
    int? phone;
    String? type;
    DateTime? updatedAt;
    DateTime? createdAt;
    int ?v;

    factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
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
