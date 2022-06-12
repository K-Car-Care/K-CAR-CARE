class GarageByService {
  String? message;
  List<DataGarage>? payload;

  GarageByService({this.message, this.payload});

  GarageByService.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['payload'] != null) {
      payload = <DataGarage>[];
      json['payload'].forEach((v) {
        payload!.add(DataGarage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    // ignore: unnecessary_this
    data['message'] = this.message;
    // ignore: unnecessary_this
    if (this.payload != null) {
      // ignore: unnecessary_this
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataGarage {
  String? sId;
  Garage? garage;
  Service? service;
  double? price;
  String? description;
  int? iV;

  DataGarage(
      {this.sId,
      this.garage,
      this.service,
      this.price,
      this.description,
      this.iV});

  DataGarage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    // ignore: unnecessary_new
    garage = json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
    // ignore: unnecessary_new
    service = json['service'] != null ? new Service.fromJson(json['service']) : null;
    price = json['price'];
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    data['_id'] = this.sId;
    // ignore: unnecessary_this
    if (this.garage != null) {
      // ignore: unnecessary_this
      data['garage'] = this.garage!.toJson();
    }
    // ignore: unnecessary_this
    if (this.service != null) {
      // ignore: unnecessary_this
      data['service'] = this.service!.toJson();
    }
    // ignore: unnecessary_this
    data['price'] = this.price;
    // ignore: unnecessary_this
    data['description'] = this.description;
    // ignore: unnecessary_this
    data['__v'] = this.iV;
    return data;
  }
}

class Garage {
  Coordinate? coordinate;
  String? sId;
  String? name;
  String? logo;
  String? cloudinaryId;
  String? location;
  String? phone;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Garage(
      {this.coordinate,
      this.sId,
      this.name,
      this.logo,
      this.cloudinaryId,
      this.location,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Garage.fromJson(Map<String, dynamic> json) {
    coordinate = json['coordinate'] != null
        // ignore: unnecessary_new
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
    sId = json['_id'];
    name = json['name'];
    logo = json['logo'];
    cloudinaryId = json['cloudinary_id'];
    location = json['location'];
    phone = json['phone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: unnecessary_this
    if (this.coordinate != null) {
      data['coordinate'] = coordinate!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['logo'] = logo;
    data['cloudinary_id'] = cloudinaryId;
    data['location'] = location;
    data['phone'] = phone;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
    // ignore: unnecessary_new, prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}

class Service {
  String? sId;
  String? name;
  String? description;
  String? img;
  String? cloudinaryId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Service(
      {this.sId,
      this.name,
      this.description,
      this.img,
      this.cloudinaryId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Service.fromJson(Map<String, dynamic> json) {
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
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['img'] = img;
    data['cloudinary_id'] = cloudinaryId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
