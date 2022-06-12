class PromotionModel {
  String? message;
  List<DataPromotion>? payload;

  PromotionModel({this.message, this.payload});

  PromotionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['payload'] != null) {
      payload = <DataPromotion>[];
      json['payload'].forEach((v) {
        payload!.add(new DataPromotion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPromotion {
  String? sId;
  String? title;
  String? nameOwner;
  String? description;
  String? urlContact;
  String? targetArea;
  String? startDate;
  String? endDate;
  String? img;
  String? cloudinaryId;
  String? location;
  String? phone;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Coordinate? coordinate;

  DataPromotion(
      {this.sId,
      this.title,
      this.nameOwner,
      this.description,
      this.urlContact,
      this.targetArea,
      this.startDate,
      this.endDate,
      this.img,
      this.cloudinaryId,
      this.location,
      this.phone,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.coordinate});

  DataPromotion.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    nameOwner = json['nameOwner'];
    description = json['description'];
    urlContact = json['urlContact'];
    targetArea = json['targetArea'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    img = json['img'];
    cloudinaryId = json['cloudinary_id'];
    location = json['location'];
    phone = json['phone'];
    categoryId = json['categoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    coordinate = json['coordinate'] != null
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['nameOwner'] = this.nameOwner;
    data['description'] = this.description;
    data['urlContact'] = this.urlContact;
    data['targetArea'] = this.targetArea;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['img'] = this.img;
    data['cloudinary_id'] = this.cloudinaryId;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['categoryId'] = this.categoryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
    }
    return data;
  }
}

class Coordinate {
  double? x;
  double? y;

  Coordinate({this.x, this.y});

  Coordinate.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}