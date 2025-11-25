// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors, deprecated_member_use
import 'dart:convert';
// ignore: library_prefixes
import 'dart:io' as Io;

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

import '../../button.dart';
import '../../components/app_bar.dart';
import '../../components/color.dart';
import '../../components/global.dart';
import '../../components/string.dart';
import '../../components/text_field.dart';


class MyInfo extends StatefulWidget {
  MyInfo(this.profile, {Key? key}) : super(key: key);
  var profile;

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  String? dateOfBirth;
  //PickedFile? imageFile;
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController govtId = TextEditingController();
  var useerID;
  bool isLoading = false;

  void initState() {
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    widget.profile['name'] == null ? "" : name.text = widget.profile['name'];
    widget.profile['address'] == null ? "" : address.text = widget.profile['address'];
    widget.profile['mobile'] == null ? "" : phone.text = widget.profile['mobile'];
    widget.profile['email'] == null ? "" : email.text = widget.profile['email'];
    widget.profile['gender'] == null ? "" : gender.text = widget.profile['gender'];
    widget.profile['dob'] == null ? "" : dateOfBirth = widget.profile['dob'];
    super.initState();
  }

  updateInfo() async {
    setState(() {
      isLoading = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://admin.purplehats.com/api/users/update'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
      "name": name.text,
      "email": email.text,
      "mobile": phone.text,
      "gender": gender.text,
      "dob": dateOfBirth.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['message'];
      print("message == ${message}");
      Fluttertoast.showToast(
        msg: message.toString(),
      );
      setState(() {
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: buildNavigationBar(context, "My Info"),
      body: infoWidget(context),
    );
  }

  Widget infoWidget(context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => openGallery()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: WHITE_COLOR,
                          child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(
                                            Constants.profile_IMGG,
                                          ),),
                              // imageFile == null
                              //     ? AssetImage(
                              //         Constants.profile_IMGG,
                              //       )
                              //     : FileImage(File(imageFile!.path)) as ImageProvider),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(2, 4),
                                  color: Colors.black.withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 3,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(Icons.edit, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 10),
            // Container(
            //     margin: EdgeInsets.symmetric(horizontal: 20),
            //     child: Text(
            //       Constants.my_info,
            //       style: headingTextStyle(
            //         context,
            //         PRIMARY_COLOR,
            //       ),
            //     )),
            SizedBox(height: 10),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Name",
                  style: headingTextStyle(
                    context,
                    PRIMARY_COLOR,
                  ),
                )),
            SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    textController: name,
                    readOnly: false,
                    hintText: Constants.name,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Address",
                  style: headingTextStyle(
                    context,
                    PRIMARY_COLOR,
                  ),
                )),
            SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    textController: address,
                    readOnly: false,
                    hintText: Constants.address,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Mobile",
                  style: headingTextStyle(
                    context,
                    PRIMARY_COLOR,
                  ),
                )),
            SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    textController: phone,
                    readOnly: false,
                    hintText: Constants.phone,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Email",
                  style: headingTextStyle(
                    context,
                    PRIMARY_COLOR,
                  ),
                )),
            SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    textController: email,
                    readOnly: false,
                    hintText: Constants.email,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(
                    Constants.Dob,
                    style: headingTextStyle(
                      context,
                      PRIMARY_COLOR,
                    ),
                  ),
                ),
                Text(
                  dateOfBirth.toString(),
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
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Constants.gender,
                  style: headingTextStyle(
                    context,
                    PRIMARY_COLOR,
                  ),
                )),
            SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    textController: gender,
                    readOnly: false,
                    hintText: "Gender",
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Constants.gov_ID,
                  style: headingTextStyle(
                    context,
                    PRIMARY_COLOR,
                  ),
                )),
            SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                    textController: govtId,
                    readOnly: false,
                    hintText: Constants.Id_no,
                    hintStyle: hintTextStyle(context, INPUT_FIELD_TEXT_COLOR)
                    // validator: FormValidator.titleValidator
                    )),
            //Spacer() ,
            SizedBox(height: 40),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.fromLTRB(40, 30, 40, 120),
                    child: shadowButton(
                      Constants.upload_info,
                      60,
                      PRIMARY_COLOR,
                      () {
                        updateInfo();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => InternalTransfer()),
                        // );
                      },
                      double.infinity,
                      PRIMARY_COLOR.withOpacity(0.20),
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
        dateOfBirth = DateFormat('dd/MM/yyyy').format(selectDate!);
      });
    }
  }

  Widget openGallery() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            "Chose profile photo",
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  // takePhoto(
                  //   ImageSource.camera,
                  // );
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text("Camera "),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.camera_alt),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                 // takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text("Gallery "),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.image),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: source,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = pickedFile;
  //       final bytes = Io.File(imageFile!.path).readAsBytesSync();

  //       String img64 = base64Encode(bytes);
  //       print(img64.substring(0, 100));
  //     });
  //   }
  // }
}
