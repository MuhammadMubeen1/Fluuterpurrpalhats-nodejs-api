// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, use_key_in_widget_constructors, unused_import, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpleheatsdev/components/color.dart';
import 'package:purpleheatsdev/components/global.dart';

import '../../button.dart';
import '../../components/app_bar.dart';
import '../../components/string.dart';

class RentPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "Rent Payments"),
      body: rentPaymentWidget(context),
    );
  }

  Widget rentPaymentWidget(context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20),
          Card(
            color: PRIMARY_COLOR,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Rent Payment",
                      style: highltedTextStyle(context),
                    ),
                    Text(
                      "Due Date: Thursday, June 2, 2019",
                      style: highltedTextStyle(context),
                    ),
                    Text(
                      "Amount: 500.30 CAD",
                      style: highltedTextStyle(context),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                shadowButton(Constants.pAY, 60, PRIMARY_COLOR, () {
                  // Navigator.pushReplacement<void, void>(context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) =>  SignUp(),
                  //   ),
                  // );
                }, Get.width / 3, WHITE_COLOR)
              ],
            ),
          ),
          SizedBox(height: 20),
          Card(
            color: GREY_COLOR,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 19, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Rent Payment",
                        style: highltedTextStyle(context),
                      ),
                      Text(
                        "Due Date: Thursday, June 2, 2019",
                        style: highltedTextStyle(context),
                      ),
                      Text(
                        "Amount: 500.30 CAD",
                        style: highltedTextStyle(context),
                      ),
                    ],
                  ),
                ),
                // TextButton(
                //   child: Text(
                //     Constants.pAYED,
                //     style: TextStyle(fontSize: 14)
                //   ),
                //   style: ButtonStyle(
                //     padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                //     foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //       RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(18.0),
                //         side: BorderSide(color: Colors.red)
                //       )
                //     )
                //   ),
                //   onPressed: () {
                //     Navigator.push(context,
                //       MaterialPageRoute(
                //         builder: (BuildContext context) =>  RequestMaintenance(),
                //       ),
                //     );

                //   }
                // ),
                shadowButton(Constants.pAYED, 45, PRIMARY_COLOR, () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => RequestMaintenance(),
                  //   ),
                  // );
                }, Get.width / 4.1, PRIMARY_COLOR)
              ],
            ),
          )
        ],
      ),
    );
  }
}
