import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/tanent_home_screen/tanent_home_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/logout_controller.dart';

import '../../module/Tanent/new_design/invoice/tabsview.dart';
import '../../module/Tanent/new_design/tanent_side/docs/docs_screen.dart';
import '../../module/Tanent/new_design/tanent_side/maintenance_services/maintenance_service_screen.dart';
import '../../module/Tanent/new_design/tanent_side/my services/my_services.dart';
import '../../module/Tanent/new_design/tanent_side/property_screen/property_screen.dart';
import '../../module/Tanent/profile.dart';
import '../../module/sign_in.dart';
import '../../themes/app_colors.dart';
import '../../utils/constant.dart';
import '../reusable_text/reusable_text.dart';
import 'package:http/http.dart' as http;

class BottomNavigationAppBar extends StatefulWidget {
  @override
  _BottomNavigationAppBarState createState() => _BottomNavigationAppBarState();
}

class _BottomNavigationAppBarState extends State<BottomNavigationAppBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
     TanentHomeScreen(),
    const PropertyScreen(),
    const DocsScreen(),
    TenentProfile(),
    //const ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: _currentIndex == 0
              ? IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xff243137),
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                )
              : const SizedBox(),
          title: _currentIndex == 2
              ? const ReusableText(
                  title: 'Documents',
                  size: 18,
                  weight: FontWeight.w700,
                  color: AppColors.mainColor,
                )
              : _currentIndex == 1
                  ? const ReusableText(
                      title: 'My Properties',
                      size: 17,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    )
                  : _currentIndex == 0
                      ? ReusableText(
                          title: 'Welcome ${userName.toUpperCase()}',
                          size: 16,
                          weight: FontWeight.w600,
                          color: const Color(0xff243137),
                        )
                      : _currentIndex == 3
                          ? const ReusableText(
                              title: 'Profile',
                              size: 18,
                              weight: FontWeight.w700,
                              color: Color(0xff593D77),
                            )
                          : const SizedBox(),
          actions: [
            _currentIndex == 1
                ? Row(
                    children: [
                      ReusableText(
                        title: 'All',
                        size: 18,
                        weight: FontWeight.w700,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.mainColor,
                      )
                    ],
                  )
                : _currentIndex == 0
                    ? SvgPicture.asset(
                        'assets/images/home_screen/Group 553.svg',
                        color: const Color(0xff000000),
                      )
                    : const SizedBox(),
          ],
        ),
        drawer: MyDrawer(),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: const Color(0xffF5F4F8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomTab(
                    onTap: () {
                      onTabTapped(0);
                    },
                    indicatorColor: _currentIndex == 0 ? AppColors.mainColor : Colors.transparent,
                    title: 'Home',
                    icon: 'assets/icons/bottomBar/home.svg',
                  ),
                  BottomTab(
                    onTap: () {
                      onTabTapped(1);
                    },
                    indicatorColor: _currentIndex == 1 ? AppColors.mainColor : Colors.transparent,
                    title: 'Property',
                    icon: 'assets/icons/bottomBar/property.svg',
                  ),
                  BottomTab(
                    onTap: () {
                      onTabTapped(2);
                    },
                    indicatorColor: _currentIndex == 2 ? AppColors.mainColor : Colors.transparent,
                    title: 'Docs',
                    icon: 'assets/icons/bottomBar/document.svg',
                  ),
                  BottomTab(
                    onTap: () {
                      onTabTapped(3);
                    },
                    indicatorColor: _currentIndex == 3 ? AppColors.mainColor : Colors.transparent,
                    title: 'Profile',
                    icon: 'assets/icons/bottomBar/profile.svg',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  final String title;
  final Color indicatorColor;
  final String icon;
  final VoidCallback onTap;
  const BottomTab({
    key,
    required this.title,
    required this.indicatorColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(height: 2, width: 70, color: indicatorColor),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 21,
            width: 21,
            child: SvgPicture.asset(
              icon,
              color: AppColors.mainColor,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          ReusableText(
            title: title,
            size: 10,
            weight: FontWeight.w500,
            color: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  SharedPreferences? preferences;
  var profileData;
  var useerID;
  bool isProfileUpload = true;
  final signoutt = Get.put(SignOutSeekerController());
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
        isProfileUpload = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isProfileUpload = false;
      });
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.mainColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            isProfileUpload
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/icons/bottomBar/Group 228.png"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ReusableText(
                          title: profileData == null ? "" : profileData['name'],
                          size: 24,
                          weight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ReusableText(
                          title: profileData == null ? "" : "${profileData['email']}",
                          size: 17,
                          weight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
            Container(
              // height: MediaQuery.sizeOf(context).height*0.79,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TenentProfile()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person_outline_sharp,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ReusableText(
                            title: 'My Profile',
                            size: 18,
                            weight: FontWeight.w500,
                            color: Color(0xff000000),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const tabsview()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/drawer/Vector (3).svg",
                            color: const Color(0xffA196CB),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const ReusableText(
                            title: 'Invoices',
                            size: 18,
                            weight: FontWeight.w500,
                            color: Color(0xff000000),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xff60467E),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const MaintenanceServiceScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/drawer/setting.svg",
                            color: const Color(0xffA196CB),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Expanded(
                              child: ReusableText(
                            title: 'Maintenance Services',
                            size: 18,
                            weight: FontWeight.w500,
                            color: Color(0xff000000),
                          )),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyServices()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/drawer/setting.svg",
                            color: const Color(0xffA196CB),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const ReusableText(
                            title: 'My Services',
                            size: 18,
                            weight: FontWeight.w500,
                            color: Color(0xff000000),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.settings_rounded,
                          color: Color(0xffA196CB),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ReusableText(
                          title: 'Setting',
                          size: 18,
                          weight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff60467E),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/drawer/theme.svg',
                          color: const Color(0xffA196CB),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const ReusableText(
                          title: 'Theme',
                          size: 18,
                          weight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff60467E),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/drawer/Vector (2).svg",
                          color: const Color(0xffA196CB),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const ReusableText(
                          title: 'Support',
                          size: 18,
                          weight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/drawer/Vector (1).svg",
                          color: const Color(0xffA196CB),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const ReusableText(
                          title: 'Faq\'s',
                          size: 18,
                          weight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/drawer/Vector.svg",
                          color: const Color(0xffA196CB),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const ReusableText(
                          title: 'Help',
                          size: 18,
                          weight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Color(0xf40A196CB),
                  ),
                  GestureDetector(
                    onTap: () {
                      preferences?.setBool('isLoggedIn', false);
                      useerID = GetStorage().remove("user_id");
                      signoutt.signOutSeekeer(useerID);
                      Get.offAll(SignIN());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.logout, color: Color(0xffA196CB)),
                          SizedBox(
                            width: 20,
                          ),
                          ReusableText(
                            title: 'Logout',
                            size: 18,
                            weight: FontWeight.w500,
                            color: Color(0xff000000),
                          ),
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
