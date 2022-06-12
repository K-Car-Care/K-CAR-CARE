class PromotionCategoryModel {
  String? message;
  List<DataPromotionCategory>? payload;

  PromotionCategoryModel({this.message, this.payload});

  PromotionCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['payload'] != null) {
      payload = <DataPromotionCategory>[];
      json['payload'].forEach((v) {
        payload!.add(DataPromotionCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (payload != null) {
      data['payload'] = payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPromotionCategory {
  String? sId;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DataPromotionCategory(
      {this.sId,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.iV});

  DataPromotionCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}