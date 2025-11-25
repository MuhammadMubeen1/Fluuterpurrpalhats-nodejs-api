// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:purpleheatsdev/API/task_list_api.dart';

import '../components/loading.dart';
import '../models/task_list_model.dart';


class TaskController extends GetxController {
  checkinAgent(data) async {
    print("..................PROFILE LIST AGENT......$data");
    Get.dialog(loading());
    Future.delayed(const Duration(seconds: 30), () => "5");
    TaskModel? thisUser = await TaskAPI().taskPost(data);
    print(" of the checkout agent .............$thisUser");

    if (thisUser == null) {
      if (Get.isDialogOpen!) Get.back();
    }
    if (Get.isDialogOpen!) Get.back();
    Get.back();
  }
}
