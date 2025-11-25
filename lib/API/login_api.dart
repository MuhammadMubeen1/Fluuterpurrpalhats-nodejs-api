// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_declarations, avoid_print

import 'dart:convert' as convert;

import 'package:dio/dio.dart';

import '../models/tanent_login_model.dart';
import '../utils/constant.dart';
import '../utils/rest_connector.dart';


class LoginAPI {
  Future<TanentModel?> login(String username, String password, deviceT) async {
    final url = BaseURL + "/auth/login";
    print("url of the login ........$url");
    try {
      Response response = await RestConnector(
          url: url,
          requestType: "POST",
          data: convert.jsonEncode({
            "email": username,
            "password": password,
            'device_token': deviceT,
          })).getData();
      print("data of the response user login api........${response.data}");
      final user = TanentModel.fromJson(response.data);
      print("user................. user login api........$user");
      return user;
    } catch (e) {
      print("e................. e........$e");
      return null;
    }
  }
}
