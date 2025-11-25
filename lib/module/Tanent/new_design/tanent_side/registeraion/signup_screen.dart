import 'package:flutter/material.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/registeraion/sign_in_screen.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: ListView(
            children: [
              Image(height: 260, image: AssetImage("assets/images/registration/image-removebg-preview (15) 1.png")),
              ReusableText(
                title: 'Sign Up',
                size: 35,
                alignment: TextAlign.center,
                weight: FontWeight.w600,
                color: AppColors.mainColor,
              ),
              SizedBox(
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
                      hintText: 'First Name',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
                ),
              ),
              SizedBox(
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
                      hintText: 'Last Name',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
                ),
              ),
              SizedBox(
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
                      hintText: 'Email',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
                ),
              ),
              SizedBox(
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
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                },
                child: Container(
                  height: 48,

                  width: MediaQuery.sizeOf(context).width * 0.80,

// margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.mainColor,
                  ),
                  child: const Center(
                      child: ReusableText(
                    title: 'Register',
                    size: 14,
                    weight: FontWeight.w700,
                    color: Colors.white,
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                },
                child: RichText(
                    text: TextSpan(
                        text: "Already have an account?  ",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff999CAD),
                        ),
                        children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainColor,
                        ),
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
