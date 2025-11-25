// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:purpleheatsdev/module/Worker/task_detail_screen.dart';

import '../../components/color.dart';
import '../../components/global.dart';


class MyTask extends StatefulWidget {
  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  var useerID;
  var taskList = [];
  bool isLoading = true;
  var priorityStatus;
  Color? statusColor;

  getTasks() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/tasks/list'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //  print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      taskList = body['data']['tasks'];
      print("yes refreshed");

      setState(() {
        taskList;
      });
      setState(() {
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //appBar: buildNavigationBar(context, "My Task"),
          backgroundColor: WHITE_COLOR,
          body: isLoading ? Center(child: CircularProgressIndicator()) : _itemBuilder(context)),
    );
  }

  Widget _itemBuilder(context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          getTasks();
          print("refresh");
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, top: 20, right: 10),
            // height: Get.height/6.2,
            // width: Get.width*0.97,
            child: Column(
              children: [
                ListView.builder(
                    itemCount: taskList.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (taskList[index]['priority'] == 1) {
                        priorityStatus = "Low";
                      } else if (taskList[index]['priority'] == 2) {
                        priorityStatus = "Medium";
                      } else if (taskList[index]['priority'] == 3) {
                        priorityStatus = "High";
                      }
                      if (taskList[index]['status'] == "completed") {
                        statusColor = Color(0xff1CCBF3);
                      } else if (taskList[index]['status'] == "pending") {
                        statusColor = Color(0xffE2B820);
                      } else if (taskList[index]['status'] == "inprogress") {
                        statusColor = Color(0xff70BE0C);
                      }
                      // ==1? "Low": "";
                      // priority =taskList[index]['priority'] ==2? "Medium": "";
                      // priority =taskList[index]['priority'] ==3? "High": "";

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => TaskDetailScreen(taskList, index)));
                        },
                        child: Card(
                          color: Color(0xffE8E6EA),
                          child: Column(children: [
                            // SizedBox(height:30),
                            Container(
                              height: Get.height / 17,
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(taskList[index]['name'], style: headingTextStyle(context, BLACK_COLOR)),
                                  Text(taskList[index]['status'], style: TextStyle(color: statusColor))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(taskList[index]['request_date'], style: highltedTextStyle(context)),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(priorityStatus.toString(), style: headingTextStyle(context, GREY_COLOR_)),
                                  taskList[index]['property_unit'] == null
                                      ? Text("Api data null")
                                      : Text(
                                          "${taskList[index]['property_unit']['address']}(${taskList[index]['property_unit']['city']})",
                                          //  taskList[index]['assign_time'],
                                          style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      );
                    }),

                SizedBox(height: 20),
                // Card(
                //   color: Color(0xffE8E6EA),
                //   child: Column(children: [
                //     Container(
                //       height: Get.height / 17,
                //       margin: EdgeInsets.only(right: 10, left: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Toilet Maintenance", style: headingTextStyle(context, BLACK_COLOR)),
                //           Text("Rejected", style: cardTextStyle(context, red)),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Text("Thursday, June 2, 2019", style: highltedTextStyle(context)),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Client no. 143", style: headingTextStyle(context, GREY_COLOR_)),
                //           Text("9:10 AM", style: headingTextStyle(context, GREY_COLOR_)),
                //         ],
                //       ),
                //     ),
                //   ]),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Card(
                //   color: Color(0xffE8E6EA),
                //   child: Column(children: [
                //     SizedBox(height: 20),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Fix water leak in kitchen", style: headingTextStyle(context, BLACK_COLOR)),
                //           Text("Requested", style: cardTextStyle(context, BROWN)),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Text("Thursday, June 2, 2019", style: highltedTextStyle(context)),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Client no. 143", style: headingTextStyle(context, GREY_COLOR_)),
                //           Text("9:10 AM", style: headingTextStyle(context, GREY_COLOR_)),
                //         ],
                //       ),
                //     ),
                //   ]),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Card(
                //   color: Color(0xffE8E6EA),
                //   child: Column(children: [
                //     SizedBox(height: 20),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Collect Rent from Tenant", style: headingTextStyle(context, BLACK_COLOR)),
                //           Text("Started", style: cardTextStyle(context, YELLOW)),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Text("Thursday, June 2, 2019", style: highltedTextStyle(context)),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Client no. 143", style: headingTextStyle(context, GREY_COLOR_)),
                //           Text("9:10 AM", style: headingTextStyle(context, GREY_COLOR_)),
                //         ],
                //       ),
                //     ),
                //   ]),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Card(
                //   color: Color(0xffE8E6EA),
                //   child: Column(children: [
                //     SizedBox(height: 20),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Collect Rent from Tenant", style: headingTextStyle(context, BLACK_COLOR)),
                //           Text("Completed", style: cardTextStyle(context, SKY_BLUE)),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Text("Thursday, June 2, 2019",
                //               style: highltedTextStyle(
                //                 context,
                //               )),
                //         ],
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Container(
                //       margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text("Client no. 143", style: headingTextStyle(context, GREY_COLOR_)),
                //           Text("9:10 AM", style: headingTextStyle(context, GREY_COLOR_)),
                //         ],
                //       ),
                //     ),
                //   ]),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
