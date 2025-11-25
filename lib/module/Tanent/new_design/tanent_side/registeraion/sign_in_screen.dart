import 'package:flutter/material.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/registeraion/reset_password.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/registeraion/signup_screen.dart';

import '../../../../../constant/bottom_app_bar/bottom_navigation_app_bar.dart';
import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Image(
                  height: 260, image: AssetImage("assets/images/registration/image-removebg-preview (14) 1.png")),
              const ReusableText(
                title: 'Sign In',
                size: 35,
                alignment: TextAlign.center,
                weight: FontWeight.w600,
                color: AppColors.mainColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const ReusableText(
                alignment: TextAlign.center,
                title: 'Enter your email address and\npassword to access your account',
                size: 12,
                weight: FontWeight.w500,
                color: Color(0xf50000000),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 54,
                width: MediaQuery.sizeOf(context).width * 0.80,
                decoration: BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xffE8E6EA),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xffE8E6EA),
                          )),
                      hintText: 'Email',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 54,
                width: MediaQuery.sizeOf(context).width * 0.80,
                decoration: BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xffE8E6EA),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Color(0xffE8E6EA),
                          )),
                      hintText: 'Password',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword()));
                      },
                      child: const ReusableText(
                        title: 'Forgot Password?',
                        size: 11,
                        weight: FontWeight.w700,
                        color: AppColors.mainColor,
                      )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationAppBar()));
                },
                child: Container(
                  height: 48,

                  width: MediaQuery.sizeOf(context).width * 0.80,

// margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.mainColor,
                  ),
                  child: const Center(
                      child: ReusableText(
                    title: 'Sign In',
                    size: 14,
                    weight: FontWeight.w700,
                    color: Colors.white,
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                },
                child: Container(
                  height: 48,

                  width: MediaQuery.sizeOf(context).width * 0.80,

// margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.mainColor.withOpacity(0.20),
                  ),
                  child: const Center(
                      child: ReusableText(
                    title: 'Sign Up',
                    size: 14,
                    weight: FontWeight.w700,
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
