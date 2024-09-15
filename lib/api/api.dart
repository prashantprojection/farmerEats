import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:software_lab_assignment/models/business_model.dart';
import 'package:software_lab_assignment/models/response_model.dart'; // for encoding the body as JSON

class Api {
  static const baseUrl = "sowlab.com";

  Future<ResponseModel> login(
      {required String email,
      required String password,
      required String token,
      required String type}) async {
    Uri url = Uri.https(baseUrl, 'assignment/user/login/');

    var body = jsonEncode({
      'email': email,
      'password': password,
      'role': 'farmer',
      'device_token': token,
      'social_id': token,
      'type': type
    });

    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    ResponseModel res = responseModelFromJson(response.body);

    return res;
  }

  Future<ResponseModel> signup({required BusinessModel model}) async {
    Uri url = Uri.https(baseUrl, 'assignment/user/register/');
    var body = jsonEncode(model.toJson());
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: body);
    ResponseModel res = responseModelFromJson(response.body);
    return res;
  }

  Future<ResponseModel> forgotPassword({required String number}) async {
    Uri url = Uri.https(baseUrl, 'assignment/user/forgot-password/');
    var body = jsonEncode({"mobile": number});
    var response = await http
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    ResponseModel res = responseModelFromJson(response.body);

    return res;
  }

  Future<ResponseModel> verifyOtp({required String otp}) async {
    Uri url = Uri.https(baseUrl, 'assignment/user/verify-otp/');
    var body = jsonEncode({"otp": otp});
    var response = await http
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    ResponseModel res = responseModelFromJson(response.body);
    return res;
  }

  Future<ResponseModel> resetPassword(
      {required String token,
      required String password,
      required String cpassword}) async {
    Uri url = Uri.https(baseUrl, 'assignment/user/reset-password/');
    var body = jsonEncode(
        {"token": token, "password": password, "cpassword": cpassword});
    var response = await http
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    ResponseModel res = responseModelFromJson(response.body);
    return res;
  }
}
