import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/reusable_text/reusable_text.dart';
import '../../../themes/app_colors.dart';
import '../../controller/check_in_controller.dart';
import '../../controller/logout_controller.dart';
import 'package:http/http.dart' as http;

import '../../utils/constant.dart';
import '../sign_in.dart';
import 'location.dart';
import 'my_info.dart';
class SideMenu extends StatefulWidget {
  const SideMenu({key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  bool _isPayment=false;
  bool _isSetting=false;
  final signoutt = Get.put(SignOutSeekerController());
  final checkinCont = Get.put(CheckInController());
  bool value = true;
  int current = 0;
  var checkInId;
  var checkInStatus;
  var useerID;
  bool isProfileUpload = true;

  var profileData;

  SharedPreferences? preferences;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    getProfile();

    super.initState();
  }
  getProfile() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/agent/get-profile'));
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

  checkOut() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('Put', Uri.parse(BaseURL + '/agent/check-out'));
    request.body = json.encode({
      "login_session_id": useerID,
      "location": {
        "longitude": UserLocation.long,
        "latitude": UserLocation.lat,
      },
      "check_in_session_id": checkInId.toString()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      var message = body['message'];
      checkInStatus = body['data']['check_in_session']['status'];
      print("checkInId == ${checkInId.toString()}");
      setState(() {
        checkInStatus;
      });
      Fluttertoast.showToast(
        msg: message.toString(),
      );
    }
    if (response.statusCode == 401) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      var message = body['message'];
      Fluttertoast.showToast(
        msg: message.toString(),
      );
    } else {
      print(response.reasonPhrase);
    }
  }

