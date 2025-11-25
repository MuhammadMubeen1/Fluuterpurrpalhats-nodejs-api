// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_declarations, avoid_print

import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:purpleheatsdev/models/agent_model/check_in_model.dart';

import '../utils/constant.dart';
import '../utils/rest_connector.dart';


class CheckOutAPI {
  Future<CheckInModel?> agentCheckOut(data) async {
    final url = BaseURL + 'agents/check-out';
    try {
      Response? response =
          await RestConnector(url: url, requestType: "POST", data: convert.jsonEncode({data})).getData();

      final user = CheckInModel.fromJson(response.data);
      print("..................................user of the profile API........$user");

      return user;
    } catch (e) {
      print(".................................CTACH ERROR........$e");
      return null;
    }
  }
}
