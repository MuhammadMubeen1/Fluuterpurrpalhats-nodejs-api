// ignore_for_file: unnecessary_overrides, unused_import, unused_local_variable, avoid_print, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, unused_element

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purpleheatsdev/components/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/login_api.dart';
import '../constant/bottom_app_bar/bottom_navigation_app_bar.dart';
import '../constant/bottom_app_bar_worker_side/bottom_bar_worker_side.dart';
import '../models/tanent_login_model.dart';
import '../module/Tanent/home_screen.dart';

class LoginController extends GetxController {
  var deviceToken;
  var myUser = TanentModel(
          status: "",
          reponse_type: "",
          response_message: "",
          data: DataTanent())
      .obs;
  var showPassValue = true.obs;

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    super.onInit();

    //   FirebaseMessaging.instance.getToken().then((token) {
    //     print("my token is ==$token");
    //     assert(token != null);
    //     print("firebase messgain$token");
    //     deviceToken = token;
    //     print("firebase messgain$deviceToken");

    //     GetStorage().write("fcm_token", deviceToken);
    //     print("----000----Message----${GetStorage().write("fcm_token", deviceToken)}");
    //   });
     }

    loginUser(String username, String password) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      Get.dialog(loading());
      Future.delayed(const Duration(seconds: 30), () => "5");
      TanentModel? thisUser =
          await LoginAPI().login(username, password, deviceToken);

      if (thisUser == null) {
        if (Get.isDialogOpen!) Get.back();
        Fluttertoast.showToast(msg: "User not found");
      }

      myUser.value = thisUser!;
      if (myUser.value.data != null && myUser.value.status == "success") {
        await preferences.setBool('isLoggedIn', true);
        await preferences.setString('userType', myUser.value.data?.user_type);

        GetStorage().write("user_type", myUser.value.data?.user_type);
        GetStorage().read('user_type');
        GetStorage()
            .write("user_id", (myUser.value.data?.login_session?.id ?? ""));
        print("user typeeeee define ${myUser.value.data?.user_type}");
        print(
            "myUser.value.data?.login_session?.id ${myUser.value.data?.login_session?.id}");
        if (Get.isDialogOpen!) Get.back();
        if (myUser.value.data?.user_type == "agent") {
          print("myuserdata == ${myUser.value.data?.user_type}");
          Get.to(BottomNavigationAppBarAgentSide());
        } else {
          Get.to(BottomNavigationAppBar());
        }
      }
    }

    isShowPass(val) {
      print(" nnnnnnnnnnn........ isshowPass.......$val");
      showPassValue(val);
    }
  }

