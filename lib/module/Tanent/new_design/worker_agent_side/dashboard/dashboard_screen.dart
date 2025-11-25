import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<ChartData> chartData = [
    ChartData('David', 70, AppColors.mainColor),
    ChartData('Steve', 30, const Color(0xffBBA3D6)),
  ];

  final List<CalenderModel> dateMonths = [
    CalenderModel(day: 'Mon', date: '01', month: 'Jun', color: const Color(0xffFF9900)),
    CalenderModel(day: 'Tue', date: '02', month: 'Jun', color: const Color(0xff1462B3)),
    CalenderModel(day: 'Wed', date: '03', month: 'Jun', color: const Color(0xffE9888D)),
    CalenderModel(day: 'Thu', date: '04', month: 'Jun', color: const Color(0xff2DB412)),
  ];
  final List<DutyModel> dateTimeList = [
    DutyModel(day: 'Mon', from: '8:45 AM', to: '3:00 PM', containerColor: const Color(0xffFF9900)),
    DutyModel(day: 'Tue', from: '8:45 AM', to: '3:00 PM', containerColor: const Color(0xff1462B3)),
    DutyModel(day: 'Wed', from: '8:45 AM', to: '3:00 PM', containerColor: const Color(0xffE9888D)),
    DutyModel(day: 'Thu', from: '8:45 AM', to: '3:00 PM', containerColor: const Color(0xff2DB412)),
    DutyModel(day: 'Fri', from: '8:45 AM', to: '3:00 PM', containerColor: const Color(0xffBE0C0C)),
    DutyModel(day: 'Sat', from: '8:45 AM', to: '3:00 PM', containerColor: const Color(0xffA08EB7)),
    DutyModel(day: 'Sun', from: '8:45 AM', to: '3:00 PM', containerColor: const Color(0xffD2A74D)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          const ReusableText(
            title: 'Today’s Summary',
            size: 16,
            weight: FontWeight.w700,
            color: Color(0xff000000),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: MediaQuery.sizeOf(context).height * 0.17,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xf30000000)),
                color: const Color(0xffFBFBFB)),
            child: Row(
              children: [
                Container(
                  color: AppColors.mainColor,
                  width: 5,
                  height: 134,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReusableText(
                            title: 'Wednesday 10 May 2023',
                            size: 12,
                            weight: FontWeight.w400,
                            color: Color(0xff243137),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ReusableText(
                            title: '8:45 AM - 3:00 PM',
                            size: 16,
                            weight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xff3F4A4F),
                                size: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ReusableText(
                                title: 'Lake View City',
                                size: 11,
                                weight: FontWeight.w500,
                                color: Color(0xff213137),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.warning,
                                color: Color(0xffFF9900),
                                size: 15,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              ReusableText(
                                title: 'Your Shift is ending in 3 hours 23 minutes',
                                size: 11,
                                weight: FontWeight.w400,
                                color: Color(0xffFF9900),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 65,
                        child: SfCircularChart(margin: EdgeInsets.zero, palette: [
                          AppColors.mainColor,
                          const Color(0xffBBA3D6),
                        ], annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                              widget: const Text('03h 23m\nLeft',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500, color: Color(0xff243137), fontSize: 11)))
                        ], series: <CircularSeries>[
                          DoughnutSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              // Radius of doughnut
                              radius: '100%')
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ReusableText(
            title: 'Earnings Summary',
            size: 16,
            weight: FontWeight.w700,
            color: Color(0xff000000),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xf30000000)),
                color: const Color(0xffFBFBFB)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ReusableText(
                      title: 'Earnings Summary',
                      size: 16,
                      weight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xf24000000)),
                          color: const Color(0xffFFFFFF)),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ReusableText(
                            title: 'Weekly',
                            size: 11,
                            weight: FontWeight.w400,
                            color: Color(0xff3F4A4F),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xff3F4A4F),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    ReusableText(
                      title: 'Rs. 7860',
                      size: 18,
                      weight: FontWeight.w400,
                      color: Color(0xf85000000),
                    ),
                    Spacer(),
                    ReusableText(
                      title: 'JUN 03 - JUN 09',
                      size: 15,
                      weight: FontWeight.w400,
                      color: Color(0xf83000000),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                  height: 2,
                  color: Color(0xff3F4A4F),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: ReusableText(
                  title: 'View earning breakdown',
                  size: 11,
                  weight: FontWeight.w700,
                  color: AppColors.mainColor,
                )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                title: 'Earnings Summary',
                size: 16,
                weight: FontWeight.w700,
                color: Color(0xff000000),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.mainColor,
                  ),
                  ReusableText(
                    title: 'June',
                    size: 11,
                    weight: FontWeight.w500,
                    color: Color(0xf753F4A4F),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ReusableText(
                    title: 'Day',
                    size: 12,
                    weight: FontWeight.w500,
                    color: Color(0xff3F4A4F),
                  ),
                  ...List.generate(
                      dateMonths.length,
                      (index) => Container(
                            clipBehavior: Clip.antiAlias,
                            width: 50,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: const Color(0xf20000000)),
                                color: const Color(0xffFBFBFB)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                  color: dateMonths[index].color,
                                  child: Center(
                                      child: ReusableText(
                                    title: dateMonths[index].day.toString(),
                                    size: 11,
                                    weight: FontWeight.w500,
                                    color: const Color(0xffFFFFFF),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ReusableText(
                                        title: dateMonths[index].date.toString(),
                                        size: 9,
                                        weight: FontWeight.w700,
                                        color: const Color(0xf83000000),
                                      ),
                                      ReusableText(
                                        title: dateMonths[index].month.toString(),
                                        size: 9,
                                        weight: FontWeight.w700,
                                        color: const Color(0xf60000000),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ReusableText(
                    title: 'Shift Details',
                    size: 12,
                    weight: FontWeight.w500,
                    color: Color(0xff3F4A4F),
                  ),
                  ...List.generate(
                      dateMonths.length,
                      (index) => Container(
                            width: MediaQuery.sizeOf(context).width * 0.72,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xf30000000)),
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xffFBFBFB)),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Icon(
                                      Icons.more_horiz,
                                      color: Color(0xff888989),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.watch_later_outlined,
                                      color: AppColors.mainColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ReusableText(
                                      title: '8:45 AM - 3:00 PM',
                                      size: 15,
                                      weight: FontWeight.w400,
                                      color: Color(0xf87000000),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xff888989),
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ReusableText(
                                          title: 'Lake View City',
                                          size: 10,
                                          weight: FontWeight.w500,
                                          color: Color(0xff888989),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          color: Color(0xff888989),
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        ReusableText(
                                          title: '6 Hours 30 Minutes',
                                          size: 10,
                                          weight: FontWeight.w500,
                                          color: Color(0xff888989),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const ReusableText(
            title: 'Tasks',
            size: 16,
            weight: FontWeight.w700,
            color: Color(0xff000000),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const ReusableText(
                title: 'Day',
                size: 12,
                weight: FontWeight.w500,
                color: Color(0xff3F4547),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.30,
              ),
              const ReusableText(
                title: 'From',
                size: 12,
                weight: FontWeight.w500,
                color: Color(0xff3F4547),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.20,
              ),
              const ReusableText(
                title: 'To',
                size: 12,
                weight: FontWeight.w500,
                color: Color(0xff3F4547),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ...List.generate(
            dateTimeList.length,
            (index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: index == 4 || index == 6 ? const Color(0xffE5E5E5) : const Color(0xffFBFBFB),
                  border: Border.all(color: const Color(0xf30000000))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: dateTimeList[index].containerColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ReusableText(
                    title: dateTimeList[index].day,
                    size: 13,
                    weight: FontWeight.w700,
                    color: const Color(0xff87000000),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.20,
                  ),
                  ReusableText(
                    title: dateTimeList[index].from,
                    size: 14,
                    weight: FontWeight.w400,
                    color: const Color(0xff75000000),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.15,
                  ),
                  ReusableText(
                    title: dateTimeList[index].to,
                    size: 14,
                    weight: FontWeight.w400,
                    color: const Color(0xff75000000),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ReusableText(
            title: 'Pay slips',
            size: 16,
            weight: FontWeight.w700,
            color: Color(0xff000000),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 147,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffFBFBFB),
                border: Border.all(color: const Color(0xf30000000))),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.payments_outlined,
                  color: AppColors.mainColor,
                  size: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableText(
                  title: 'Tap here to view pay slips',
                  size: 13,
                  weight: FontWeight.w700,
                  color: Color(0xf74000000),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ReusableText(
            title: 'Leave Balance',
            size: 16,
            weight: FontWeight.w700,
            color: Color(0xff000000),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffFBFBFB),
                border: Border.all(color: const Color(0xf30000000))),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   width: 120,
                //     child: SfCircularChart(
                //       margin: EdgeInsets.zero,legend: Legend(
                //       alignment: ChartAlignment.near,
                //       position: LegendPosition.top,isResponsive: true
                //     ),
                //         series: <CircularSeries>[
                //           DoughnutSeries<ChartData, String>(
                //               dataSource: chartData,
                //               xValueMapper: (ChartData data, _) => data.x,
                //               yValueMapper: (ChartData data, _) => data.y,
                //
                //               // Radius of doughnut
                //               radius: '50%'
                //           )
                //         ]
                //     )
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;
  final Color color;
  ChartData(this.x, this.y, this.color);
}

class CalenderModel {
  String day;
  String date;
  String month;
  Color color;
  CalenderModel({required this.day, required this.color, required this.date, required this.month});
}

class DutyModel {
  String day;
  String from;
  String to;
  Color containerColor;
  DutyModel({required this.day, required this.containerColor, required this.from, required this.to});
}

// Sample data function
List<ChartData1> SampleChartData() {
  return <ChartData1>[
    ChartData1('Category A', 30, const Color(0xFFEF5350)),
    ChartData1('Category B', 20, const Color(0xFF66BB6A)),
    ChartData1('Category C', 25, const Color(0xFF42A5F5)),
    ChartData1('Category D', 15, const Color(0xFFFFD600)),
  ];
}

class ChartData1 {
  final String x;
  final double y;
  final Color pointColor;

  ChartData1(this.x, this.y, this.pointColor);
}
