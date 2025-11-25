import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:purpleheatsdev/module/Tanent/new_design/tanent_side/tanent_home_screen/summary_screen.dart';


import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';

class FacilitiesDetails extends StatefulWidget {
  FacilitiesDetails({required this.serivesDetails, key});
  var serivesDetails;

  @override
  State<FacilitiesDetails> createState() => _FacilitiesDetailsState();
}

class _FacilitiesDetailsState extends State<FacilitiesDetails> {
  int currentIndex = 0;
  String? gender;
  var plans = [];
  var plansPropertyId ;
  var status ;
  bool isLoading = true;
  bool isSubscribeLoading = false;
  servicePlans() async {
    var request = http.Request(
        'GET', Uri.parse('https://admin.purplehats.com/api/service/packages/${widget.serivesDetails['id']}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      plansPropertyId = body['data'];
          plans =plansPropertyId['packages'];
    print("plansPropertyId${plansPropertyId['property_id']}");
      setState(() {
        plans;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.reasonPhrase);
    }
  }
  subscribePackage(int id , int curentIndex)async{
    setState(() {

      isSubscribeLoading = true;
    });
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://admin.purplehats.com/api/facilities/subscribe'));
    request.body = json.encode({
      "login_session_id": 481,
      "package_id": id,
      "status": "inactive"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
     // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      status = body['data'];
      var message = status['status'];
      setState(() {

        isSubscribeLoading = false;
      });

      Fluttertoast.showToast(
        msg: "Status ${message}"
      );
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentMethodScreen()));
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  SummaryScreen( planDetails: plans[curentIndex], subscribePlan: status, plansPropertyId: plansPropertyId['property_id'],)));
    }
    else {
    print(response.reasonPhrase);
    setState(() {

      isSubscribeLoading = false;
    });
    }

  }

  @override
  void initState() {
    servicePlans();
    print("init work");
    super.initState();
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
            title: 'Facility Detail',
            size: 18,
            weight: FontWeight.w700,
            color: Color(0xff593D77),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image(
                  height: 200,
                  width: MediaQuery.sizeOf(context).width * 1,
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.serivesDetails['image'])),
              const SizedBox(
                height: 10,
              ),
              ReusableText(
                title: widget.serivesDetails['name'],
                size: 18,
                weight: FontWeight.w700,
                color: const Color(0xff593D77),
              ),
              const SizedBox(
                height: 10,
              ),
              ReusableText(
                title: widget.serivesDetails['description'],
                size: 12,
                weight: FontWeight.w500,
                color: const Color(0xff979797),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
                height: 2,
                color: Color(0xffF5F4F8),
              ),
              const SizedBox(
                height: 10,
              ),
              const ReusableText(
                title: 'Select Plan',
                size: 18,
                weight: FontWeight.w700,
                color: Color(0xff593D77),
              ),
              const SizedBox(
                height: 10,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: plans.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 0.65,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                    blurStyle: BlurStyle.normal,
                                    spreadRadius: 2,
                                    color: Color(0x40252525),
                                  ),
                                ],
                                border: index == 0
                                    ? Border.all(
                                        color: const Color(0xffFFFFFF),
                                      )
                                    : Border.all(
                                        color: AppColors.mainColor,
                                      ),
                                borderRadius: BorderRadius.circular(10),
                                gradient: index == 0
                                    ? const LinearGradient(colors: [
                                        Color(0xff593D77),
                                        Color(0xff8867AB),
                                      ])
                                    : const LinearGradient(colors: [
                                        Color(0xffF1F1F1),
                                        Color(0xffF1F1F1),
                                      ])),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  children: [
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15), color: const Color(0xffFF9900)),
                                      child: const Center(
                                          child: ReusableText(
                                        title: 'POPULAR',
                                        size: 14,
                                        weight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),
                                      )),
                                    )
                                  ],
                                ),

                                ReusableText(
                                  title: plans[index]['name'],
                                  size: 20,
                                  weight: FontWeight.w600,
                                  alignment: TextAlign.center,
                                  color: index == 0 ? const Color(0xffD8D8D8) : const Color(0xff000000),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ReusableText(
                                  title: "${plans[index]['price']}",
                                  size: 15,
                                  weight: FontWeight.w700,
                                  color: index == 0 ? const Color(0xffFFFFFF) : AppColors.mainColor,
                                ),

                                Container(
                                  height: 2,
                                  width: 90,
                                  color: const Color(0xffFFFFFF),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                Expanded(
                                    child: ReusableText(
                                  title: plans[index]['description'],
                                  alignment: TextAlign.center,
                                  size: 10,
                                  weight: FontWeight.w500,
                                  color: index == 0 ? const Color(0xffCCCCCC) : const Color(0xff979797),
                                )),

                                const Expanded(
                                    child: SizedBox(
                                  height: 22,
                                )),
                                 isSubscribeLoading?const Center(child: CircularProgressIndicator(color: Colors.black,)):
                                GestureDetector(
                                  onTap: (){
                                    subscribePackage(plans[index]['id'], index);
                                  },
                                  child: Container(
                                    height: 32,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                    ),
                                    width: MediaQuery.sizeOf(context).width * 0.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index == 0 ? const Color(0xffFFFFFF) : AppColors.mainColor,
                                    ),
                                    child: Center(
                                        child: ReusableText(
                                            title: 'Subscribe',
                                            size: 14,
                                            weight: FontWeight.w700,
                                            color: index == 0 ? AppColors.mainColor : Colors.white)),
                                  ),
                                ),
                                //SizedBox(height: 10,),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
