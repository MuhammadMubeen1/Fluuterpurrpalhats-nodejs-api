// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:purpleheatsdev/module/sign_in.dart';

import '../button.dart';
import '../components/color.dart';
import '../components/global.dart';
import '../components/string.dart';
import '../components/text_field.dart';

// ignore_for_file: avoid_unnecessary_containers, unnecessary_const, sized_box_for_whitespace, depend_on_referenced_packages, sort_child_properties_last, avoid_types_as_parameter_names
bool checkBox = false;

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: signInWidget(context),
    );
  }

  Widget signInWidget(context) {
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Constants.ILLUSTRATION1,
            height: 200,
          ),
        ),
        Text(
          Constants.create_accoun,
          style: boldTextStyle(context, PRIMARY_COLOR, 35),
        ),
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
        const SizedBox(height: 20),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
                // textController: controller,
                readOnly: false,
                hintText: Constants.first_name,
                hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                // validator: FormValidator.titleValidator
                )),
        const SizedBox(height: 20),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
                // prefixIcon: SvgPicture.asset(personImg),
                // textController: controller,
                readOnly: false,
                hintText: Constants.last_name,
                hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                // validator: FormValidator.titleValidator
                )),
        const SizedBox(height: 20),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
                // prefixIcon: SvgPicture.asset(personImg),
                // textController: controller,
                readOnly: false,
                hintText: Constants.password,
                hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                // validator: FormValidator.titleValidator
                )),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
          child: shadowButton(Constants.create_accoun, 60, PRIMARY_COLOR, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIN()),
            );
          }, double.infinity, PRIMARY_COLOR.withOpacity(0.18)),
        )
      ]),
    );
  }
}
