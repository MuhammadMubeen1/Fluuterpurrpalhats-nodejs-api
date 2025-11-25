import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final List<String> imgList = [
  "assets/images/sliderpicture.png",
  "assets/images/sliderpicture.png",
  "assets/images/sliderpicture.png",
  "assets/images/sliderpicture.png",
  "assets/images/sliderpicture.png",
  "assets/images/sliderpicture.png",
];
final List<String> image = [
  "assets/images/services.png",
  "assets/images/services.png",
  "assets/images/services.png",
];

final List<String> titles = [
  'Title 1',
  'Title 2',
  'Title 3',
  'Title 4',
  'Title 5',
];
final List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
];

final List<String> title = [
  "Title 1",
  "Title 2",
  "Title 3",
];
final List<String> imageUrs = [
  "assets/images/billpayment.png",
  "assets/images/requestmainten.png",
];

int currentIndex = 0;

class Homescreen extends StatefulWidget {
  //const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Lake City - Apt # 456",
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Color(0xff593D77),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        actions: <Widget>[
          IconButton(
            color: const Color(0xff593D77),
            icon: const Icon(
              Icons.notifications_outlined,
              size: 25,
            ),
            onPressed: () {},
          ), //IconButton
        ],
        //<Widget>[]
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          color: const Color(0xff593D77),
          icon: const Icon(
            Icons.menu,
            size: 25,
          ),
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ), //AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              height: 5,
              thickness: 5,
              color: Color(0xffF5F4F8),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, top: 19),
              child: Text("Announcements",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w700))),
            ),
            const SizedBox(
              height: 12,
            ),
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: imgList.length,

                  // imageSliders,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 1,
                      height: 157,
                      scrollDirection: Axis.horizontal,
                      autoPlay: false,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      }),
                  itemBuilder: (BuildContext context, int index, int realIndex) => Stack(
                    children: [
                      imageSliders[index],
                      Positioned(
                        top: 122,
                        child: Image.asset('assets/images/sliderimage.png'),
                      ),
                      Positioned(
                        top: 130,
                        left: 79,
                        child: Text(
                          'Soul Fest - 25th May, 2023',
                          style: GoogleFonts.roboto(
                              textStyle:
                                  const TextStyle(color: Color(0xff000000), fontSize: 15, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: DotsIndicator(
                dotsCount: imageSliders.length,
               position: current.toDouble(),
                decorator: DotsDecorator(
                  activeColor: const Color(0xff593D77),
                  size: const Size.square(9.0),
                  activeSize: const Size(25.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            const Divider(
              height: 5,
              thickness: 5,
              color: Color(0xffF5F4F8),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 19, bottom: 35),
              child: Text("Services",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w700))),
            ),
            SizedBox(
                height: 198,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 188,
                        width: 120,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.asset(
                                image[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                titles[index],
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
            const SizedBox(
              height: 23,
            ),
            const Divider(
              height: 5,
              thickness: 5,
              color: Color(0xffF5F4F8),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 19, bottom: 35),
              child: Text("Reminders",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w700))),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 330,
              height: 157,
              child: PageView.builder(
                itemCount: colors.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: 362,
                    height: 160,
                    decoration: BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text(
                        title[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(colors.length, (int index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: currentIndex == index ? 12.0 : 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              height: 5,
              thickness: 5,
              color: Color(0xffF5F4F8),
            ),
            const SizedBox(
              height: 19,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 19, bottom: 35),
              child: Row(
                children: [
                  Text("Quick Access",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.roboto(
                          textStyle:
                              const TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w700))),
                  const SizedBox(
                    width: 176,
                  ),
                  Text("See All",
                      textAlign: TextAlign.end,
                      style: GoogleFonts.roboto(
                          textStyle:
                              const TextStyle(color: Color(0xff5F457E), fontSize: 10, fontWeight: FontWeight.w700))),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrs.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 160,
                    height: 160,
                    margin: const EdgeInsets.only(left: 15),
                    child: Stack(
                      children: [
                        Image.asset(
                          imageUrs[index],
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

final List<Widget> imageSliders = imgList.map((item) {
  return Container(
      child: Image.asset(
    item,
    fit: BoxFit.fill,
  ));
}).toList();
