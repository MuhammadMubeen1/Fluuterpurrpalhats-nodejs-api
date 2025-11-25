// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
//
// import '../../constant/reusable_text/reusable_text.dart';
// import '../../themes/app_colors.dart';
// import 'leave_request.dart';
// import 'package:http/http.dart' as http;
//
// class AllLeavesScreen extends StatefulWidget {
//   const AllLeavesScreen({key});
//
//   @override
//   State<AllLeavesScreen> createState() => _LeavesScreenState();
// }
//
// class _LeavesScreenState extends State<AllLeavesScreen> {
//   var leaves;
//   var allLeaveRequest = [];
//   bool isLoading  = true ;
//   allLeaves()async{
//     var headers = {
//       'Content-Type': 'application/json'
//     };
//     var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/agent/leave-detail'));
//     request.body = json.encode({
//       "login_session_id": 485
//     });
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 201) {
//       //print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//
//       leaves = body['data'];
//       allLeaveRequest = leaves ['check_in_session'];
//       setState(() {
//         isLoading = false;
//       });
//
//
//     }
//     else {
//     print(response.reasonPhrase);
//     setState(() {
//       isLoading = false;
//     });
//     }
//
//   }
//   @override
//   void initState() {
//     allLeaves();
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  isLoading ?Center(child: CircularProgressIndicator()):
//       Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
//       child: SingleChildScrollView(
//
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,children: [
//           const ReusableText(title: 'Leave log',color: Color(0xff000000),size: 18,weight: FontWeight.w700,),
//           const SizedBox(height: 10,),
//           const ReusableText(title: 'Categories',color: Color(0xff000000),size: 14,weight: FontWeight.w500,),
//           const SizedBox(height: 10,),
//           Row(
//             children: [
//               Container(
//                 height: 18,width: 18,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,color: Color(0xff2DB412),
//                 ),
//                 child: const Icon(Icons.done,color: Colors.white,size: 13,),
//               ),
//               const SizedBox(width: 10,),
//               const ReusableText(title: 'Approved leaves',color: Color(0xff313131),size:  14,weight: FontWeight.w400,),
//               const Spacer(),
//                ReusableText(title: '${leaves['Accepted Request']}',color: Color(0xf53313131),size:  14,weight: FontWeight.w400,),
//               const SizedBox(width: 10,),
//               const Icon(Icons.arrow_right,color: Color(0xff787878),)
//             ],
//           ),
//           const SizedBox(height: 10,),
//           Row(
//             children: [
//               Container(
//                 height: 18,width: 18,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,color: Color(0xffFF9900),
//                 ),
//                 child: const Icon(Icons.remove,size: 13,color: Colors.white,),
//               ),
//               const SizedBox(width: 10,),
//               const ReusableText(title: 'Pending leaves',color: Color(0xff313131),size:  14,weight: FontWeight.w400,),
//               const Spacer(),
//                ReusableText(title: '${leaves['Rejected Requests']}',color: Color(0xf53313131),size:  14,weight: FontWeight.w400,),
//               const SizedBox(width: 10,),
//               const Icon(Icons.arrow_right,color: Color(0xff787878),)
//             ],
//           ),
//           const SizedBox(height: 10,),
//           Row(
//             children: [
//               Container(
//                 height: 18,width: 18,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,color: Color(0xffFF0000),
//                 ),
//                 child: const Icon(Icons.close,color: Colors.white,size: 13,),
//               ),
//               const SizedBox(width: 10,),
//               const ReusableText(title: 'Rejected leaves',color: Color(0xff313131),size:  14,weight: FontWeight.w400,),
//               const Spacer(),
//                ReusableText(title: '${leaves['Pending Request']}',color: Color(0xf53313131),size:  14,weight: FontWeight.w400,),
//               const SizedBox(width: 10,),
//               const Icon(Icons.arrow_right,color: Color(0xff787878),)
//             ],
//           ),
//           const SizedBox(height: 10,),
//           const ReusableText(title: 'All leaves',color: Color(0xff000000),size: 14,weight: FontWeight.w500,),
//           const SizedBox(height: 10,),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: ScrollPhysics(),
//             itemCount:allLeaveRequest.length ,
//               itemBuilder: (context, index){
//             return   Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: const Color(0xf40000000)),
//                 ),child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Row(
//                     children: [
//                       ReusableText(title: "07 Jun 2023",size: 13,weight: FontWeight.w700,color: Color(0xff000000),),
//
//                       Icon(Icons.arrow_forward_ios,color: Color(0xff000000),size: 13,),
//                       ReusableText(title: "07 Jun 2023",size: 13,weight: FontWeight.w700,color: Color(0xff000000),),
//                       Spacer(),
//                       Icon(Icons.more_vert,color: Color(0xf76888989),),
//                     ],
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,children: [
//                     Container(
//                       height: 9,width: 9,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,color:  Color(0xffFF9900),
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//
//                     const ReusableText(title: "Monday",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),),
//                     const SizedBox(width: 40,),
//                     Container(
//                       height: 9,width: 9,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,color:  Color(0xffA08EB7),
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//
//                     const ReusableText(title: "Saturday",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),),
//
//                     const Spacer(),
//                   ],
//                   ),
//                   const SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       const ReusableText(title: "Personal leave",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),),
//                       SizedBox(width: MediaQuery.sizeOf(context).width*0.30,),
//                       const ReusableText(title: "06 Days",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),),
//                     ],
//                   ),
//                   const Divider(thickness: 1,height: 2,color: Color(0xff3F4A4F),),
//                   const SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Container(
//                         height: 18,width: 18,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,color: Color(0xffFF0000),
//                         ),
//                         child: const Icon(Icons.close,color: Colors.white,size: 13,),
//                       ),
//                       const SizedBox(width: 10,),
//                       const ReusableText(title: "Leave request denied",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),),
//                       const Spacer(),
//                       Container(
//                         height: 18,width: 18,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,color: AppColors.mainColor,
//                         ),
//                         child: const Icon(Icons.download,color: Colors.white,size: 13,),
//                       ),
//                       const SizedBox(width: 10,),
//                       const ReusableText(title: "Download",size: 13,weight: FontWeight.w700,color: AppColors.mainColor,),
//                       const SizedBox(width: 10,),
//                     ],
//                   ),
//                 ],
//               ),
//               ),
//             );
//           }),
//
//           SizedBox(height: 10,),
//           Row(
//             children: [
//               Spacer(),
//               GestureDetector(
//                 onTap: (){
//
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  LeaveRequest()));
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 13),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Color(0xff8462AD)
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,color:Colors.white,
//                         ),
//                         child: const Icon(Icons.add,color: Color(0xff8462AD),size: 13,),
//                       ),
//                       SizedBox(width: 10,),
//                       const ReusableText(title: "Apply New Leave",size: 13,weight: FontWeight.w700,color: Colors.white,),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//         ),
//       ),
//
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../constant/reusable_text/reusable_text.dart';
import '../../themes/app_colors.dart';
import 'leave_request.dart';
import 'package:http/http.dart' as http;

