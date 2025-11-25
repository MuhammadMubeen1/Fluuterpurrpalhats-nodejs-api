// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, depend_on_referenced_packages, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, missing_required_param, missing_return, avoid_print, prefer_typing_uninitialized_variables, library_prefixes, unused_local_variable, no_leading_underscores_for_local_identifiers
//
// import 'dart:convert';
//
// import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:location/location.dart' as Location;
// import 'package:property_managment/button.dart';
// import 'package:property_managment/components/color.dart';
// import 'package:property_managment/components/global.dart';
// import 'package:property_managment/components/string.dart';
// import 'package:property_managment/controller/check_in_controller.dart';
// import 'package:property_managment/controller/logout_controller.dart';
// import 'package:property_managment/module/Worker/location.dart';
// import 'package:property_managment/module/sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../utils/constant.dart';
// import 'leave_request.dart';
// import 'my_info.dart';
// import 'my_task.dart';
//
// final List<String> imgList = [Constants.frame_IMGG, Constants.frame_IMGG, Constants.frame_IMGG];
//
// class AgentScreen extends StatefulWidget {
//   @override
//   _AgentScreenState createState() => _AgentScreenState();
// }
//
// class _AgentScreenState extends State<AgentScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final signoutt = Get.put(SignOutSeekerController());
//   final checkinCont = Get.put(CheckInController());
//   bool value = true;
//   int current = 0;
//   var checkInId;
//   var checkInStatus;
//   var useerID;
//   bool isProfileUpload = true;
//
//   final List<String> imgList = [
//     'assets/svgs/scrolOne.jpg',
//     'assets/svgs/scrolOne.jpg',
//   ];
//   final List<String> name = [
//     'My\n Tasks',
//     'Leave\n Request',
//   ];
//   var profileData;
//
//   SharedPreferences? preferences;
//
//   getProfile() async {
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/agent/get-profile'));
//     request.body = json.encode({
//       "login_session_id": useerID.toString(),
//     });
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       // print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//
//       profileData = body['data']['profile'];
//       print("profile data is ==${profileData}");
//       setState(() {
//         isProfileUpload = false;
//       });
//     } else {
//       print(response.reasonPhrase);
//       setState(() {
//         isProfileUpload = false;
//       });
//     }
//   }
//
//   checkOut() async {
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request('Put', Uri.parse(BaseURL + '/agent/check-out'));
//     request.body = json.encode({
//       "login_session_id": useerID,
//       "location": {
//         "longitude": UserLocation.long,
//         "latitude": UserLocation.lat,
//       },
//       "check_in_session_id": checkInId.toString()
//     });
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       // print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//
//       var message = body['message'];
//       checkInStatus = body['data']['check_in_session']['status'];
//       print("checkInId == ${checkInId.toString()}");
//       setState(() {
//         checkInStatus;
//       });
//       Fluttertoast.showToast(
//         msg: message.toString(),
//       );
//     }
//     if (response.statusCode == 401) {
//       // print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//
//       var message = body['message'];
//       Fluttertoast.showToast(
//         msg: message.toString(),
//       );
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   checkIn() async {
//     print("funcion start");
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request('POST', Uri.parse(BaseURL + '/agent/check-in'));
//     request.body = json.encode({
//       "login_session_id": useerID,
//       "location": {
//         "longitude": UserLocation.long,
//         "latitude": UserLocation.lat,
//       },
//     });
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 201) {
//       // print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//       var message = body['message'];
//       print("message == ${message}");
//       checkInId = body['data']['check_in_session']['id'] ?? "";
//       print("checkInId == ${checkInId.toString()}");
//       checkInStatus = body['data']['check_in_session']['status'];
//       setState(() {
//         checkInStatus;
//       });
//       print(checkInStatus);
//       Fluttertoast.showToast(
//         msg: message.toString(),
//       );
//       Fluttertoast.showToast(
//         msg: checkInId.toString(),
//       );
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   @override
//   void initState() {
//     SharedPreferences.getInstance().then((value) {
//       preferences = value;
//       setState(() {});
//     });
//     useerID = GetStorage().read('user_id');
//     print("userTypeID,,userTypeID.......$useerID");
//     getProfile();
//     locationService();
//     super.initState();
//   }
//
//   // checkInJson() {
//   //   var jsonUpdated;
//   //   jsonUpdated = {
//   //     "login_session_id": useerID,
//   //     "location": {
//   //       "longitude": UserLocation.long,
//   //       "latitude": UserLocation.lat,
//   //     },
//   //   };
//   //   print("json updated....................>>$jsonUpdated");
//   //   print("check in ==....................>>$jsonUpdated");
//   //   checkinCont.checkinAgent(jsonUpdated);
//   // }
//
//   Future<void> locationService() async {
//     Location.Location location = Location.Location();
//
//     bool _serviceEnabled;
//     Location.PermissionStatus _permissionLocation;
//     Location.LocationData _locData;
//
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//
//     _permissionLocation = await location.hasPermission();
//     if (_permissionLocation == Location.PermissionStatus.denied) {
//       _permissionLocation = await location.requestPermission();
//       if (_permissionLocation != Location.PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     _locData = await location.getLocation();
//
//     //  setState(() {
//     UserLocation.lat = _locData.latitude!;
//     print("userLocation...............${UserLocation.lat}");
//     UserLocation.long = _locData.longitude!;
//     print(" UserLocation.long  ...............${UserLocation.long}");
//     //  });
//     return getLocation();
//   }
//
//   Future<void> getLocation() async {
//     List<Placemark> placemark = await placemarkFromCoordinates(UserLocation.lat, UserLocation.long);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: WHITE_COLOR,
//         key: _scaffoldKey,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: WHITE_COLOR,
//           iconTheme: IconThemeData(
//             color: PRIMARY_COLOR, //change your color here
//           ),
//           title: Text("Home", style: TextStyle(color: PRIMARY_COLOR)),
//         ),
//         drawer: drawer(),
//         //DrawerProfile(),
//         body: isProfileUpload
//             ? Center(child: CircularProgressIndicator())
//             : SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // SizedBox(height: 20),
//                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 15),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Hello", style: boldTextStyle(context, PURPLE_COLOR, 28)),
//                             SizedBox(height: 2),
//                             Text(profileData == null ? "" : profileData['name'] ?? "",
//                                 style: boldTextStyle(context, PRIMARY_COLOR, 28)),
//                             SizedBox(height: 2),
//                             Text("Good Morning", style: hintTextStyle(context, GREY)),
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MyInfo(
//                                       profileData,
//                                     )),
//                           );
//                         },
//                         child: Stack(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(right: 20),
//                               child: CircleAvatar(
//                                 radius: 50,
//                                 backgroundColor: WHITE_COLOR,
//                                 child: CircleAvatar(
//                                   radius: 50,
//                                   backgroundImage: AssetImage(
//                                     Constants.profile_IMGG,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 1,
//                               right: 20,
//                               child: Container(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: Icon(Icons.edit, color: Colors.black),
//                                 ),
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                       width: 3,
//                                       color: Colors.white,
//                                     ),
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(50),
//                                     ),
//                                     color: Colors.white,
//                                     boxShadow: [
//                                       BoxShadow(
//                                         offset: Offset(2, 4),
//                                         color: Colors.black.withOpacity(
//                                           0.3,
//                                         ),
//                                         blurRadius: 3,
//                                       ),
//                                     ]),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ]),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Container(
//                         // height: ,
//                         child: CarouselSlider.builder(
//                       itemCount: imgList.length,
//                       options: CarouselOptions(
//                         aspectRatio: 0.8,
//                         enlargeCenterPage: true,
//                         scrollDirection: Axis.horizontal,
//                         autoPlay: true,
//                       ),
//                       itemBuilder: (ctx, index, realIdx) {
//                         return GestureDetector(
//                           onTap: () {
//                             if (index == 0) {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => MyTask()),
//                               );
//                             }
//                             if (index == 1) {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => LeaveRequest()),
//                               );
//                             }
//                           },
//                           child: Stack(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   gradient: index == 0
//                                       ? LinearGradient(
//                                           begin: Alignment.topRight,
//                                           end: Alignment.bottomLeft,
//                                           colors: [
//                                             //Color(0xffF2441C),
//                                             Colors.blue,
//                                             Color(0xffF2441C),
//                                             Color(0xffF2441C),
//                                             RED_COLOR,
//                                           ],
//                                         )
//                                       : LinearGradient(
//                                           begin: Alignment.topRight,
//                                           end: Alignment.bottomLeft,
//                                           colors: [
//                                             //Color(0xffF2441C),
//
//                                             Colors.greenAccent,
//                                             Color(0xff0BAC1C),
//                                             Color(0xff0BAC1C),
//                                           ],
//                                         ),
//
//                                   // color: RED_COLOR,
//                                   image: DecorationImage(
//                                     image: AssetImage(imgList[index]),
//                                     opacity: 0.6,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 width: Get.width,
//                               ),
//                               Positioned.fill(
//                                   child: Align(
//                                       alignment: Alignment.bottomLeft,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(left: 5, bottom: 45),
//                                         child: Text(
//                                           name[index],
//                                           style: TextStyle(fontSize: 24, color: Colors.white),
//                                         ),
//                                       ))),
//                             ],
//                           ),
//                         );
//                       },
//                     )),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
//                         child: buttonRounded(
//                           Constants.checkin,
//                           45,
//                           GREEN_COLOR,
//                           () {
//                             // getProfile();
//                             checkInStatus == "check_in" ? Fluttertoast.showToast(msg: "Already check In") : checkIn();
//                             //checkInJson();
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(builder: (context) => HomePage()),
//                             // );
//                           },
//                           Get.width * 0.30,
//                           GREEN_BUTTON,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
//                         child: buttonRounded(
//                           Constants.checkout,
//                           45,
//                           REJECT_BUTTON,
//                           () {
//                             checkOut();
//                           },
//                           Get.width * 0.30,
//                           REJECT_COLOR,
//                         ),
//                       ),
//                     ]),
//                     // Padding(
//                     //     padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
//                     //     child: shadowButton(
//                     //       Constants.logout,
//                     //       50,
//                     //       PRIMARY_COLOR,
//                     //       () async {
//                     //         await preferences?.setBool('isLoggedIn', false);
//                     //         useerID = GetStorage().remove("user_id");
//                     //         signoutt.signOutSeekeer(useerID);
//                     //         Get.offAll(SignIN());
//                     //       },
//                     //       double.infinity,
//                     //       PRIIMARY_BASIC,
//                     //     )),
//                   ],
//                 ),
//               ));
//   }
//
//   Drawer drawer() {
//     return Drawer(
//       child: Column(
//         children: [
//           UserAccountsDrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.purple[700],
//                 // Theme.of(context).primaryColor
//               ),
//               accountName: Text(
//                 profileData == null ? "" : profileData['name'].toString(),
//                 style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               accountEmail: Text(
//                 profileData == null ? " " : "${profileData['email']} \n (${profileData['type']})",
//                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               )),
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//               child: SingleChildScrollView(
//             child: Column(
//               children: [],
//             ),
//           )),
//           buttonWidget(),
//           const SizedBox(
//             height: 15,
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget buttonWidget() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: ButtonTheme(
//         height: 47,
//         minWidth: MediaQuery.of(context).size.width,
//         child: MaterialButton(
//           color: Colors.purple[700],
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//           onPressed: () async {
//
//             preferences?.setBool('isLoggedIn', false);
//             useerID = GetStorage().remove("user_id");
//             signoutt.signOutSeekeer(useerID);
//             Get.offAll(SignIN());
//           },
//           child: const Text(
//             'Logout',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// final List<Widget> imageSliders = imgList.map((item) {
//   return Container(
//       width: Get.width,
//       child: Image.network(
//         item,
//         fit: BoxFit.fill,
//         color: RED_COLOR,
//       ));
// }).toList();
