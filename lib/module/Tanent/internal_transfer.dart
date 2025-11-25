// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import 'package:intl/intl.dart';
import 'package:purpleheatsdev/button.dart';
import 'package:purpleheatsdev/components/app_bar.dart';
import 'package:purpleheatsdev/components/color.dart';
import 'package:purpleheatsdev/components/global.dart';
import 'package:purpleheatsdev/components/string.dart';
import 'package:purpleheatsdev/components/text_field.dart';


// ignore: use_key_in_widget_constructors
class InternalTransfer extends StatefulWidget {
  @override
  State<InternalTransfer> createState() => _InternalTransferState();
}

class _InternalTransferState extends State<InternalTransfer> {
  String dateOfTransfer = "Select";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "Internal Transfer"),
      body: maintenanceWidget(context),
    );
  }

  Widget maintenanceWidget(context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Constants.clientInfo,
                  style: headingTextStyle(
                    context,
                    PRIIMARY_BASIC,
                  ),
                )),
            SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    // textController: controller,
                    readOnly: false,
                    hintText: Constants.client_title,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    // textController: controller,
                    readOnly: false,
                    hintText: Constants.address,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    // textController: controller,
                    readOnly: false,
                    hintText: Constants.phone,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    // textController: controller,
                    readOnly: false,
                    hintText: Constants.email,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Constants.location,
                  style: headingTextStyle(
                    context,
                    PRIMARY_COLOR,
                  ),
                )),
            SizedBox(height: 20),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    // textController: controller,
                    readOnly: false,
                    hintText: Constants.lahore,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(
                    Constants.do_trans,
                    style: headingTextStyle(
                      context,
                      PRIMARY_COLOR,
                    ),
                  ),
                ),
                Text(
                  dateOfTransfer,
                  style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      selectDate(context);
                    },
                    child: Icon(
                      Icons.date_range,
                      color: PRIMARY_COLOR,
                      size: 22,
                    ))
              ]),
            ),
            SizedBox(height: 30),
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: PRIMARY_COLOR,
                indent: 20,
                endIndent: 10,
                thickness: 2,
              )),
              Text(Constants.info),
              Expanded(
                  child: Divider(
                color: PRIMARY_COLOR,
                indent: 10,
                endIndent: 20,
                thickness: 2,
              )),
            ]),
            SizedBox(height: 40),
            Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Tenant",
                      style: textStyleTextStyle(context, PRIMARY_COLOR),
                    ),
                    SizedBox(height: 10),
                    Text("Address", style: textStyleTextStyle(context, PRIMARY_COLOR)),
                    SizedBox(height: 10),
                    Text("Phone:", style: textStyleTextStyle(context, PRIMARY_COLOR)),
                    SizedBox(height: 10),
                    Text("Email", style: textStyleTextStyle(context, PRIMARY_COLOR)),
                  ],
                ),
              ),
              Container(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 10),
                Text(
                  "John Doe",
                  style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                ),
                SizedBox(height: 10),
                Text("Apart # 101 Oregon, 945368 CA", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                SizedBox(height: 10),
                Text("+1 111 0222 33", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                SizedBox(height: 10),
                Text("johndoe@gmail.com", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
              ]))
            ]),
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                child: shadowButton(
                  Constants.pswd_rest_btn,
                  60,
                  WHITE_COLOR,
                  () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MyInfo()),
                    // );
                  },
                  double.infinity,
                  PRIIMARY_BASIC,
                )),
          ],
        ),
      ),
    );
  }

  selectDate(
    BuildContext context,
  ) async {
    DateTime? selectDate;
    await DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
      selectDate = date;
    }, currentTime: DateTime.now());
    if (selectDate != null) {
      setState(() {
        dateOfTransfer = DateFormat('dd/MM/yyyy').format(selectDate!);
      });
    }
  }
}
