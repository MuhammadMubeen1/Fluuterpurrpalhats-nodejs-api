// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, use_key_in_widget_constructors

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, sized_box_for_whitespace, avoid_unnecessary_containers, use_key_in_widget_constructors
import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'; // import'package:flutter/src/material/date_picker_theme.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';

import 'package:intl/intl.dart';
import 'package:purpleheatsdev/button.dart';
import 'package:purpleheatsdev/components/color.dart';
import 'package:purpleheatsdev/components/global.dart';
import 'package:purpleheatsdev/components/string.dart';
import 'package:purpleheatsdev/components/text_field.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/logout_controller.dart';
import 'internal_transfer.dart';
import 'package:http/http.dart' as http;

class TenentProfile extends StatefulWidget {
  TenentProfile({Key? key}) : super(key: key);

  @override
  State<TenentProfile> createState() => _TenentProfileState();
}

class _TenentProfileState extends State<TenentProfile> {
  String? dateOfBirth;
  //PickedFile? imageFile;
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController govtId = TextEditingController();
  SharedPreferences? preferences;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    useerID = GetStorage().read('user_id');

    getProfile();

    super.initState();
  }

  var profileData;
  final signoutt = Get.put(SignOutSeekerController());
  var useerID;
  bool isProfileUpload = true;
  getProfile() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/tenant/get-profile'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      profileData = body['data']['profile'];

      print("profile data is ==${profileData}");
      setState(() {
        profileData;
        isProfileUpload = false;
        profileData['name'] == null ? "" : name.text = profileData['name'];
        profileData['address'] == null ? "" : address.text = profileData['address'];
        profileData['mobile'] == null ? "" : phone.text = profileData['mobile'];
        profileData['email'] == null ? "" : email.text = profileData['email'];
        profileData['gender'] == null ? "" : gender.text = profileData['gender'];

        profileData['dob'] == null ? "" : dateOfBirth = profileData['dob'];
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isProfileUpload = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      //  appBar: buildNavigationBar(context, "My Info"),
      body: infoWidget(context),
    );
  }

  Widget infoWidget(context) {
    return isProfileUpload
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
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
                                    backgroundImage:
                                    AssetImage(
                                            Constants.profile_IMGG,
                                          ),)
                                    //  imageFile == null
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
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 30, 40, 120),
                      child: shadowButton(
                        Constants.upload_info,
                        60,
                        PRIMARY_COLOR,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InternalTransfer()),
                          );
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
