class TowingCompanyModel {
  String? message;
  List<GetTowingInfo>? getTowingInfo;

  TowingCompanyModel({this.message, this.getTowingInfo});

  TowingCompanyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['payload'] != null) {
      getTowingInfo = <GetTowingInfo>[];
      json['payload'].forEach((v) {
        getTowingInfo!.add(new GetTowingInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.getTowingInfo != null) {
      data['payload'] = this.getTowingInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetTowingInfo {
  Coordinate? coordinate;
  String? sId;
  String? title;
  String? img;
  bool? active;
  String? cloudinaryId;
  User? user;
  List<UserCars>? userCars;
  String? location;
  List<String>? phoneNumbers;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetTowingInfo(
      {this.coordinate,
      this.sId,
      this.title,
      this.img,
      this.active,
      this.cloudinaryId,
      this.user,
      this.userCars,
      this.location,
      this.phoneNumbers,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  GetTowingInfo.fromJson(Map<String, dynamic> json) {
    coordinate = json['coordinate'] != null
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
    sId = json['_id'];
    title = json['title'];
    img = json['img'];
    active = json['active'];
    cloudinaryId = json['cloudinary_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['userCars'] != null) {
      userCars = <UserCars>[];
      json['userCars'].forEach((v) {
        userCars!.add(new UserCars.fromJson(v));
      });
    }
    location = json['location'];
    phoneNumbers = json['phoneNumbers'].cast<String>();
    isDeleted = json['isDeleted'];
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
    data['img'] = this.img;
    data['active'] = this.active;
    data['cloudinary_id'] = this.cloudinaryId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.userCars != null) {
      data['userCars'] = this.userCars!.map((v) => v.toJson()).toList();
    }
    data['location'] = this.location;
    data['phoneNumbers'] = this.phoneNumbers;
    data['isDeleted'] = this.isDeleted;
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

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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

class UserCars {
  String? sId;
  String? title;
  String? make;
  String? model;
  bool? active;
  int? year;
  String? bodyType;
  String? fuel;
  String? color;
  String? img;
  String? cloudinaryId;
  bool? isDeleted;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserCars(
      {this.sId,
      this.title,
      this.make,
      this.model,
      this.active,
      this.year,
      this.bodyType,
      this.fuel,
      this.color,
      this.img,
      this.cloudinaryId,
      this.isDeleted,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserCars.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    make = json['make'];
    model = json['model'];
    active = json['active'];
    year = json['year'];
    bodyType = json['bodyType'];
    fuel = json['fuel'];
    color = json['color'];
    img = json['img'];
    cloudinaryId = json['cloudinary_id'];
    isDeleted = json['isDeleted'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['make'] = this.make;
    data['model'] = this.model;
    data['active'] = this.active;
    data['year'] = this.year;
    data['bodyType'] = this.bodyType;
    data['fuel'] = this.fuel;
    data['color'] = this.color;
    data['img'] = this.img;
    data['cloudinary_id'] = this.cloudinaryId;
    data['isDeleted'] = this.isDeleted;
    data['deletedAt'] = this.deletedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}