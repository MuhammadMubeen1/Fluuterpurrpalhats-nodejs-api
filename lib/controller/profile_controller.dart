// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../API/profile_api.dart';
import '../components/loading.dart';
import '../models/agent_model/profile_model.dart';


class ProfileController extends GetxController {
  profileListAgent(data) async {
    print("..................PROFILE LIST AGENT......$data");
    Get.dialog(loading());
    Future.delayed(const Duration(seconds: 30), () => "5");
    ProfileModel? thisUser = await ProfileAPI().agentProfile(data);
    if (thisUser == null) {
      if (Get.isDialogOpen!) Get.back();
    }
    if (Get.isDialogOpen!) Get.back();
    Get.back();
  }
}
