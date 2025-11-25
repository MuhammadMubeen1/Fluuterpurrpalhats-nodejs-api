import 'dart:async';
import 'package:flutter/material.dart';
import 'package:purpleheatsdev/module/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/bottom_app_bar/bottom_navigation_app_bar.dart';
import '../constant/bottom_app_bar_worker_side/bottom_bar_worker_side.dart';
import 'Worker/home_view.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, navigationPage);
  }

  late SharedPreferences preferences;

  //late SharedPreferences preferences;
  void navigationPage() {
    SharedPreferences.getInstance().then((value) async {
      preferences = value;
      if (preferences.getBool('isLoggedIn') ?? false) {
        Future.delayed(const Duration(seconds: 2), () {
          if (preferences?.getString('userType') == "agent") {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => BottomNavigationAppBarAgentSide()), (route) => false);
            //  BottomNavigationAppBarWorkerSide
           // AgentScreen
            //   Get.to(AgentScreen());
           // BottomNavigationAppBarAgentSide
          } else {
            //Get.to(TanentHomeScreen());
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (_) => BottomNavigationAppBar()), (route) => false);
          }
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SignIN()), (route) => false);
        });
      }
    }).catchError((e) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => SignIN()), (route) => false);
      });
    });
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff472975),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/svgs/applogo.png',
                //color: BROWN_COLOR,
                width: animation.value * 300,
                height: animation.value * 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
