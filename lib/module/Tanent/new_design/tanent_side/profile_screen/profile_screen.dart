import 'package:flutter/material.dart';
import 'package:purpleheatsdev/constant/reusable_text/reusable_text.dart';

import '../../../../../themes/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage("assets/images/profile/Ellipse 21.png"),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                      height: 34,
                      width: 34,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor),
                      child: const Icon(
                        Icons.mode_edit_outlined,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            height: 54,
            width: MediaQuery.sizeOf(context).width * 1,
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
                  hintText: '  John Alice',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 54,
            width: MediaQuery.sizeOf(context).width * 1,
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
                  hintText: ' johnalice@gmail.com',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 54,
            width: MediaQuery.sizeOf(context).width * 1,
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
                  hintText: '  +92 123 45 67 891',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 54,
            width: MediaQuery.sizeOf(context).width * 1,
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
                  hintText: '  House No. 67, Street No. 101, Model Town, Lahore',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 54,
            width: MediaQuery.sizeOf(context).width * 1,
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
                  hintText: '  01/06/2019',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 54,
            width: MediaQuery.sizeOf(context).width * 1,
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
                  hintText: '  Male',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 54,
            width: MediaQuery.sizeOf(context).width * 1,
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
                  hintText: '  XXXXXXXXXX999',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 41,
                width: MediaQuery.sizeOf(context).width * 0.80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.mainColor,
                ),
                child:  Center(
                    child: ReusableText(
                  title: 'Update',
                  size: 14,
                  weight: FontWeight.w700,
                  color: Colors.white,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
