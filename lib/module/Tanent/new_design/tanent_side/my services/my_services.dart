import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';
import 'package:http/http.dart' as http;

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  var subscribeData = [];
  var data;
  String EmptyMessage = "";
  bool isLoading = true;
  bool isShowContainer = false;

  final List<String> daysList = ['M', 'T', 'W', 'Th', 'F', 'Sa', 'S'];

  int _currentIndex = 0;
  String to = "Select";
  String from = "Select";
  var useerID;

  getSubscribePackage() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/facilities/user-subscribed'));
    request.body = json.encode({
      "login_session_id": useerID,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
    //  EmptyMessage == "" ? EmptyMessage = body['message'] :
      subscribeData = body['data'];

      print("subscribeData data is ==${subscribeData}");
      setState(() {
        isLoading = false;
        subscribeData;
      });
    }
    if (response.statusCode == 404) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      EmptyMessage = body['message'];
      print("subscribeData data is ==${subscribeData}");
      setState(() {
        isLoading = false;
        subscribeData;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }

  SharedPreferences? preferences;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    getSubscribePackage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: 'My Services',
          size: 18,
          weight: FontWeight.w700,
          color: AppColors.mainColor,
        ),
        actions: const [
          Row(
            children: [
              ReusableText(
                title: 'All',
                size: 18,
                weight: FontWeight.w700,
                color: AppColors.mainColor,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.mainColor,
              )
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: EmptyMessage == ""
                    ? Column(
                        children: [
                          isShowContainer
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffF2F2F2),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data['package'],
                                                style: const TextStyle(
                                                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                "${data['remaining_days']} days Left",
                                                style: const TextStyle(color: Colors.red, fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${data['duration']} Days Subscription",
                                            style: const TextStyle(color: Color(0xff8A8A8F), fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Service Usage: ${data['remaining_service_frequency']}/${data['service_frequency']}",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const Icon(Icons.arrow_drop_down),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const ReusableText(
                                            title: 'Select Day',
                                            size: 15,
                                            weight: FontWeight.w500,
                                            color: Color(0xff000000),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                              daysList.length,
                                              (index) => GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _currentIndex = index;
                                                  });
                                                },
                                                child: Container(
                                                  height: 31,
                                                  width: 31,
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: _currentIndex == index
                                                          ? AppColors.mainColor
                                                          : Colors.transparent,
                                                      border: Border.all(
                                                          color: _currentIndex == index
                                                              ? Colors.transparent
                                                              : AppColors.mainColor)),
                                                  child: Center(
                                                    child: ReusableText(
                                                      title: daysList[index].toString(),
                                                      size: 12,
                                                      weight: FontWeight.w500,
                                                      color:
                                                          _currentIndex == index ? Colors.white : AppColors.mainColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const ReusableText(
                                            title: 'Time Range Slot',
                                            size: 14,
                                            weight: FontWeight.w500,
                                            color: Color(0xff000000),
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
                                                    title: 'Select',
                                                    size: 8,
                                                    weight: FontWeight.w500,
                                                    color: Color(0xff6D6D6D),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectDate(context, 0);
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(context).width * 0.40,
                                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20),
                                                          color: Colors.transparent,
                                                          border: Border.all(
                                                            color: AppColors.mainColor,
                                                          )),
                                                      child: Row(
                                                        children: [
                                                          ReusableText(
                                                            title: to,
                                                            size: 10,
                                                            weight: FontWeight.w400,
                                                            color: const Color(0xff6D6D6D),
                                                          ),
                                                          const Spacer(),
                                                          const Icon(
                                                            Icons.arrow_drop_down,
                                                            color: Color(0xff8A8A8F),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const ReusableText(
                                                    title: 'Time',
                                                    size: 8,
                                                    weight: FontWeight.w500,
                                                    color: Color(0xff6D6D6D),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectDate(context, 1);
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(context).width * 0.40,
                                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20),
                                                          color: Colors.transparent,
                                                          border: Border.all(
                                                            color: AppColors.mainColor,
                                                          )),
                                                      child: Row(
                                                        children: [
                                                          ReusableText(
                                                            title: from,
                                                            size: 10,
                                                            weight: FontWeight.w400,
                                                            color: const Color(0xff6D6D6D),
                                                          ),
                                                          const Spacer(),
                                                          const Icon(
                                                            Icons.calendar_month,
                                                            color: Color(0xff8A8A8F),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Center(
                                            child: Container(
                                              height: 31,
                                              width: MediaQuery.sizeOf(context).width * 0.60,
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: AppColors.mainColor,
                                                  border: Border.all(
                                                    color: AppColors.mainColor,
                                                  )),
                                              child: const Center(
                                                child: ReusableText(
                                                  title: 'Request',
                                                  size: 12,
                                                  weight: FontWeight.w700,
                                                  color: Color(0xffFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: subscribeData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      data = subscribeData[index];
                                      print("value is  ${data['package']}");
                                      print("package_id is  ${data['package_id']}");

                                      setState(() {
                                        data;
                                        isShowContainer = !isShowContainer;
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color(0xffF2F2F2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  subscribeData[index]['package'],
                                                  style: const TextStyle(
                                                      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  "${subscribeData[index]['remaining_days']} days Left",
                                                  style: const TextStyle(color: Colors.red, fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${subscribeData[index]['duration']} Days Subscription",
                                              style: const TextStyle(color: Color(0xff8A8A8F), fontSize: 12),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Service Usage: ${subscribeData[index]['remaining_service_frequency']}/${subscribeData[index]['service_frequency']}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const Icon(Icons.arrow_drop_down),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      )
                    : Center(
                        child: Text(
                        EmptyMessage,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      )),
              ),
      ),
    );
  }

  selectDate(BuildContext context, int index) async {
    DateTime? selectDate;
    await DatePicker.showDateTimePicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
      selectDate = date;
    }, currentTime: DateTime.now());
    if (selectDate != null) {
      setState(() {
        if (index == 0) {
          to = DateFormat('KK:MM a').format(selectDate!);
        }
        if (index == 1) {
          from = DateFormat('KK:MM a').format(selectDate!);
        }
      });
    }
  }
}
