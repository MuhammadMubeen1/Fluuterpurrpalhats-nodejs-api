import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Myproperties extends StatefulWidget {
  //const Myproperties({super.key});

  @override
  State<Myproperties> createState() => _MypropertiesState();
}

class _MypropertiesState extends State<Myproperties> {
  var propertyData = [];
  bool isLoading = true;
  getProperties() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/tenant/property-unit-list'));
    request.body = json.encode({"login_session_id": 481});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      propertyData = body['data']['property_units'];
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "My Properties",
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Color(0xff593D77),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        actions: <Widget>[
          Row(
            children: [
              Container(
                child: const Text(
                  'All',
                  style: TextStyle(
                    color: Color(0xff593D77),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Colors.black,
              ),
            ],
          )
        ],
        //<Widget>[]
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,

        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body:
          //isLoading?const Center(child: CircularProgressIndicator()):
          Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          child: Text(
                            "25000",
                            style: TextStyle(
                              color: Color(0xff70BE0C),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          left: 270,
                          top: 23,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 69,
                              height: 69,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              // Replace the Image.network with your desired image widget
                              child: Image.asset(
                                'assets/images/cardimage.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "PRU-24hjh",
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    const Text(
                                      "Shop",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Text(
                                  'Lake View City',
                                  style: TextStyle(
                                    color: Color(0xff8A8A8F),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      'Due Date: 20-01-23',
                                      style: TextStyle(
                                        color: Color(0xff8A8A8F),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 65,
                                    ),
                                    Text(
                                      '250 Sq. Feet',
                                      style: TextStyle(
                                        color: Color(0xff8A8A8F),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    ); //AppBar
  }
}
