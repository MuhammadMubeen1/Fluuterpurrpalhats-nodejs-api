// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// import 'package:http/http.dart' as http;

// // ignore: camel_case_types
// class invoices extends StatefulWidget {
//   const invoices({key});

//   @override
//   State<invoices> createState() => _invoicesState();
// }

// class _invoicesState extends State<invoices> {
//   @override
//   void initState() {
//     super.initState();
//     getRentalAgrement();
//   }

//   bool isLoading = false;

//   List<String> names = [
//     'Rent 1',
//     'Rent 2',
//     "Rent 3",
//   ];

//   final List<String> data = [
//     "Rent",
//     "Maintenance",
//     "Subscription",
//     "Security",
//   ];
//   final List<String> data1 = [
//     "EDU-17",
//     "EDU-24",
//     "EDU-35",
//   ];
//   var invoices = [];
//   bool isLoadingInvoices = true;
//   getRentalAgrement() async {
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/rental-agreement'));
//     request.body = json.encode({
//       "login_session_id": 481
//       //useerID.toString(),
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       // print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);

//       invoices = body['message'];
//       print("adsData data is ==$invoices");

//       setState(() {
//         invoices;
//         isLoadingInvoices = false;
//       });
//     } else {
//       print(response.reasonPhrase);
//       setState(() {
//         isLoadingInvoices = false;
//       });
//     }
//   }

//   TextEditingController searchReportsController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color(0xff593D77),
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//             // Handle back button press
//           },
//         ),
//         centerTitle: true,
//         title: const Text(
//           "Invoices",
//           style: TextStyle(color: Color(0xff593D77)),
//         ),
//         actions: [
//           Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.search), // Icon on the right side of the AppBar
//                 onPressed: () {
//                   // Add your action here
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.filter_list), // Icon on the right side of the AppBar
//                 onPressed: () {
//                   // Add your action here
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               child: SizedBox(

//                 height: 60,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: data.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 15),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   height: 43,
//                                   width: 130,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(30),
//                                       border: Border.all(
//                                         color: const Color(0xff2CBCEF),
//                                         width: 1,
//                                       )),
//                                   child: Center(
//                                     child: Text(
//                                       data[index],
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold, fontSize: 11.5, color: Color(0xff2CBCEF)),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Row(
//                 children: [
//                   Text(
//                     "Paid Invoices",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff4f4f4f)),
//                   ),
//                 ],
//               ),
//             ),
//             isLoading
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: const ScrollPhysics(),
//                       // scrollDirection: Axis.vertical,
//                       itemCount: invoices.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => PdfViewer(pdfUrl: invoices[index]['invoice_url']),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             height: 105,
//                             width: double.infinity,
//                             margin: const EdgeInsets.symmetric(vertical: 8),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xffF2F2F2),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Image.network(
//                                                 invoices[index]['agreement_attachments'],
//                                                 height: 50,
//                                                 width: 50,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                               const SizedBox(

//                                                 width: 15,
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Text(invoices[index]['agreement_type'],
//                                                           style: const TextStyle(
//                                                               color: Color(0xff363636),
//                                                               fontWeight: FontWeight.bold,
//                                                               fontSize: 14)),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(

//                                                     height: 8,
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       Text(invoices[index]['start_at'],
//                                                           style: const TextStyle(
//                                                               color: Color(0xff8A8A8F),
//                                                               fontSize: 11.5,
//                                                               fontWeight: FontWeight.bold)),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(

//                                                     height: 8,
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       Text("EDU-${invoices[index]['property_unit_id']}",
//                                                           style: const TextStyle(
//                                                               color: Color(0xffAFAFAF),
//                                                               fontSize: 12,
//                                                               fontWeight: FontWeight.bold)),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           const Text(
//                                             "\$0.00",
//                                             style: TextStyle(
//                                                 color: Color(0xff593D77), fontSize: 17, fontWeight: FontWeight.bold),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//             const SizedBox(

//               height: 10,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


 