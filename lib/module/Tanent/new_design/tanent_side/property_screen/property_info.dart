import 'package:flutter/material.dart';
import 'package:purpleheatsdev/constant/reusable_text/reusable_text.dart';
import 'package:purpleheatsdev/themes/app_colors.dart';

class PropertyInfo extends StatefulWidget {
  PropertyInfo(this.data, {key});
  var data;

  @override
  State<PropertyInfo> createState() => _PropertyInfoState();
}

class _PropertyInfoState extends State<PropertyInfo> {
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
        title: ReusableText(
          title: '${widget.data['type ']}-${widget.data['property_id ']}',
          size: 18,
          weight: FontWeight.w700,
          color: AppColors.mainColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ReusableText(
              title: 'Property Info',
              size: 18,
              weight: FontWeight.w700,
              color: AppColors.mainColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image(
                  width: MediaQuery.sizeOf(context).width * 0.80,
                  fit: BoxFit.cover,
                  image: const AssetImage("assets/images/property/Rectangle 156.png")),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      title: 'ID:',
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: 'Type:',
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: 'Property:',
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: 'Area',
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: 'Rent Amount:',
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: 'Face Value:',
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: 'Book Value:',
                      size: 13,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      title: "${widget.data['property_id ']}",
                      size: 13,
                      weight: FontWeight.w400,
                      color: Color(0xff8A8A8F),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: widget.data['type '],
                      size: 13,
                      weight: FontWeight.w400,
                      color: Color(0xff8A8A8F),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: widget.data['address '],
                      size: 13,
                      weight: FontWeight.w400,
                      color: Color(0xff8A8A8F),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: widget.data['coverage_area '],
                      size: 13,
                      weight: FontWeight.w400,
                      color: Color(0xff8A8A8F),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: widget.data['rent_amount '],
                      size: 13,
                      weight: FontWeight.w400,
                      color: Color(0xff8A8A8F),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: widget.data['face_value '],
                      size: 13,
                      weight: FontWeight.w400,
                      color: Color(0xff8A8A8F),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusableText(
                      title: widget.data['book_value '],
                      size: 13,
                      weight: FontWeight.w400,
                      color: Color(0xff8A8A8F),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupScreen()));
                },
                child: Container(
                  height: 44,
                  width: MediaQuery.sizeOf(context).width * 0.80,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: const Center(
                      child: ReusableText(
                    title: 'Pending Bills',
                    size: 14,
                    weight: FontWeight.w700,
                    color: AppColors.mainColor,
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupScreen()));
                },
                child: Container(
                  height: 44,
                  width: MediaQuery.sizeOf(context).width * 0.80,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: const Center(
                      child: ReusableText(
                    title: 'Invoice History',
                    size: 14,
                    weight: FontWeight.w700,
                    color: AppColors.mainColor,
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupScreen()));
                },
                child: Container(
                  height: 44,
                  width: MediaQuery.sizeOf(context).width * 0.80,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: const Center(
                      child: ReusableText(
                    title: 'View Lease Agreement',
                    size: 14,
                    weight: FontWeight.w700,
                    color: AppColors.mainColor,
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }
}
