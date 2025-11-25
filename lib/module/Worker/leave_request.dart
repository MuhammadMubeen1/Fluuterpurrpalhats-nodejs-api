// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:purpleheatsdev/components/global.dart';
import 'package:purpleheatsdev/components/string.dart';
import 'package:purpleheatsdev/components/text_field.dart';

import '../../button.dart';
import '../../components/app_bar.dart';
import '../../components/color.dart';
import '../../utils/constant.dart';

class LeaveRequest extends StatefulWidget {
  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  String to = "Select";
  String from = "Select";
  var data = [];

  // ignore: prefer_typing_uninitialized_variables
  var typeId;

  // ignore: prefer_typing_uninitialized_variables
  var useerID;
  bool isLoading = false;
  TextEditingController type = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController leaveHours = TextEditingController();
  TextEditingController leaveMinutes = TextEditingController();
  List<String> leaveMint = [
    "30 minutes",
    "40 minutes",
    "50 minutes",
  ];

  @override
  void initState() {
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    super.initState();
  }

  leaveRequest() async {
    setState(() {
      isLoading = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://admin.purplehats.com/api/agent/leave-request'));
    request.body = json.encode({
      "login_session_id": useerID,
      "leave_type_id": typeId.toString(),
      "date_range_options": {
        "from": from.toString(),
        "return": to.toString(),
      },
      "detail": description.text,
      "leave_hours": leaveHours.text,
      "leave_minutes": leaveMinutes.text,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      print("the body data 200 ==${body}");
      var message = body['message'];
      Fluttertoast.showToast(
        msg: message.toString(),
      );
      setState(() {
        isLoading = false;
      });
    }
    if (response.statusCode == 401) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      print("the body data 401 ==${body}");
      var message = body['message'];
      Fluttertoast.showToast(
        msg: message.toString(),
      );
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

  getLeaveType() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/agent/leave-types'));
    request.body = json.encode({
      "login_session_id": useerID,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      data = body['data']['leave_types'];
    } else {
      print(response.reasonPhrase);
    }
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "Leave Request"),
      body: leaveRequesteWidget(context),
    );
  }

  Widget leaveRequesteWidget(context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    Constants.leave_type,
                    style: headingTextStyle(
                      context,
                      PRIMARY_COLOR,
                    ),
                  )),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showDialogForTypes();
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                      enabled: false,
                      textController: type,
                      readOnly: false,
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      hintText: "select",
                      hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                      // validator: FormValidator.titleValidator
                      validator: ((val) => val.isEmpty ? "Please fill the filed" : null),
                      //         validator: (val){
                      // // if (val!.isEmpty) {
                      // // return 'This is required field';
                      // // }
                      // }
                    )),
              ),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Add A Description",
                      style: headingTextStyle(
                        context,
                        PRIMARY_COLOR,
                      ))),
              SizedBox(height: 20),
              Container(
                width: Get.width / 0.8,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    // color: grey_Input,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: CustomTextField(
                    keyboardType: TextInputType.multiline,
                    autoFocus: false,
                    enabled: true,
                    textController: description,
                    cursorColor: PRIMARY_COLOR,
                    readOnly: false,
                    maxLine: 2,
                    // maxLength:   3000,
                    hintText: "Description",
                    // textcolor:  certificate_text,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                    errorText: '',
                    // textController: _summaryController,
                    onFieldSubmitted: (val) {},
                    onChanged: (val) {},
                    validator: ((val) => val.isEmpty ? "Please fill the filed" : null),
                    onSaved: (newVal) {}),
              ),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Leave Hours",
                    style: headingTextStyle(
                      context,
                      PRIMARY_COLOR,
                    ),
                  )),
              SizedBox(height: 20),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      textController: leaveHours,
                      readOnly: false,
                      hintText: "Hours",
                      hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                      // validator: FormValidator.titleValidator
                      )),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Leave Minutes",
                    style: headingTextStyle(
                      context,
                      PRIMARY_COLOR,
                    ),
                  )),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showDialogForLeaveMinutes();
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        enabled: false,
                        textController: leaveMinutes,
                        readOnly: false,
                        hintText: "Minutes",
                        hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                        // validator: FormValidator.titleValidator
                        )),
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "FROM",
                      style: headingTextStyle(context, PRIMARY_COLOR),
                    )),
                GestureDetector(
                  onTap: () {
                    selectDate(context, 1);
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Text(
                        from,
                        style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                      )),
                ),
              ]),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "TO",
                      style: headingTextStyle(context, PRIMARY_COLOR),
                    )),
                GestureDetector(
                  onTap: () {
                    selectDate(context, 0);
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Text(
                        to,
                        style: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                      )),
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 16),
                      child: shadowButton(
                        Constants.pswd_rest_btn,
                        60,
                        PRIMARY_COLOR,
                        () {
                          if (formKey.currentState!.validate()) {
                            leaveRequest();
                          }

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => CongratsScreen()),
                          // );
                        },
                        double.infinity,
                        PRIMARY_COLOR.withOpacity(0.20),
                      )),
            ],
          ),
        ),
      ),
    );
  }

  selectDate(BuildContext context, int index) async {
    DateTime? selectDate;
    await DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
      selectDate = date;
    }, currentTime: DateTime.now());
    if (selectDate != null) {
      setState(() {
        if (index == 0) {
          to = DateFormat('dd-MM-yyyy KK:MM a').format(selectDate!);
        }
        if (index == 1) {
          from = DateFormat('dd-MM-yyyy KK:MM a').format(selectDate!);
        }
      });
    }
  }

  showDialogForTypes() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select Type'),
            content: Container(
              height: 480,
              width: 350,
              child: FutureBuilder(
                  future: getLeaveType(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator()); // Show a loading indicator
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Container(
                          // height: 200,
                          width: 350,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: data.length, //photoList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Column(
                                    children: [
                                      Text(
                                        data[index]['title'].toString(),
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    type.text = data[index]['title'].toString();
                                    typeId = data[index]['id'].toString();
                                    print("i am current ID  ${typeId.toString()}");
                                    // print("i am current id  ${  catagoryId}");
                                    setState(() {});
                                  },
                                );
                              }),
                        );
                      }
                    }
                  }),
            ),
          );
        });
  }

  showDialogForLeaveMinutes() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select minutes'),
            content: Container(
              height: 120,
              width: 350,
              child: Container(
                width: 350,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: leaveMint.length, //photoList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Column(
                          children: [
                            Text(
                              leaveMint[index].toString(),
                            ),
                            const Divider(),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          leaveMinutes.text = leaveMint[index].toString();
                          setState(() {});
                        },
                      );
                    }),
              ),
            ),
          );
        });
  }
}
