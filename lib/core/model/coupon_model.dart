class CouponModel {
  String? message;
  List<DataCoupon>? payload;

  CouponModel({this.message, this.payload});

  CouponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['payload'] != null) {
      payload = <DataCoupon>[];
      json['payload'].forEach((v) {
        payload!.add(DataCoupon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCoupon {
  Coordinate? coordinate;
  String? sId;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? img;
  String? cloudinaryId;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DataCoupon(
      {this.coordinate,
      this.sId,
      this.title,
      this.description,
      this.startDate,
      this.endDate,
      this.img,
      this.cloudinaryId,
      this.location,
      this.createdAt,
      this.updatedAt,
      this.iV});

  DataCoupon.fromJson(Map<String, dynamic> json) {
    coordinate = json['coordinate'] != null
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    img = json['img'];
    cloudinaryId = json['cloudinary_id'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['img'] = this.img;
    data['cloudinary_id'] = this.cloudinaryId;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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