import 'package:flutter/material.dart';

import '../../../../../../constant/reusable_text/reusable_text.dart';

class MaintenanceContainer extends StatelessWidget {
  final String? problem;
  final String? date;
  final String? price;
  final String? status;
  final String? time;
  final Color? containerColor;
  final Color? statusColor;

  const MaintenanceContainer({
    key,
    this.problem,
    this.date,
    this.price,
    this.status,
    this.time,
    this.containerColor,
    this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                title: problem.toString(),
                size: 12,
                weight: FontWeight.w500,
                color: Color(0xff000000),
              ),
              SizedBox(
                height: 5,
              ),
              ReusableText(
                title: date.toString(),
                size: 11,
                weight: FontWeight.w400,
                color: Color(0xff8A8A8F),
              ),
              SizedBox(
                height: 5,
              ),
              ReusableText(
                title: price.toString(),
                size: 11,
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
                title: status.toString(),
                size: 12,
                weight: FontWeight.w700,
                color: statusColor,
              ),
              SizedBox(
                height: 20,
              ),
              ReusableText(
                title: time.toString(),
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
