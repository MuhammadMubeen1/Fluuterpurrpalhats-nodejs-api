import 'package:flutter/material.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';
import '../../../../../themes/app_colors.dart';
import 'facilities_details.dart';

class AllFacilitiesScreen extends StatefulWidget {
  AllFacilitiesScreen({required this.facilities, key});
  var facilities = [];
  @override
  State<AllFacilitiesScreen> createState() => _AllFacilitiesScreenState();
}

class _AllFacilitiesScreenState extends State<AllFacilitiesScreen> {
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
          title: 'Facilities',
          size: 18,
          weight: FontWeight.w700,
          color: Color(0xff593D77),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Color(0xff5B5B5B),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: widget.facilities.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 20 / 16,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FacilitiesDetails(serivesDetails: widget.facilities[index])));
                  },
                  child: Container(
                    height: 111,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        border: Border.all(color: const Color(0xff593D77)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Image(
                          height: 80,
                          image: NetworkImage(widget.facilities[index]['image'].toString()),
                        ),
                        ReusableText(
                          title: widget.facilities[index]['name'],
                          size: 12,
                          weight: FontWeight.w500,
                          color: const Color(0xff593D77),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
