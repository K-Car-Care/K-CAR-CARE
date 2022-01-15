// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
        this.message,
        this.payload,
    });

    String? message;
    List<Payload>? payload;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
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
        this.displayName,
        this.firstName,
        this.lastName,
        this.profile,
        this.email,
        this.phone,
        this.isAdmin,
        this.updatedAt,
        this.createdAt,
        this.v,
        this.lastLoginDate,
    });

    String? id;
    String? displayName;
    String? firstName;
    String? lastName;
    String? profile;
    String? email;
    String? phone;
    bool? isAdmin;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? v;
    DateTime? lastLoginDate;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["_id"],
        displayName: json["displayName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profile: json["profile"],
        email: json["email"],
        phone: json["phone"],
        isAdmin: json["isAdmin"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        lastLoginDate: DateTime.parse(json["lastLoginDate"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "displayName": displayName,
        "firstName": firstName,
        "lastName": lastName,
        "profile": profile,
        "email": email,
        "phone": phone,
        "isAdmin": isAdmin,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
        "lastLoginDate": lastLoginDate?.toIso8601String(),
    };
}
