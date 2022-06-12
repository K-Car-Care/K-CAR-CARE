

import 'dart:convert';

ServiceByMainService mainServiceModelFromJson(String str) => ServiceByMainService.fromJson(json.decode(str));

String mainServiceModelToJson(ServiceByMainService data) => json.encode(data.toJson());


class ServiceByMainService {
  String? message;
  List<Payload>? payload;

  ServiceByMainService({this.message, this.payload});

  factory ServiceByMainService.fromJson(Map<String, dynamic> json) => ServiceByMainService(
    message: json["message"],
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
  );

  
  Map<String, dynamic> toJson() => {
      "message": message,
      "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
  };
}

class Payload {
  String? sId;
  String? name;
  String? img;
  String? cloudinaryId;
  String? updatedAt;
  String? createdAt;
  int? iV;
  List<Services>? services;

  Payload(
      {this.sId,
      this.name,
      this.img,
      this.cloudinaryId,
      this.updatedAt,
      this.createdAt,
      this.iV,
      this.services});



  Payload.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    img = json['img'];
    cloudinaryId = json['cloudinary_id'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        // ignore: unnecessary_new
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['img'] = this.img;
    data['cloudinary_id'] = this.cloudinaryId;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? sId;
  String? name;
  String? description;
  String? img;
  String? cloudinaryId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Services(
      {this.sId,
      this.name,
      this.description,
      this.img,
      this.cloudinaryId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Services.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    img = json['img'];
    cloudinaryId = json['cloudinary_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['img'] = this.img;
    data['cloudinary_id'] = this.cloudinaryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
