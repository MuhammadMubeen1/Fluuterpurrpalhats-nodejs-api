// import 'package:flutter/material.dart';
//
// import '../../../../../constant/reusable_text/reusable_text.dart';
// import '../../../../../themes/app_colors.dart';
//
// class RequestMaintenance extends StatefulWidget {
//   const RequestMaintenance({key});
//
//   @override
//   State<RequestMaintenance> createState() => _RequestMaintenanceState();
// }
//
// class _RequestMaintenanceState extends State<RequestMaintenance> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child:
//
//     Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const ReusableText(
//           title: "Request Maintenance",
//           color: Color(0xff593D77),
//         ),
//         leading: IconButton(
//           icon: const Icon( Icons.arrow_back,
//             color: Colors.black,), onPressed: () { Navigator.pop(context); },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: ListView(
//           children: [
//             const SizedBox(height: 20,),
//             const ReusableText(
//               title: "Add a Title ",
//               color: Color(0xff593D77),
//             ),
//             const SizedBox(height: 10,),
//             Container(
//               height: 54,
//               width: MediaQuery.sizeOf(context).width * 0.90,
//               decoration: BoxDecoration(
//                   color: const Color(0xffFFFFFF),
//                   borderRadius: BorderRadius.circular(15)),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: const BorderSide(
//                           color: Color(0xffE8E6EA),
//                         )),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: const BorderSide(
//                           color: Color(0xffE8E6EA),
//                         )),
//                     hintText: 'Password',
//                     hintStyle: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         color: Color(0xff8F8F8F))),
//               ),
//             ),
//             const SizedBox(height: 10,),
//
//             const ReusableText(
//               title: "Add a Description",
//               color: Color(0xff593D77),
//             ),
//             const SizedBox(height: 10,),
//
//             Container(
//               width: MediaQuery.sizeOf(context).width * 0.90,
//               decoration: BoxDecoration(
//                   color: const Color(0xffFFFFFF),
//                   borderRadius: BorderRadius.circular(15)),
//               child: TextFormField(
//                 maxLines: 5,
//                 decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: const BorderSide(
//                           color: Color(0xffE8E6EA),
//                         )),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: const BorderSide(
//                           color: Color(0xffE8E6EA),
//                         )),
//                     hintText: 'Write description here',
//                     hintStyle: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         color: Color(0xff8F8F8F))),
//               ),
//             ),
//             const SizedBox(height: 20,),
//
//             const Row(
//               children: [
//                 ReusableText(title: "Select date of visit",size:16 ,weight: FontWeight.w700,color: AppColors.mainColor,),
//                 Spacer(),
//                 ReusableText(
//                   title: "today",
//                   color: Color(0xffC0C0C0),
//                   size: 13,weight: FontWeight.w700,
//                 ),
//                 SizedBox(width: 10,),
//                 Icon(Icons.calendar_month),
//               ],
//             ),
//             const SizedBox(height: 10,),
//             const Row(
//               children: [
//                 ReusableText(title: "Select Time of visit",size:16 ,weight: FontWeight.w700,color: AppColors.mainColor,),
//                 Spacer(),
//                 ReusableText(
//                   title: "12:40",
//                   color: Color(0xffC0C0C0),
//                   size: 13,weight: FontWeight.w700,
//                 ),
//                 SizedBox(width: 10,),
//                 Icon(Icons.calendar_month),
//               ],
//             ),
//             const SizedBox(height: 20,),
//             const Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                Expanded(
//                  child: Divider(
//                    thickness: 2,height: 2,color: AppColors.mainColor,
//                  ),
//                ),
//                 SizedBox(width: 10,),
//                 ReusableText(
//                   title: "Your Info",
//                   size: 10,weight: FontWeight.w700,color: AppColors.mainColor,
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: Divider(
//                     thickness: 2,height: 2,color: AppColors.mainColor,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20,),
//             const Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ReusableText(
//                       title: "tanent :  ",
//                       size: 13,color: AppColors.mainColor,
//                       weight: FontWeight.w700,
//                     ),
//                     SizedBox(height: 10,),
//                     ReusableText(
//                       title: "Address:",
//                       size: 13,color: AppColors.mainColor,
//                       weight: FontWeight.w700,
//                     ),
//                     SizedBox(height: 10,),
//                     ReusableText(
//                       title: "Phone:",
//                       size: 13,color: AppColors.mainColor,
//                       weight: FontWeight.w700,
//                     ),
//                     SizedBox(height: 10,),
//                     ReusableText(
//                       title: "Email:",
//                       size: 13,color: AppColors.mainColor,
//                       weight: FontWeight.w700,
//                     ),
//                     SizedBox(height: 10,),
//                   ],
//                 ),
//                 SizedBox(width: 20,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ReusableText(
//                       title: "jhon deo",
//                       color: Color(0xff8A8A8F),
//                       size: 13,weight: FontWeight.w400,
//                     ),
//                     SizedBox(height: 10,),
//                     ReusableText(
//                       title: "Apart # 101 Oregon, 945368 CA",
//                       color: Color(0xff8A8A8F),
//                       size: 13,weight: FontWeight.w400,
//                     ),
//                     SizedBox(height: 10,),
//                     ReusableText(
//                       title: "+1 111 0222 33",
//                       color: Color(0xff8A8A8F),
//                       size: 13,weight: FontWeight.w400,
//                     ),
//                     SizedBox(height: 10,),
//                     ReusableText(
//                       title: "johndoe@gmail.com",
//                       color: Color(0xff8A8A8F),
//                       size: 13,weight: FontWeight.w400,
//                     ),
//                     SizedBox(height: 10,),
//                   ],
//                 ),
//
//
//               ],
//             ),
//             const SizedBox(height: 80,),
//             Center(
//               child: GestureDetector(
//
//                 child: Container(
//                   height: 48,
//
//                   width: MediaQuery.sizeOf(context).width * 0.80,
//
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: AppColors.mainColor.withOpacity(0.20),
//                   ),
//                   child: const Center(
//                       child: ReusableText(
//                         title: 'Send Request',
//                         size: 14,
//                         weight: FontWeight.w700,
//                         color: AppColors.mainColor,
//                       )),
//                 ),
//               ),
//             ), ],
//         ),
//       ),
//     )
//
//     );
//   }
// }
//
