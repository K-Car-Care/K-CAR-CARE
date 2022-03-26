// To parse this JSON data, do
//
//     final carReleventNewsModel = carReleventNewsModelFromJson(jsonString);

import 'dart:convert';

CarReleventNewsModel carReleventNewsModelFromJson(String str) => CarReleventNewsModel.fromJson(json.decode(str));

String carReleventNewsModelToJson(CarReleventNewsModel data) => json.encode(data.toJson());

class CarReleventNewsModel {
    CarReleventNewsModel({
        this.message,
        this.payload,
    });

    String? message;
    List<Payload>? payload;
    factory CarReleventNewsModel.fromJson(Map<String, dynamic> json) => CarReleventNewsModel(
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
      this.newsId,
      this.userIds,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.isOpen,
    });
    String? id;
    NewsId? newsId;
    List<dynamic>? userIds;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    bool? isOpen;
    
    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
      id: json["_id"],
      newsId: NewsId.fromJson(json["news_id"]),
      userIds: List<dynamic>.from(json["user_ids"].map((x) => x)),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      v: json["__v"],
      isOpen: json["isOpen"],
    );

    Map<String, dynamic> toJson() => {
      "_id": id,
      "news_id": newsId?.toJson(),
      "user_ids": List<dynamic>.from(userIds!.map((x) => x)),
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "__v": v,
      "isOpen": isOpen,
    };
}

class NewsId {
    NewsId({
        this.id,
        this.title,
        this.message,
        this.type,
        this.img,
        this.cloudinaryId,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? id;
    String? title;
    String? message;
    String? type;
    String? img;
    String? cloudinaryId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory NewsId.fromJson(Map<String, dynamic> json) => NewsId(
        id: json["_id"],
        title: json["title"],
        message: json["message"],
        type: json["type"],
        img: json["img"],
        cloudinaryId: json["cloudinary_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "message": message,
        "type": type,
        "img": img,
        "cloudinary_id": cloudinaryId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
