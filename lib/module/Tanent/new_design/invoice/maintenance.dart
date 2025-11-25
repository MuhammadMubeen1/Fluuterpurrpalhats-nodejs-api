import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:purpleheatsdev/module/Tanent/new_design/invoice/pdfview.dart';



class maintenance extends StatefulWidget {
  const maintenance();

  @override
  State<maintenance> createState() => _maintenanceState();
}

class _maintenanceState extends State<maintenance> {
  var invoices = [];
  bool isLoadingInvoices = true;
  void initState() {
    super.initState();
    getRentalAgrement();
  }

  bool isLoading = false;
  getRentalAgrement() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://admin.purplehats.com/api/tenant/invoice/maintenance'));
    request.body = json.encode({
      "login_session_id": 481
      //useerID.toString(),
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      invoices = body['message'];
      print("adsData data is ==$invoices");

      setState(() {
        invoices;
        isLoadingInvoices = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoadingInvoices = false;
      });
    }
  }

  TextEditingController searchReportsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    // scrollDirection: Axis.vertical,
                    itemCount: invoices.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          invoices[index]['invoice_url'] == null
                              ? Fluttertoast.showToast(
                                  msg: "I am Null",
                                )
                              // print("I am null ")
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PdfView(
                                        pdfUrl: invoices[index]['invoice_url']),
                                  ),
                                );
                        },
                        child: Container(
                          height: 105,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF2F2F2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.picture_as_pdf_outlined,
                                              color: Colors.purple,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                        invoices[index]['type'],
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff363636),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        invoices[index]
                                                            ['created_at'],
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xff8A8A8F),
                                                            fontSize: 11.5,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "${invoices[index]['invoice_no']}",
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xffAFAFAF),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "\$0.00",
                                          style: TextStyle(
                                              color: Color(0xff593D77),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
