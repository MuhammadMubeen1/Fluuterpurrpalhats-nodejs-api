import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purpleheatsdev/themes/app_colors.dart';


import '../../../../../constant/reusable_text/reusable_text.dart';
import 'package:http/http.dart' as http;

class SummaryScreen extends StatefulWidget {

   SummaryScreen({required this.planDetails, required this.subscribePlan,required this.plansPropertyId,key});
  var planDetails;
   var subscribePlan;
   var plansPropertyId;


  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String? paymentMethod;
  bool isLoading = false;
  generateInvoice() async{
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://admin.purplehats.com/api/payments/invoices'));
    request.body = json.encode({
      "login_session_id": 481,
      "tenant_id": 481,
      "property_id": widget.plansPropertyId,
      "description":  widget.planDetails['name'],
      "type": "services",
      "task_id":  widget.subscribePlan['id'],
      "sub_total":  widget.planDetails['price'],
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
     // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
     var message = body['message'];
      Fluttertoast.showToast(
          msg: "Status ${message}"
      );
      setState(() {
        isLoading = false;
      });
    }
     else if(response.statusCode == 401){
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      var message = body['message'];
      Fluttertoast.showToast(
          msg: "Status ${message}"
      );
      setState(() {
        isLoading = false;
      });
    }
    else {
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
          elevation: 0,
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.mainColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const ReusableText(
            title: 'Summary',
            size: 18,
            weight: FontWeight.w700,
            color: Color(0xff593D77),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const ReusableText(
                title: 'Package Details',
                size: 20,
                weight: FontWeight.w700,
                color: Color(0xff593D77),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                   ReusableText(
                    title: widget.planDetails['name'],
                    size: 23,
                    weight: FontWeight.w600,
                    color: Color(0xff101719),
                  ),
                  const Spacer(),
                  RichText(
                    text:  TextSpan(
                        text:  widget.planDetails['price'],
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25, color: AppColors.mainColor),
                        children: [

                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const ReusableText(
                title: 'One Time Plan',
                size: 16,
                weight: FontWeight.w600,
                color: Color(0xffFFCC00),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text:  TextSpan(
                    text: 'Start Date : ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Color(0xff8A8A8F)),
                    children: [
                      TextSpan(
                          text: widget.subscribePlan['start_at'],
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Color(0xff8A8A8F)))
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text:  TextSpan(
                    text: 'Expiry Date : ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Color(0xff8A8A8F)),
                    children: [
                      TextSpan(
                          text: widget.subscribePlan['end_at'],
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Color(0xff8A8A8F)))
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text:  TextSpan(
                    text: 'Status :   ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Color(0xff8A8A8F)),
                    children: [
                      TextSpan(
                          text:  widget.subscribePlan['status'],
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Color(0xff8A8A8F)))
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  const ReusableText(
                    title: 'Package Method',
                    size: 23,
                    weight: FontWeight.w600,
                    color: AppColors.mainColor,
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    paymentMethod == 'Invoice'
                        ? const BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 2,
                      color: Color(0x40252525),
                    )
                        : const BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 0,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 0,
                      color: Color(0x40252525),
                    ),
                  ],
                  color: const Color(0xffFFFFFF),
                  border: Border.all(color: const Color(0xffE8E6EA)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage('assets/images/home_screen/payment_method/image 5.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    const ReusableText(
                      title: 'Invoice',
                      size: 18,
                      weight: FontWeight.w700,
                      color: Color(0xff593D77),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 30,
                      child: RadioListTile(
                        value: "Invoice",
                        groupValue: paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value.toString();

                            print("helo ${paymentMethod}");
                          });
                        },
                        activeColor: const Color(0xFF593D77), // Set the selected color
                        fillColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(
                                0xFF593D77); // Set the unselected color when the radio button is selected
                          }
                          return const Color(
                              0xff593D77); // Set the unselected color when the radio button is not selected
                        }),
                      ),
                    )
                  ],
                ),
              ),
               SizedBox(
                height: 20,
              ),


              isLoading?Center(child: CircularProgressIndicator()):
              Expanded(

                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      paymentMethod == "Invoice" ? generateInvoice():  Fluttertoast.showToast(
                          msg: "Please Select method"
                      );

                    },
                    child: Container(
                      height: 41,
                      width: MediaQuery.sizeOf(context).width * 0.60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:  paymentMethod == "Invoice" ? AppColors.mainColor: Colors.purple.shade200,


                      ),
                      child: const Center(
                          child: ReusableText(
                        title: 'Generate Invoice',
                        size: 12,
                        weight: FontWeight.w700,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
