import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:purpleheatsdev/module/Tanent/request_maintenance.dart';
import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../controller/logout_controller.dart';
import '../../../../../themes/app_colors.dart';
import 'constant/maintenance_container.dart';
import 'package:http/http.dart' as http;

class MaintenanceServiceScreen extends StatefulWidget {
  const MaintenanceServiceScreen({key});

  @override
  State<MaintenanceServiceScreen> createState() => _MaintenanceServiceScreenState();
}

class _MaintenanceServiceScreenState extends State<MaintenanceServiceScreen> {
  var useerID;
  var requestList = [];
  bool isLoading = true;
  var priorityStatus;
  Color? statusColor;
  Color? containerColor;
  @override
  void initState() {
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    getProfile();
    myMaintenanceRequests();
    super.initState();
  }

  String formatDate(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(dateTime);
    return formattedDate;
  }

  String formatTimeWithAMPM(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }

  var profileData;

  bool isProfileUpload = true;
  final signoutt = Get.put(SignOutSeekerController());
  getProfile() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/tenant/get-profile'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      profileData = body['data']['profile'];
      print("profile data is ==${profileData}");
      setState(() {
        isProfileUpload = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isProfileUpload = false;
      });
    }
  }

  myMaintenanceRequests() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/tenant/maintenance-request-list'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      requestList = body['data']['maintenance_requests'];
      print("yes requestList ${requestList}");

      setState(() {
        requestList;
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }

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
            title: 'Maintenance Services',
            size: 18,
            weight: FontWeight.w700,
            color: AppColors.mainColor,
          ),
          actions: [
            const Row(
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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: requestList.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  if (requestList[index]['priority'] == 1) {
                    priorityStatus = "Low";
                  } else if (requestList[index]['priority'] == 2) {
                    priorityStatus = "Medium";
                  } else if (requestList[index]['priority'] == 3) {
                    priorityStatus = "High";
                  }
                  if (requestList[index]['status'] == "completed") {
                    statusColor = Color(0xff1CCBF3);
                  } else if (requestList[index]['status'] == "pending") {
                    statusColor = Color(0xffE2B820);
                  } else if (requestList[index]['status'] == "inprogress") {
                    statusColor = Color(0xff70BE0C);
                  }
                  // ==1? "Low": "";
                  // priority =requestList[index]['priority'] ==2? "Medium": "";
                  // priority =requestList[index]['priority'] ==3? "High": "";

                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => RequestMaintenance(profileData)));
                      },
                      child: MaintenanceContainer(
                          price: 'property_id ${requestList[index]['property_id'].toString()}',
                          problem: requestList[index]['title'].toString().toUpperCase(),
                          statusColor: statusColor,
                          time: formatTimeWithAMPM(requestList[index]['created_at']),
                          status: requestList[index]['status'],
                          containerColor: statusColor?.withOpacity(0.1),
                          date: formatDate(requestList[index]['created_at'])),
                    ),
                  );
                }),
      ),
    );
  }
}