  checkIn() async {
    print("funcion start");
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(BaseURL + '/agent/check-in'));
    request.body = json.encode({
      "login_session_id": useerID,
      "location": {
        "longitude": UserLocation.long,
        "latitude": UserLocation.lat,
      },
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['message'];
      print("message == ${message}");
      checkInId = body['data']['check_in_session']['id'] ?? "";
      print("checkInId == ${checkInId.toString()}");
      checkInStatus = body['data']['check_in_session']['status'];
      setState(() {
        checkInStatus;
      });
      print(checkInStatus);
      Fluttertoast.showToast(
        msg: message.toString(),
      );
      Fluttertoast.showToast(
        msg: checkInId.toString(),
      );
    } else {
      print(response.reasonPhrase);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child:isProfileUpload?Center(child: CircularProgressIndicator()):
         ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center
                ,children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.80,
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffFFFFFF),
                            border: Border.all(color: const Color(0xff959595),width: 3)


                        ),
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 53,
                                  color: AppColors.mainColor,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      Container
                                        (
                                        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: const Center(
                                          child: Image(image: AssetImage("assets/images/backgroundimage.png"),),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 20,left: 10,
                                  child: Container(
                                    height: 65,width: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: const Color(0xffD9D9D9)
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Color(0xffD9D9D9),
                                      backgroundImage: AssetImage("assets/icons/drawer/image 1.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                             Padding(
                              padding: EdgeInsets.only(left: 90),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableText(title: profileData == null ? "" : profileData['name'].toString(),size: 10,weight: FontWeight.w500,color: Color(0xff000000),),
                                      ReusableText(title: profileData == null ? "" : profileData['type'].toString(),size: 7,weight: FontWeight.w500,color: Color(0xff60467E),),

                                    ],
                                  ),
                                  Spacer(),
                                  Image(image: AssetImage("assets/icons/drawer/image 2.png"))
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(title: 'ID No.',size: 5,weight: FontWeight.w500,color: Color(0xff555555),),
                                    ReusableText(title: '189202684973',size: 7,weight: FontWeight.w500,color: Color(0xff000000),),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(title: 'Joined Date',size: 5,weight: FontWeight.w500,color: Color(0xff555555),),
                                    ReusableText(title: '03/04/2023',size: 7,weight: FontWeight.w500,color: Color(0xff000000),),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(title: 'Phone No.',size: 5,weight: FontWeight.w500,color: Color(0xff555555),),
                                    ReusableText(title: '+92 331 89 47 568',size: 7,weight: FontWeight.w500,color: Color(0xff000000),),

                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(title: 'DOB',size: 5,weight: FontWeight.w500,color: Color(0xff555555),),
                                    ReusableText(title: '03/04/2023',size: 7,weight: FontWeight.w500,color: Color(0xff000000),),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(title: 'Blood Group',size: 5,weight: FontWeight.w500,color: Color(0xff555555),),
                                    ReusableText(title: 'O+',size: 7,weight: FontWeight.w500,color: Color(0xff000000),),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(title: 'Emergency Phone No.',size: 5,weight: FontWeight.w500,color: Color(0xff555555),),
                                    ReusableText(title: '+92 331 89 47 568',size: 7,weight: FontWeight.w500,color: Color(0xff000000),),

                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.80,
                        child: Row(
                          children: [
                            Expanded(

                              child: GestureDetector(
                                onTap: (){
                                  checkInStatus == "check_in" ? Fluttertoast.showToast(msg: "Already check In") : checkIn();
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width*0.39,
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12,),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffDBE2D7),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: ReusableText(
                                      title: 'Check In',size:14 ,weight:FontWeight.w700 ,color: Color(0xff3D775B),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(

                              child: GestureDetector(
                                onTap: (){
                                  checkOut();
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width*0.39,
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12,),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE4D8D8),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: ReusableText(
                                      title: 'Check Out',size:14 ,weight:FontWeight.w700 ,color: Color(0xff773D3D),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height*0.70,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10))
              ),

              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyInfo(
                              profileData,
                            )),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,children: [
                        Icon(Icons.person_outline_sharp,color: Color(0xffA196CB),),
                        SizedBox(width: 20,),
                        ReusableText(title: 'My Profile',size: 18,weight: FontWeight.w500,color: Color(0xff000000),),

                      ],
                      ),
                    ),
                  ),
                  const Divider(thickness: 2,height: 2,color: Color(0xf40A196CB),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,children: [
                          SvgPicture.asset("assets/icons/drawer/Vector (3).svg",color: const Color(0xffA196CB),),
                          const SizedBox(width: 20,),
                          const ReusableText(title: 'Payments',size: 18,weight: FontWeight.w500,color: Color(0xff000000),),
                          const Spacer(),
                          GestureDetector(
                              onTap: (){

                                setState(() {
                                  _isPayment=!_isPayment;
                                });
                              },
                              child

                                  : const Icon(Icons.arrow_drop_down,color: Color(0xff60467E),))
                        ],
                        ),
                        const SizedBox(height: 10,),
                        Visibility(
                            visible: _isPayment,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 46,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ReusableText(title: 'Pay Slips',size: 18,weight: FontWeight.w500,color: Color(0xf60000000),),
                                    SizedBox(height: 10,),
                                    ReusableText(title: 'Payment Setup',size: 18,weight: FontWeight.w500,color: Color(0xf60000000),),
                                  ],),
                              ],
                            ))
                      ],
                    ),
                  ),

                  const Divider(thickness: 2,height: 2,color: Color(0xf40A196CB),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,children: [
                          const Icon(Icons.settings_rounded,color: Color(0xffA196CB),),
                          const SizedBox(width: 20,),
                          const ReusableText(title: 'Setting',size: 18,weight: FontWeight.w500,color: Color(0xff000000),),
                          const Spacer(),
                          GestureDetector(
                              onTap: (){

                                setState(() {
                                  _isSetting=!_isSetting;
                                });
                              },
                              child: const Icon(Icons.arrow_drop_down,color: Color(0xff60467E),))
                        ],
                        ),
                        const SizedBox(height: 10,),
                        Visibility(
                            visible: _isSetting,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 46,),
                                ReusableText(title: 'Language',size: 18,weight: FontWeight.w500,color: Color(0xf60000000),),

                                Spacer(),
                                ReusableText(title: 'ENG',size: 18,weight: FontWeight.w500,color:AppColors.mainColor,),

                                SizedBox(width: 10,),
                                Icon(Icons.arrow_drop_down,color: AppColors.mainColor,)

                              ],
                            ))
                      ],
                    ),
                  ),

                  const Divider(thickness: 2,height: 2,color: Color(0xf40A196CB),),
                  GestureDetector(
                    onTap: (){
                      preferences?.setBool('isLoggedIn', false);
                      useerID = GetStorage().remove("user_id");
                      signoutt.signOutSeekeer(useerID);
                      Get.offAll(SignIN());
                    },

                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,children: [
                        Icon(Icons.logout,color: Color(0xffA196CB)),
                        SizedBox(width: 20,),
                        ReusableText(title: 'Logout',size: 18,weight: FontWeight.w500,color: Color(0xff000000),),

                      ],
                      ),
                    ),
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
