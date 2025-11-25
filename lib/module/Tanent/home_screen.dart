// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, missing_required_param, missing_return

import 'dart:convert';

// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:firebase_messaging/firebase_mess aging.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:purpleheatsdev/components/color.dart';
import 'package:purpleheatsdev/components/global.dart';

import 'package:purpleheatsdev/components/string.dart';
import 'package:purpleheatsdev/module/Tanent/rent_payment.dart';
import 'package:purpleheatsdev/module/Tanent/request_maintenance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/logout_controller.dart';
import '../sign_in.dart';
import 'new_design/navigation_bar.dart';

final List<String> imgList = [
  'assets/svgs/scrolOne.jpg',
  'assets/svgs/scrolOne.jpg',
];
final List<String> name = [
  'Make\n Payment',
  'Request\n Maintenance',
];

class TanentHomeScreen extends StatefulWidget {
  @override
  _TanentScreenState createState() => _TanentScreenState();
}

class _TanentScreenState extends State<TanentHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool value = true;
  int current = 0;
  var useerID;
  bool isProfileUpload = true;
  SharedPreferences? preferences;
  var profileData;
  final signoutt = Get.put(SignOutSeekerController());

  getProfile() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET',
        Uri.parse('https://admin.purplehats.com/api/tenant/get-profile'));
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
        isProfileUpload = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isProfileUpload = false;
      });
    }
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    getProfile();

    //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //     String? title = message.notification!.title;
    //     String? body = message.notification!.body;

    //     AwesomeNotifications().createNotification(
    //         content: NotificationContent(
    //       id: 123,
    //       channelKey: "Purple hats",
    //       color: Colors.white,
    //       title: title,
    //       body: body,
    //       wakeUpScreen: true,
    //       fullScreenIntent: true,
    //       category: NotificationCategory.Message,
    //       autoDismissible: true,
    //       backgroundColor: Colors.orange,
    //     ));
    //   });
    //   super.initState();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: WHITE_COLOR,
          iconTheme: IconThemeData(
            color: PRIMARY_COLOR, //change your color here
          ),
          title: Text("Home", style: TextStyle(color: PRIMARY_COLOR)),
        ),
        drawer: drawer(),
        //DrawerProfile(),
        body: isProfileUpload
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 2),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hello",
                                    style: boldTextStyle(
                                        context, PURPLE_COLOR, 28)),
                                SizedBox(height: 2),
                                Text(
                                    profileData == null
                                        ? ""
                                        : profileData['name'],
                                    style: boldTextStyle(
                                        context, PRIMARY_COLOR, 28)),
                                SizedBox(height: 2),
                                Text("Good Morning",
                                    style: hintTextStyle(context, GREY)),
                              ],
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => TenentProfile(profileData)),
                              // );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: WHITE_COLOR,
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage: AssetImage(
                                        Constants.profile_IMGG,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 1,
                                  right: 20,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child:
                                          Icon(Icons.edit, color: Colors.black),
                                    ),
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
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        // height: ,
                        child: CarouselSlider.builder(
                      itemCount: imgList.length,
                      options: CarouselOptions(
                        aspectRatio: 0.8,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                      ),
                      itemBuilder: (ctx, index, realIdx) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => Nvigatiobar()),
                              // );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RentPayment()),
                              );
                            }
                            if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RequestMaintenance(profileData)),
                              );
                            }
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: index == 0
                                      ? LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            //Color(0xffF2441C),
                                            Colors.blue,
                                            Color(0xffF2441C),
                                            Color(0xffF2441C),
                                            RED_COLOR,
                                          ],
                                        )
                                      : LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            //Color(0xffF2441C),

                                            Colors.greenAccent,
                                            Color(0xff0BAC1C),
                                            Color(0xff0BAC1C),
                                          ],
                                        ),

                                  // color: RED_COLOR,
                                  image: DecorationImage(
                                    image: AssetImage(imgList[index]),
                                    opacity: 0.6,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: Get.width,
                              ),
                              Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, bottom: 45),
                                        child: Text(
                                          name[index],
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                      ))),
                            ],
                          ),
                        );
                      },
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    //Spacer(),
                  ],
                ),
              ));
  }

  Drawer drawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple[700],
                // Theme.of(context).primaryColor
              ),
              accountName: Text(
                profileData == null ? "" : profileData['name'],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                profileData == null
                    ? ""
                    : "${profileData['email']}\n (${profileData['type']})",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          )),
          buttonWidget(),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget buttonWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ButtonTheme(
        height: 47,
        minWidth: MediaQuery.of(context).size.width,
        child: MaterialButton(
          color: Colors.purple[700],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () async {
            preferences?.setBool('isLoggedIn', false);
            useerID = GetStorage().remove("user_id");
            signoutt.signOutSeekeer(useerID);
            Get.offAll(SignIN());
          },
          child: const Text(
            'Logout',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
