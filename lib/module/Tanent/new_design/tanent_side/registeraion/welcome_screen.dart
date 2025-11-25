import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/registeraion/signup_screen.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image(image: AssetImage("assets/images/registration/image 7.png")),
            SizedBox(
              height: 60,
            ),
            ReusableText(
              title: 'Welcome to the\nDigital World',
              size: 35,
              alignment: TextAlign.center,
              weight: FontWeight.w600,
              color: AppColors.mainColor,
            ),
            SizedBox(
              height: 10,
            ),
            ReusableText(
              alignment: TextAlign.center,
              title:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since.',
              size: 16,
              weight: FontWeight.w700,
              color: Color(0xffAFAFAF),
            ),
            SizedBox(
              height: 10,
            ),
            DotsIndicator(
              dotsCount: 3,
              // position: currentIndexPage,
              decorator: DotsDecorator(
                color: Color(0xffD4D4D6),
                activeColor: Color(0xff593D77),
                size: const Size.square(9.0),
                activeSize: const Size(29.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
              },
              child: Container(
                height: 41,

                width: MediaQuery.sizeOf(context).width * 0.60,

// margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.mainColor,
                ),
                child: const Center(
                    child: ReusableText(
                  title: 'Get Started',
                  size: 12,
                  weight: FontWeight.w700,
                  color: Colors.white,
                )),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    ));
  }
}