class AllLeavesScreen extends StatefulWidget {
  const AllLeavesScreen({key});

  @override
  State<AllLeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<AllLeavesScreen> {
  var leaves;
  var allLeaveRequest = [];
  bool isLoading = true;

  allLeaves() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse('https://admin.purplehats.com/api/agent/leave-detail'));
    request.body = json.encode({
      "login_session_id": 485,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);

      leaves = body['data'];
      allLeaveRequest = leaves['check_in_session'];
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

  @override
  void initState() {
    allLeaves();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                          const ReusableText(title: 'Leave log',color: Color(0xff000000),size: 18,weight: FontWeight.w700,),
          const SizedBox(height: 10,),
          const ReusableText(title: 'Categories',color: Color(0xff000000),size: 14,weight: FontWeight.w500,),
          const SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height: 18,width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,color: Color(0xff2DB412),
                ),
                child: const Icon(Icons.done,color: Colors.white,size: 13,),
              ),
              const SizedBox(width: 10,),
              const ReusableText(title: 'Approved leaves',color: Color(0xff313131),size:  14,weight: FontWeight.w400,),
              const Spacer(),
               ReusableText(title: '${leaves['Accepted Request']}',color: Color(0xf53313131),size:  14,weight: FontWeight.w400,),
              const SizedBox(width: 10,),
              const Icon(Icons.arrow_right,color: Color(0xff787878),)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height: 18,width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,color: Color(0xffFF9900),
                ),
                child: const Icon(Icons.remove,size: 13,color: Colors.white,),
              ),
              const SizedBox(width: 10,),
              const ReusableText(title: 'Pending leaves',color: Color(0xff313131),size:  14,weight: FontWeight.w400,),
              const Spacer(),
               ReusableText(title: '${leaves['Pending Request']}',color: Color(0xf53313131),size:  14,weight: FontWeight.w400,),
              const SizedBox(width: 10,),
              const Icon(Icons.arrow_right,color: Color(0xff787878),)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height: 18,width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,color: Color(0xffFF0000),
                ),
                child: const Icon(Icons.close,color: Colors.white,size: 13,),
              ),
              const SizedBox(width: 10,),
              const ReusableText(title: 'Rejected leaves',color: Color(0xff313131),size:  14,weight: FontWeight.w400,),
              const Spacer(),
               ReusableText(title: '${leaves['Rejected Requests']}',color: Color(0xf53313131),size:  14,weight: FontWeight.w400,),
              const SizedBox(width: 10,),
              const Icon(Icons.arrow_right,color: Color(0xff787878),)
            ],
          ),
          const SizedBox(height: 10,),
          const ReusableText(title: 'All leaves',color: Color(0xff000000),size: 14,weight: FontWeight.w500,),
          const SizedBox(height: 10,),
                          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount:allLeaveRequest.length ,
              itemBuilder: (context, index){
            return   Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xf40000000)),
                ),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      ReusableText(title:  allLeaveRequest[index]['leaveRequestData']['from_date'],size: 13,weight: FontWeight.w700,color: Color(0xff000000),),

                      Icon(Icons.arrow_forward_ios,color: Color(0xff000000),size: 13,),
                      ReusableText(title: allLeaveRequest[index]['leaveRequestData']['return_date'],size: 13,weight: FontWeight.w700,color: Color(0xff000000),),
                      Spacer(),
                      Icon(Icons.more_vert,color: Color(0xf76888989),),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,children: [
                    Container(
                      height: 9,width: 9,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,color:  Color(0xffFF9900),
                      ),
                    ),
                    const SizedBox(width: 10,),

                    const ReusableText(title: "Monday",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),),
                    const SizedBox(width: 40,),
                    Container(
                      height: 9,width: 9,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,color:  Color(0xffA08EB7),
                      ),
                    ),
                    const SizedBox(width: 10,),

                    const ReusableText(title: "Saturday",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),),

                    const Spacer(),
                  ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                       Expanded(
                            flex:4,

                           child:
                       ReusableText(
                         title: allLeaveRequest[index]['detail'],size: 12,weight: FontWeight.w700,color: Color(0xf87000000),)),
                      SizedBox(width:5),
                      Expanded(child:  ReusableText(title: "06 Days",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),)),
                    ],
                  ),
                  const Divider(thickness: 1,height: 2,color: Color(0xff3F4A4F),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: 18,width: 18,
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,color:allLeaveRequest[index]['status']=="pending"?  Color(0xffFF9900): Color(0xffFF0000),
                        ),
                        child:  Icon(allLeaveRequest[index]['status']=="pending"?Icons.remove: Icons.close,color: Colors.white,size: 13,),
                      ),
                      const SizedBox(width: 10,),
                       ReusableText(title: "Leave request ${'${allLeaveRequest[index]['status']}'}",size: 13,weight: FontWeight.w700,color: Color(0xf87000000),),
                      const Spacer(),
                      Container(
                        height: 18,width: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,color: AppColors.mainColor,
                        ),
                        child: const Icon(Icons.download,color: Colors.white,size: 13,),
                      ),
                      const SizedBox(width: 10,),
                      const ReusableText(title: "Download",size: 13,weight: FontWeight.w700,color: AppColors.mainColor,),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ],
              ),
              ),
            );
          }),

              ],
            ),
          ),
        ),

        // Floating Action Button
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton.extended(
            elevation: 0.0,
            backgroundColor:Color(0xff8462AD),
            icon: Icon(Icons.add, color: Colors.white, size: 18),
            label: Text('Apply New Leave', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LeaveRequest()));

            },
          ),
        ),
      ],
    );
  }
}
