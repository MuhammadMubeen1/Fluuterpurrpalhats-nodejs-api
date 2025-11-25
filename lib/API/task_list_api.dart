// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_declarations, unused_local_variable, avoid_print

import 'dart:convert' as convert;

import 'package:dio/dio.dart';

import '../models/task_list_model.dart';
import '../utils/constant.dart';
import '../utils/rest_connector.dart';


class TaskAPI {
  Future<TaskModel?> taskPost(data) async {
    final url = BaseURL + 'tasks/list';
    try {
      Response? response =
          await RestConnector(url: url, requestType: "POST", data: convert.jsonEncode({data})).getData();

      final user = TaskModel.fromJson(response.data);
      print("..................................user of the profile API........$user");

      return user;
    } catch (e) {
      print(".................................CTACH ERROR........$e");
      return null;
    }
  }
}
