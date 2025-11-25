// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:purpleheatsdev/button.dart';
import 'package:purpleheatsdev/components/color.dart';
import 'package:purpleheatsdev/components/global.dart';
import 'package:purpleheatsdev/components/string.dart';


import '../../components/app_bar.dart';
import '../../components/text_field.dart';

class TaskDetailScreen extends StatefulWidget {
  TaskDetailScreen(this.task, this.curentIndex, {Key? key}) : super(key: key);
  var task = [];
  int curentIndex;

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  var useerID;
  bool isTaskStart = false;
  TextEditingController remarks = TextEditingController();

  startTask() async {
    setState(() {
      isTaskStart = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PUT', Uri.parse('https://admin.purplehats.com/api/tasks/start'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
      "task_id": widget.task[widget.curentIndex]['id'],
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['message'];
      Fluttertoast.showToast(
        msg: message.toString(),
      );
      setState(() {
        isTaskStart = false;
      });
    }
    if (response.statusCode == 401) {
      //  print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['message'];
      Fluttertoast.showToast(
        msg: message.toString(),
      );
      setState(() {
        isTaskStart = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isTaskStart = false;
      });
    }
  }

  completeTask() async {
    setState(() {
      isTaskStart = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://admin.purplehats.com/api/tasks/complete'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
      "task_id": widget.task[widget.curentIndex]['id'],
      "remarks": remarks.text,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['message'];
      Fluttertoast.showToast(
        msg: message.toString(),
      );
      setState(() {
        isTaskStart = false;
      });
    }
    if (response.statusCode == 401) {
      //  print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['message'];
      Fluttertoast.showToast(
        msg: message.toString(),
      );
      setState(() {
        isTaskStart = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isTaskStart = false;
      });
    }
  }

  @override
  void initState() {
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "Tasks Details"),
      body: taskDailsWidget(context),
    );
  }

  Widget taskDailsWidget(context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.task[widget.curentIndex]['name'],
                  style: headingTextStyle(
                    context,
                    PRIMARY_COLOR,
                  ),
                )),

            SizedBox(height: 10),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.task[widget.curentIndex]['description'],
                  style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                )),
            SizedBox(height: 20),
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: PRIMARY_COLOR,
                indent: 20,
                endIndent: 10,
                thickness: 2,
              )),
              Text("Task description"),
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
                      "Property details",
                      style: textStyleTextStyle(context, PRIMARY_COLOR),
                    ),
                    SizedBox(height: 10),
                    Text(Constants.address, style: textStyleTextStyle(context, PRIMARY_COLOR)),
                    SizedBox(height: 10),
                    Text("Entry preference", style: textStyleTextStyle(context, PRIMARY_COLOR)),
                    SizedBox(height: 10),
                    Text("Details", style: textStyleTextStyle(context, PRIMARY_COLOR)),
                  ],
                ),
              ),
              Container(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 10),
                Text(
                  "Property details",
                  style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                ),
                SizedBox(height: 10),
                widget.task[widget.curentIndex]['property_unit'] == null
                    ? Text("api null")
                    : Text(
                        "${widget.task[widget.curentIndex]['property_unit']['address']}(${widget.task[widget.curentIndex]['property_unit']['city']})",
                        style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                SizedBox(height: 10),
                widget.task[widget.curentIndex]['maintenance_request'] == null
                    ? Text("api null")
                    : Text(widget.task[widget.curentIndex]['maintenance_request']['entry_permission'],
                        style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                SizedBox(height: 10),
                Text("Not getting yet", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
              ]))
            ]),
            SizedBox(height: 40),
            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                color: PRIMARY_COLOR,
                indent: 20,
                endIndent: 10,
                thickness: 2,
              )),
              Text("Time Info"),
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
                      Constants.Request_Date,
                      style: textStyleTextStyle(context, PRIMARY_COLOR),
                    ),
                    SizedBox(height: 10),
                    Text(Constants.Request_Time, style: textStyleTextStyle(context, PRIMARY_COLOR)),
                    SizedBox(height: 10),
                    Text(Constants.Due_Date, style: textStyleTextStyle(context, PRIMARY_COLOR)),
                    SizedBox(height: 10),
                    Text(Constants.due_time, style: textStyleTextStyle(context, PRIMARY_COLOR)),
                  ],
                ),
              ),
              Container(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 10),
                Text(
                  widget.task[widget.curentIndex]['request_date'],
                  style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                ),
                SizedBox(height: 10),
                Text("Not getting yet", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                SizedBox(height: 10),
                Text("Not getting yet", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
                SizedBox(height: 10),
                Text("Not getting yet", style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)),
              ]))
            ]),
            SizedBox(height: 20),
            widget.task[widget.curentIndex]['status'] == "inprogress"
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Remarks",
                            style: TextStyle(
                              fontSize: 18,
                              color: PRIMARY_COLOR,
                            ),
                          )),
                      SizedBox(height: 10),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextField(
                              textController: remarks,
                              readOnly: false,
                              hintText: "Share your remarks",
                              hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'This is required field';
                                }
                              })),
                    ],
                  )
                : Container(),
            SizedBox(height: 50),

            //  Spacer(),
            widget.task[widget.curentIndex]['status'] == "completed"
                ? Container()
                : isTaskStart
                    ? Center(child: CircularProgressIndicator())
                    : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 40, 120),
                            child: shadowButton(
                              widget.task[widget.curentIndex]['status'] == "inprogress"
                                  ? "Complete Task"
                                  : "Start Task",
                              60,
                              GREEN_COLOR,
                              () {
                                widget.task[widget.curentIndex]['status'] == "inprogress"
                                    ? completeTask()
                                    : startTask();
                              },
                              Get.width / 1.3,
                              GREEN_BUTTON,
                            )),
                        // Padding(
                        //     padding: const EdgeInsets.fromLTRB(0, 0, 30, 120),
                        //     child: shadowButton(
                        //       Constants.reject,
                        //       60,
                        //       REJECT_BUTTON,
                        //       () {
                        //         //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyInfo()),
                        //         // );
                        //       },
                        //       Get.width / 2.7,
                        //       REJECT_COLOR,
                        //     )),
                      ])
          ],
        ),
      ),
    );
  }
}
