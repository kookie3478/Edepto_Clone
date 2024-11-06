import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../models/response.model.dart';
import 'app.const.dart';

final dio = Dio();

class ApiCall {
  static void configureDio() {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['accept'] = 'application/json';
    dio.options.headers['app-id'] = AppConst.appId;
  }

  static void updateToken(String token) {
    dio.options.headers['x-access-token'] = token;
    AppConst.authToken = token;
  }

  static void forceLogout() {
    dio.options.headers.remove('x-access-token');
  }

  static post(String url, Map<String, dynamic> data) async {
    final Logger logger = Logger();
    try {
      final response = await dio.postUri(Uri.parse(url), data: data);
      if (response.data['responseCode'] == 501) {
        ResponseModel responseModel = ResponseModel.fromJson({
          "status": "error",
          "message": response.data['message'],
          "responseCode": 500,
          "data": null,
        });
        forceLogout();
        return responseModel.toJson();
      }
      if (response.headers.value('Authorization') != null && response.headers.value('Authorization') != '') {
        updateToken(response.headers.value('Authorization')!);
      }
      if (response.data["data"] == null) {
        return response.data;
      }
      try {
        response.data["data"] = jsonDecode(response.data["data"]);
      } catch (e) {
        response.data["data"] = response.data["data"];
      }
      return response.data;
    } catch (e) {
      logger.e(e);
      ResponseModel responseModel = ResponseModel.fromJson({
        "status": "error",
        "message": "Something went wrong",
        "responseCode": 500,
        "data": null,
      });
      return responseModel.toJson();
    }
  }

  static get(String url) async {
    final Logger logger = Logger();

    try {
      String urlPath = Uri.parse(url).path;
      if (Uri.parse(url).hasQuery) {
        urlPath = "$urlPath?${Uri.parse(url).query}";
      }
      final response = await dio.getUri(Uri.parse(url));
      if (response.data['responseCode'] == 501) {
        ResponseModel responseModel = ResponseModel.fromJson({
          "status": "error",
          "message": response.data['message'],
          "responseCode": 500,
          "data": null,
        });
        forceLogout();
        return responseModel.toJson();
      }
      if (response.headers.value('Authorization') != null && response.headers.value('Authorization') != '') {
        updateToken(response.headers.value('Authorization')!);
      }
      if (response.data["data"] == null) {
        return response.data;
      }
      try {
        response.data["data"] = jsonDecode(response.data["data"]);
      } catch (e) {
        response.data["data"] = response.data["data"];
      }
      return response.data;
    } catch (e) {
      logger.e(e);
      logger.e(url);
      ResponseModel responseModel = ResponseModel.fromJson({
        "status": "error",
        "message": "Something went wrong",
        "responseCode": 500,
        "data": null,
      });
      return responseModel.toJson();
    }
  }

  static put(String url, Map<String, dynamic> data) async {
    final Logger logger = Logger();
    try {
      final response = await dio.putUri(Uri.parse(url), data: data);
      if (response.data['responseCode'] == 501) {
        ResponseModel responseModel = ResponseModel.fromJson({
          "status": "error",
          "message": response.data['message'],
          "responseCode": 500,
          "data": null,
        });
        forceLogout();
        return responseModel.toJson();
      }
      if (response.data["data"] == null) {
        return response.data;
      }
      try {
        response.data["data"] = jsonDecode(response.data["data"]);
      } catch (e) {
        response.data["data"] = response.data["data"];
      }
      return response.data;
    } catch (e) {
      logger.e(e);
      ResponseModel responseModel = ResponseModel.fromJson({
        "status": "error",
        "message": "Something went wrong",
        "responseCode": 500,
        "data": null,
      });
      return responseModel.toJson();
    }
  }

}
