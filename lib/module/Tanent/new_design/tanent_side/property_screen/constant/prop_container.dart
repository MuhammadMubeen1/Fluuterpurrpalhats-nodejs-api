import 'package:flutter/material.dart';
import 'package:purpleheatsdev/constant/reusable_text/reusable_text.dart';

class PropContainer extends StatelessWidget {
  final String? imgPath;
  final String? homeType1;
  final String? homeType2;
  final String? homeLoc;
  final String? dueDate;
  final String? homePrice;
  final String? coverage_area;
  final Color? containerColor;
  const PropContainer({
    key,
    this.imgPath,
    this.homeType1,
    this.homeType2,
    this.homeLoc,
    this.dueDate,
    this.homePrice,
    this.coverage_area,
    this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imgPath.toString())),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: homeType1,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                    TextSpan(
                        text: homeType2,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 14,
                        ))
                  ])),
              SizedBox(
                height: 5,
              ),
              ReusableText(
                title: homeLoc.toString(),
                size: 12,
                weight: FontWeight.w400,
                color: Color(0xff8A8A8F),
              ),
              SizedBox(
                height: 5,
              ),
              ReusableText(
                title: dueDate.toString(),
                size: 12,
                weight: FontWeight.w400,
                color: Color(0xff8A8A8F),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableText(
                title: homePrice.toString(),
                size: 14,
                weight: FontWeight.w700,
                color: Color(0xff00B33D),
              ),
              SizedBox(
                height: 20,
              ),
              ReusableText(
                title: coverage_area.toString(),
                size: 12,
                weight: FontWeight.w400,
                color: Color(0xff8A8A8F),
              ),
            ],
          )
        ],
      ),
    );
  }
}
