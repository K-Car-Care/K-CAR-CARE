// To parse this JSON data, do
//
//     final googleModel = googleModelFromJson(jsonString);

import 'dart:convert';

GoogleLoginModel googleModelFromJson(String str) => GoogleLoginModel.fromJson(json.decode(str));

String googleModelToJson(GoogleLoginModel data) => json.encode(data.toJson());

class GoogleLoginModel {
    GoogleLoginModel({
        this.id,
        this.displayName,
        this.firstName,
        this.lastName,
        this.profile,
        this.email,
        this.phone,
        this.updatedAt,
        this.createdAt,
        this.v,
        this.lastLoginDate,
        this.token,
    });

    String? id;
    String? displayName;
    String? firstName;
    String? lastName;
    String? profile;
    String ?email;
    String? phone;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? v;
    DateTime? lastLoginDate;
    String? token;

    factory GoogleLoginModel.fromJson(Map<String, dynamic> json) => GoogleLoginModel(
        id: json["_id"],
        displayName: json["displayName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profile: json["profile"],
        email: json["email"],
        phone: json["phone"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        lastLoginDate: DateTime.parse(json["lastLoginDate"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "displayName": displayName,
        "firstName": firstName,
        "lastName": lastName,
        "profile": profile,
        "email": email,
        "phone": phone,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
        "lastLoginDate": lastLoginDate?.toIso8601String(),
        "token": token,
    };
}
