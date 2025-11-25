// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:purpleheatsdev/button.dart';
import 'package:purpleheatsdev/components/color.dart';
import 'package:purpleheatsdev/components/global.dart';
import 'package:purpleheatsdev/components/string.dart';
import 'package:purpleheatsdev/module/Worker/task_detail.dart';

class CongratsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: congratsWidget(context),
    );
  }

  Widget congratsWidget(context) {
    return SafeArea(
        child: Align(
      alignment: Alignment.center,
      child: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              flex: 2,
              child: SvgPicture.asset(
                Constants.CONGRATS_IMG,
              )),
          Text(
            Constants.gr8_job,
            style: boldTextStyle(context, WHITE_COLOR, 35),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              Constants.gr8_job_TEXT,
              textAlign: TextAlign.center,
              style: hintCongrs(
                context,
              ),
            ),
          ),
          Spacer(),
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: shadowButton(
                Constants.close,
                60,
                PRIMARY_COLOR,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskDetail()),
                  );
                },
                double.infinity,
                WHITE_COLOR,
              )),
        ]),
      ),
    ));
  }
}
