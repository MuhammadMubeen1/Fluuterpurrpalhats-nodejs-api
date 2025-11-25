import 'package:flutter/material.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Image(height: 260, image: AssetImage("assets/images/registration/image 17.png")),
            ReusableText(
              title: 'Password Reset',
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
              title: 'If you need help resetting your password\nwe can help by sending you a link to reset it.',
              size: 12,
              weight: FontWeight.w500,
              color: Color(0xf50000000),
            ),
            SizedBox(
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
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
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
                  title: 'Send Request',
                  size: 14,
                  weight: FontWeight.w700,
                  color: Colors.white,
                )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
