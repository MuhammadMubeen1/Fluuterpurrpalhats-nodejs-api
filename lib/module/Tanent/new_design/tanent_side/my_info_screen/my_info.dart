import 'package:flutter/material.dart';
import 'package:purpleheatsdev/constant/reusable_text/reusable_text.dart';
import 'package:purpleheatsdev/themes/app_colors.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
        ),
        title: const ReusableText(
          title: 'My Info',
          size: 18,
          weight: FontWeight.w700,
          color: AppColors.mainColor,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      radius: 65,
                      backgroundColor: Color(0xffEBE7EE),
                      child: ReusableText(
                        title: 'Add Image',
                        size: 13,
                        weight: FontWeight.w400,
                        color: Color(0xff8A8A8F),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: Container(
                          height: 34,
                          width: 34,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor),
                          child: const Icon(
                            Icons.camera_alt_outlined,
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
                      hintText: 'Name',
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
                      hintText: 'Address',
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
                      hintText: 'Phone',
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
                      hintText: 'Email',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    title: 'Date Of Birth',
                    size: 18,
                    weight: FontWeight.w700,
                    color: AppColors.mainColor,
                  ),
                  Spacer(),
                  ReusableText(
                    title: '01/06/2019',
                    size: 13,
                    weight: FontWeight.w700,
                    color: Color(0xffC0C0C0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                    color: AppColors.mainColor,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const ReusableText(
                title: 'Gender',
                size: 18,
                weight: FontWeight.w700,
                color: AppColors.mainColor,
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
                      hintText: 'Male',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xff8F8F8F))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ReusableText(
                title: 'Govt ID',
                size: 18,
                weight: FontWeight.w700,
                color: AppColors.mainColor,
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
                      hintText: 'XXXXXXXXXX999',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: Color(0xff8F8F8F))),
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
                      color: AppColors.mainColor.withOpacity(0.20),
                    ),
                    child: const Center(
                        child: ReusableText(
                      title: 'Submit',
                      size: 14,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
