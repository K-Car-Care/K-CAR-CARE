import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:k_car_care_project/core/model/coupon_model.dart';
import '../model/promotion.dart';
import '../model/promotion_category_model.dart';
import '../model/user_coupon.dart';
import 'base_repository_api.dart';

class PromotionServiceApi extends ApiRepository {
  Future<PromotionModel> readPromotions() async {
    http.Response response = await http.get(
      Uri.parse('$url/promotions'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4NWYxMjQ2ZTNiMWVhMWFhOWNkMzAiLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE2NTM3OTMwNDJ9.ATRe1mAh6Gy12d82E_Otmd0RRbdHx6WUcDRyxHyjajU',
      },
    );
    if (response.statusCode == 200) {
      return PromotionModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }

  Future<PromotionCategoryModel> readPromotionsCategory() async {
    http.Response response = await http.get(
      Uri.parse('$url/promotion-categories'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4NWYxMjQ2ZTNiMWVhMWFhOWNkMzAiLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE2NTM3OTMwNDJ9.ATRe1mAh6Gy12d82E_Otmd0RRbdHx6WUcDRyxHyjajU',
      },
    );
    if (response.statusCode == 200) {
      return PromotionCategoryModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }


  Future<CouponModel> readPromotionCoupon() async {
    http.Response response = await http.get(
      Uri.parse('$url/coupons'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4NWYxMjQ2ZTNiMWVhMWFhOWNkMzAiLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE2NTM3OTMwNDJ9.ATRe1mAh6Gy12d82E_Otmd0RRbdHx6WUcDRyxHyjajU',
      },
    );
    if (response.statusCode == 200) {
      // print(response.body);
      return CouponModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }


  Future<UserCouponModel> readUserCoupons() async {
    http.Response response = await http.get(
      Uri.parse('$url/user-coupons'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4NWYxMjQ2ZTNiMWVhMWFhOWNkMzAiLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE2NTM3OTMwNDJ9.ATRe1mAh6Gy12d82E_Otmd0RRbdHx6WUcDRyxHyjajU',
      },
    );
    if (response.statusCode == 200) {
      return UserCouponModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception((e) {
        return e;
      });
    }
  }

  Future<dynamic> addUserCoupon({
    required String couponId,
    required String userId,
  }) async {
    http.Response response = await http
      .post(Uri.parse("$url/user-coupons"), 
        body: {
        "coupon_id": couponId,
        "user_id": userId		  
      },
      headers: {
        "Media-Type": "application/json",
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mjg4NWYxMjQ2ZTNiMWVhMWFhOWNkMzAiLCJpc0FkbWluIjp0cnVlLCJyb2xlIjoiQURNSU4iLCJpYXQiOjE2NTM3OTMwNDJ9.ATRe1mAh6Gy12d82E_Otmd0RRbdHx6WUcDRyxHyjajU',
      },);
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 201) {
    }
    if (response.statusCode == 200) {
      return jsonResponse;
    } else {
      throw Exception();
    }
  }

}
