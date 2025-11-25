import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/tanent_home_screen/all_facilities_Screen.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/tanent_home_screen/facilities_details.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../controller/logout_controller.dart';
import '../../../../../themes/app_colors.dart';
import '../../../../../utils/constant.dart';
import '../../../request_maintenance.dart';

class TanentHomeScreen extends StatefulWidget {
  const TanentHomeScreen({key});

  @override
  State<TanentHomeScreen> createState() => _TanentHomeScreenState();
}

class _TanentHomeScreenState extends State<TanentHomeScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  var services = [];
  bool isLoading = true;

  final imageList = [
    'assets/images/home_screen/Rectangle 117 (1).png',
    'assets/images/home_screen/Rectangle 117 (2).png',
    'assets/images/home_screen/Rectangle 117 (3).png',
  ];
  final List titleList = [
    'Carpenter',
    'Clean Sweeper',
    'Electrician',
  ];
  bool value = true;

  var useerID;
  bool isProfileUpload = true;
  bool adsLoad = true;
  SharedPreferences? preferences;
  var profileData;
  var adsData = [];
  final signoutt = Get.put(SignOutSeekerController());

  getServices() async {
    var request = http.Request('GET',
        Uri.parse('https://admin.purplehats.com/api/service/facilities'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      services = body['data'];
      print(" ggg == ${services}");
      setState(() {
        services;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.reasonPhrase);
    }
  }

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
      print("userNames ==${userName}");
      userName = profileData['name'];
      setState(() {
        userName;
        isProfileUpload = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isProfileUpload = false;
      });
    }
  }

  getAds() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('https://admin.purplehats.com/api/advertisement'));
    request.body = json.encode({
      "login_session_id": 481
      //useerID.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      adsData = body['message'];
      print("adsData data is ==${adsData}");

      setState(() {
        adsLoad = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        adsLoad = false;
      });
    }
  }

  @override
  void initState() {
    getAds();
    getServices();
    print("init work");
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    getProfile();
    super.initState();
  }

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
                Container(
                    height: 150,
                    child: CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount: adsData.length,
                      options: CarouselOptions(
                        aspectRatio:
                            16 / 9, // Fixed: Changed from 0.8 to double value
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          // Update the current page index when the page changes
                          setState(() {
                            _currentPage = index;
                          });
                        },
                      ),
                    itemBuilder: (ctx, index, realIdx) {
                      return SizedBox(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(adsData[index]['image']),
                                  //  opacity: 0.6,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: double.infinity,
                            ),
                          ],
                        ),
                      );
                    },
                  )),
              DotsIndicator(
                dotsCount: adsData.length,
                position:
                    _currentPage.toDouble(), // Fixed: Convert int to double
                decorator: const DotsDecorator(
                  color: Color(0xffD4D4D6), // Inactive color
                  activeColor: AppColors.mainColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    const ReusableText(
                      title: 'Facilities',
                      size: 16,
                      weight: FontWeight.w700,
                      color: Color(0xff343434),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllFacilitiesScreen(
                                        facilities: services,
                                      )));
                        },
                        child: const ReusableText(
                          title: 'See All',
                          size: 10,
                          weight: FontWeight.w500,
                          color: AppColors.mainColor,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: services.length > 5 ? 5 : services.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FacilitiesDetails(
                                  serivesDetails: services[i])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.22,
                        // margin: const EdgeInsets.only(right: 15),
                        // padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                // Add a shadow to the left (negative X offset)
                                blurRadius: 4,
                                // Adjust the blur radius as needed
                                color:
                                    Color(0x40252525), // 25% black shadow color
                              ),
                              BoxShadow(
                                offset: Offset(0, 4),
                                // Add a shadow to the bottom (positive Y offset)
                                blurRadius: 4,
                                // Adjust the blur radius as needed
                                color:
                                    Color(0x40252525), // 25% black shadow color
                              ),
                            ]),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 9,
                            ),
                            Image.network(
                              services[i]['image'],
                              fit: BoxFit.fill,
                              height: 33,
                              width: 30,
                            ),
                            const Expanded(
                              child: SizedBox(
                                height: 1,
                              ),
                            ),
                            ReusableText(
                              title: services[i]['name'],
                              size: 10,
                              weight: FontWeight.w600,
                              color: const Color(0xff243137),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.sizeOf(context).width * 0.80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(31)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        thickness: 3,
                        height: 3,
                        color: Color(0xffF5F4F8),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ReusableText(
                        title: 'Announcements',
                        size: 16,
                        weight: FontWeight.w700,
                        color: Color(0xff343434),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Center(
                              child: const Image(
                                  image: AssetImage(
                                      "assets/images/home_screen/Rec.png"))),
                          Positioned(
                              top: 40,
                              bottom: 20,
                              right: MediaQuery.sizeOf(context).width * 0.30,
                              left: MediaQuery.sizeOf(context).width * 0.30,
                              child: Center(
                                child: ReusableText(
                                    title: 'No announcement for today',
                                    size: 13,
                                    weight: FontWeight.w400,
                                    color: Color(0xff243137)),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: DotsIndicator(
                          dotsCount: 1,
                          position: 0.0, // Fixed: Added double value
                          decorator: const DotsDecorator(
                            color: Color(0xffD4D4D6), // Inactive color
                            activeColor: AppColors.mainColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 3,
                        height: 3,
                        color: Color(0xffF5F4F8),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ReusableText(
                  title: 'Quick Access',
                  size: 16,
                  weight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 111,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          border: Border.all(color: const Color(0xff593D77)),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color:
                                  Color(0x40252525), // 25% black shadow color
                            ),
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color:
                                  Color(0x40252525), // 25% black shadow color
                            ),
                          ]),
                      child: const Column(
                        children: [
                          Image(
                            height: 65,
                            image: AssetImage(
                                'assets/images/home_screen/image 15.png'),
                          ),
                          ReusableText(
                            title: 'Bill Payments',
                            size: 12,
                            weight: FontWeight.w500,
                            color: Color(0xff593D77),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RequestMaintenance(profileData)),
                        );
                      },
                      child: Container(
                        height: 111,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                // Add a shadow to the left (negative X offset)
                                blurRadius: 4,
                                // Adjust the blur radius as needed
                                color:
                                    Color(0x40252525), // 25% black shadow color
                              ),
                              BoxShadow(
                                offset: Offset(0, 4),
                                // Add a shadow to the bottom (positive Y offset)
                                blurRadius: 4,
                                // Adjust the blur radius as needed
                                color:
                                    Color(0x40252525), // 25% black shadow color
                              ),
                            ],
                            color: const Color(0xffFFFFFF),
                            border: Border.all(color: const Color(0xff593D77)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Column(
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/home_screen/image-removebg-preview (13) 1.png'),
                            ),
                            ReusableText(
                              title: 'Maintenance Services',
                              size: 12,
                              weight: FontWeight.w500,
                              color: Color(0xff593D77),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
  }
}
