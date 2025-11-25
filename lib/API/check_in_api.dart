// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_declarations, avoid_print

import 'dart:convert' as convert;

import 'package:dio/dio.dart';

import '../models/agent_model/check_in_model.dart';
import '../utils/constant.dart';
import '../utils/rest_connector.dart';


class CheckInAPI {
  Future<CheckInModel?> agentIn(data) async {
    print(" checkin mOdel ..........data of the object .................$data");
    final url = BaseURL + 'agent/check-in';
    try {
      Response? response =
          await RestConnector(url: url, requestType: "POST", data: convert.jsonEncode({data})).getData();
      print("..................................user of the profile API........$response");

      final user = CheckInModel.fromJson(response.data);
      print("..................................user of the profile API........$user");
      return user;
    } catch (e) {
      print(".................................CTACH ERROR........$e");
      return null;
    }
  }
}
