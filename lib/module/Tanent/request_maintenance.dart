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
import 'package:purpleheatsdev/button.dart';
import 'package:purpleheatsdev/components/color.dart';
import 'package:purpleheatsdev/components/string.dart';
import 'package:purpleheatsdev/components/text_field.dart';

import '../../components/global.dart';
import '../../utils/constant.dart';

class RequestMaintenance extends StatefulWidget {
  RequestMaintenance(this.profile, {Key? key}) : super(key: key);
  var profile;

  @override
  State<RequestMaintenance> createState() => _RequestMaintenanceState();
}

class _RequestMaintenanceState extends State<RequestMaintenance> {
  var useerID;
  String date = "Today";
  bool isLoading = false;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController propertyTitle = TextEditingController();
  TextEditingController entryPermission = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var propertyUnit = [];
  var propertyId;

  requestFunc() async {
    print("userid = $useerID");
    print("property_id = ${propertyId.toString()}");
    print("visit_date = ${date.toString()}");
    print("title = ${title.text.toString()}");
    print("description = ${description.text.toString()}");
    print("entry_permission = ${entryPermission.text.toString()}");
    setState(() {
      isLoading = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://admin.purplehats.com/api/tenant/maintenance-request'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
      "property_id": propertyId.toString(),
      "visit_date": date.toString(),
      "title": title.text,
      "description": description.text,
      "entry_permission": entryPermission.text,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
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

  propertyUnits() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://admin.purplehats.com/api/tenant/property-unit-list'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      propertyUnit = body['data'];
      setState(() {
        propertyUnit;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    propertyUnits();
    super.initState();
  }

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
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Request Maintenance",
          style: labelTextStyle(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Add a Title",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 10),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      textController: title,
                      readOnly: false,
                      hintText: "Title",
                      hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'This is required field';
                        }
                      })),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Property Id",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showDialogForProperty();
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextField(
                        textController: propertyTitle,
                        readOnly: false,
                        hintText: "Property Id",
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.grey,
                        ),
                        hintStyle:
                            hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'This is required field';
                          }
                        })),
              ),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Entry Permission",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 10),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      textController: entryPermission,
                      readOnly: false,
                      hintText: "yes_with_any_time",
                      hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'This is required field';
                        }
                      })),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Add a Description",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
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
                    cursorColor: PRIMARY_COLOR,
                    readOnly: false,
                    maxLine: 2,
                    // maxLength:   3000,
                    hintText: "Description",
                    // textcolor:  certificate_text,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR),
                    errorText: '',
                    textController: description,
                    onFieldSubmitted: (val) {},
                    onChanged: (val) {},
                    validator: ((val) =>
                        val.isEmpty ? "This is required field" : null),
                    onSaved: (newVal) {}),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Text('Select date of visit',
                            style: TextStyle(
                                fontSize: 14,
                                // color: PRIMARY_COLOR,
                                fontWeight: FontWeight.bold))),
                    Text(date,
                        style: TextStyle(fontSize: 13, color: dateColor)),
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
                  ],
                ),
              ),

              SizedBox(height: 40),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 10,
                  thickness: 2,
                )),
                Text(
                  Constants.info,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey,
                  indent: 10,
                  endIndent: 20,
                  thickness: 2,
                )),
              ]),

              SizedBox(height: 20),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Tanent:",
                            style: textStyleTextStyle(context, PRIMARY_COLOR),
                          ),
                          SizedBox(height: 10),
                          Text("Address:",
                              style:
                                  textStyleTextStyle(context, PRIMARY_COLOR)),
                          SizedBox(height: 10),
                          Text("Phone:",
                              style:
                                  textStyleTextStyle(context, PRIMARY_COLOR)),
                          SizedBox(height: 10),
                          Text("Email:",
                              style: textStyleTextStyle(
                                context,
                                PRIMARY_COLOR,
                              )),
                        ],
                      ),
                    ),
                    Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          SizedBox(height: 10),
                          Text(
                            widget.profile['name'] ?? "",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.profile['address'] ?? "did not provide",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.profile['mobile'] ?? "did not provide",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.profile['email'] ?? "did not provide",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ]))
                  ]),
              // Spacer(),
              SizedBox(
                height: 50,
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
                            requestFunc();
                          }
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
      ),
    );
  }

  // Widget maintenanceWidget(context){
  selectDate(
    BuildContext context,
  ) async {
    DateTime? selectDate;
    await DatePicker.showDatePicker(context,
        showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
      selectDate = date;
    }, currentTime: DateTime.now());
    if (selectDate != null) {
      setState(() {
        date = DateFormat('yyyy/MM/dd').format(selectDate!);
      });
    }
  }

  showDialogForProperty() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            titlePadding: EdgeInsets.zero,
            title: titleForDialog(context, 'Select Property'),
            content: Container(
              height: 420,
              width: 350,
              child: FutureBuilder(
                  future: propertyUnits(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child:
                              CircularProgressIndicator()); // Show a loading indicator
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Container(
                          width: 350,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount:
                                  propertyUnit.length, //photoList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Column(
                                    children: [
                                      Text(
                                        propertyUnit[index]['address ']
                                            .toString(),
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    propertyTitle.text = propertyUnit[index]
                                            ['address ']
                                        .toString();
                                    propertyId =
                                        propertyUnit[index]['id'].toString();
                                    print(
                                        "i am current ID  ${propertyId.toString()}");
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
}
