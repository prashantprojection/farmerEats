// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  final bool success;
  final String message;
  final String? token;
  final bool? isVerified;

  ResponseModel({
    required this.success,
    required this.message,
    this.token,
    this.isVerified,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        success: json["success"],
        message: json["message"],
        token: json["token"],
        isVerified: json["is_verified"] ?? false,
      );
}
