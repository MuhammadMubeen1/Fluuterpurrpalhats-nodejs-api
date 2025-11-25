// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:get/get.dart';

import '../API/check_in_api.dart';
import '../components/loading.dart';
import '../models/agent_model/check_in_model.dart';


class CheckInController extends GetxController {
  var CheckInUser = CheckInModel(status: '', reponse_type: '', response_message: '', data: Data()).obs;

  checkinAgent(data) async {
    print("..................PROFILE LIST AGENT......$data");
    Get.dialog(loading());
    Future.delayed(const Duration(seconds: 30), () => "5");
    CheckInModel? thisUser = await CheckInAPI().agentIn(data);
    print("checkin..................${thisUser}");
    CheckInUser(thisUser);
    print("Payload data response...............${CheckInUser.value.data}");
    if (thisUser == null) {
      if (Get.isDialogOpen!) Get.back();
    }
    if (Get.isDialogOpen!) Get.back();
    //print("responce == ${CheckInUser.value.reponse_type.toString()}");

    // Get.to(MyTask());
  }
}
