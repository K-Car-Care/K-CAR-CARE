class UserCouponModel {
  String? message;
  List<DataUserCoupon>? payload;
  int? total;

  UserCouponModel({this.message, this.payload, this.total});

  UserCouponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['payload'] != null) {
      payload = <DataUserCoupon>[];
      json['payload'].forEach((v) {
        payload!.add(new DataUserCoupon.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class DataUserCoupon {
  String? sId;
  CouponId? couponId;
  UserId? userId;
  bool? isUsed;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DataUserCoupon(
      {this.sId,
      this.couponId,
      this.userId,
      this.isUsed,
      this.createdAt,
      this.updatedAt,
      this.iV});

  DataUserCoupon.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    couponId = json['coupon_id'] != null
        ? CouponId.fromJson(json['coupon_id'])
        : null;
    userId =
        json['user_id'] != null ? UserId.fromJson(json['user_id']) : null;
    isUsed = json['isUsed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    if (this.couponId != null) {
      data['coupon_id'] = this.couponId!.toJson();
    }
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    data['isUsed'] = this.isUsed;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CouponId {
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

  CouponId(
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

  CouponId.fromJson(Map<String, dynamic> json) {
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

class UserId {
  String? sId;
  String? googleId;
  String? displayName;
  String? firstName;
  String? lastName;
  String? profile;
  String? email;
  String? phone;
  bool? isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? lastLoginDate;

  UserId(
      {this.sId,
      this.googleId,
      this.displayName,
      this.firstName,
      this.lastName,
      this.profile,
      this.email,
      this.phone,
      this.isAdmin,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.lastLoginDate});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    googleId = json['googleId'];
    displayName = json['displayName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profile = json['profile'];
    email = json['email'];
    phone = json['phone'];
    isAdmin = json['isAdmin'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    lastLoginDate = json['lastLoginDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['googleId'] = this.googleId;
    data['displayName'] = this.displayName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profile'] = this.profile;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['isAdmin'] = this.isAdmin;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['lastLoginDate'] = this.lastLoginDate;
    return data;
  }
}
