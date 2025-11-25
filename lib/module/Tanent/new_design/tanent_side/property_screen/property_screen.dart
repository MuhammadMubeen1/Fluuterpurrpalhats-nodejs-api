import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/property_screen/property_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant/prop_container.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  var propertyData = [];
  bool isLoading = true;
  getProperties() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/tenant/property-unit-list'));
    request.body = json.encode({
      "login_session_id": useerID.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      propertyData = body['data'];
      print("propertyData data is ==${propertyData}");
      setState(() {
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }

  var useerID;
  SharedPreferences? preferences;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      preferences = value;
      setState(() {});
    });
    useerID = GetStorage().read('user_id');
    print("userTypeID,,userTypeID.......$useerID");
    getProperties();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    itemCount: propertyData.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            print("${propertyData[index]['property_id']} ");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PropertyInfo(
                                          propertyData[index],
                                        )));
                          },
                          child: PropContainer(
                              containerColor: Color(0xffF2F2F2),
                              imgPath: 'assets/images/property/Rectangle 157.png',
                              homeType1: '',
                              homeType2:
                                  '${propertyData[index]['type '].toString().toUpperCase()}-${propertyData[index]['property_id ']}',
                              homeLoc: propertyData[index]['property_title'],
                              dueDate: propertyData[index]['address '].toString(),
                              homePrice: propertyData[index]['rent_amount '],
                              coverage_area: '${propertyData[index]["coverage_area "]}-sqft'),
                        ),
                      );
                    })
              ],
            ),
          );
  }
}
