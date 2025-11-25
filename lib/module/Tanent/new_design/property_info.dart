import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';
import 'my_properties.dart';

class PropertInfo extends StatefulWidget {
  // const PropertInfo({super.key});

  @override
  State<PropertInfo> createState() => _PropertInfoState();
}

class _PropertInfoState extends State<PropertInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "ERU-18",
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Color(0xff593D77),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        //<Widget>[]
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          color: const Color(0xff593D77),
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 19),
            child: Text("Property Info",
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff593D77), fontSize: 18, fontWeight: FontWeight.w700))),
          ),
          const SizedBox(
            height: 38,
          ),
          Center(
            child: Container(
              width: 284,
              height: 154,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/perporty.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    "ID:",
                    style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Color(0xff593D77), fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Type:",
                    style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Color(0xff593D77), fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Property:",
                    style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Color(0xff593D77), fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Area",
                    style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Color(0xff593D77), fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Rent Amount:",
                    style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Color(0xff593D77), fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Face Value:",
                    style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Color(0xff593D77), fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Book Value:",
                    style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Color(0xff593D77), fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 84,
            ),
            Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 15),
              Text(
                "EDU-18",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff8A8A8F), fontSize: 13, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 15),
              Text(
                "House",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff8A8A8F), fontSize: 13, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 15),
              Text(
                "Lake View City",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff8A8A8F), fontSize: 13, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 15),
              Text(
                "5 Marla",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff8A8A8F), fontSize: 13, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 15),
              Text(
                "25000",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff8A8A8F), fontSize: 13, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 15),
              Text(
                "20000",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff8A8A8F), fontSize: 13, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 15),
              Text(
                "30000",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff8A8A8F), fontSize: 13, fontWeight: FontWeight.w400)),
              ),
            ]))
          ]),
          const SizedBox(
            height: 48,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff999CAD),
                minimumSize: Size(295, 43),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
                // Button onPressed logic
              },
              child: Text(
                'Pending Bills',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff593D77), fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff999CAD),
                minimumSize: Size(295, 43),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Myproperties()));
                // Button onPressed logic
              },
              child: Text(
                'Invoice History',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff593D77), fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff999CAD),
                minimumSize: Size(295, 43),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                // Button onPressed logic
              },
              child: Text(
                'View Lease Agreement',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xff593D77), fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    ); //AppBar
  }
}
