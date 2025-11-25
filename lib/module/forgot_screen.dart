// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:purpleheatsdev/components/color.dart';
import 'package:purpleheatsdev/components/global.dart';

import '../button.dart';
import '../components/string.dart';
import '../components/text_field.dart';


// ignore_for_file: avoid_unnecessary_containers, unnecessary_const, sized_box_for_whitespace, depend_on_referenced_packages, sort_child_properties_last, avoid_types_as_parameter_names

class ForgotScreen extends StatelessWidget {
  forgotUser() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: WHITE_COLOR,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: PRIMARY_COLOR,
            ),
          )),
      body: forgotWidget(context),
    );
  }

  Widget forgotWidget(context) {
    return SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          Constants.MSGSENT,
          height: 230,
        ),
      ),
      Text(
        Constants.pswd_rest,
        style: boldTextStyle(context, PRIMARY_COLOR, 35),
      ),
      const SizedBox(height: 20),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.center,
          child: Text(
            Constants.pswd_rest_des,
            style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
          )),
      const SizedBox(height: 40),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomTextField(
              // textController: controller,
              readOnly: false,
              hintText: Constants.email,
              hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
              // validator: FormValidator.titleValidator
              )),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
        child: shadowButton(Constants.pswd_rest_btn, 60, PRIMARY_COLOR, () {
          // var userType =GetStorage().read('user_type');
          // print(" user type defibe ,,,.................>>E$userType");
          // userType =="agent" ?
          //
          // Navigator.push(context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) =>  AgentScreen(),
          //   ),
          // ): Navigator.push(context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) =>  TanentHomeScreen(),
          //   ),
          // );
        }, double.infinity, PRIMARY_COLOR.withOpacity(0.18)),
      )
    ]));
  }
}
