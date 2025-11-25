import 'package:flutter/material.dart';

import '../../components/color.dart';
import '../../components/drawer.dart';
import '../../components/global.dart';
import '../../components/string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> imgList = [
    'assets/svgs/maintaince.png',
    'assets/svgs/electricity.jpg',
  ];
  List<String> services = [
    'Plumbing',
    'Electricity',
  ];
  List<String> serviceImage = [
    'assets/svgs/Laundry.png',
    'assets/svgs/CarWash.png',
    'assets/svgs/Carparking.png',
    'assets/svgs/House.png',
    'assets/svgs/Valet.png',
    'assets/svgs/poll.png',
  ];
  List<String> serviceName = [
    'Laundry',
    'Car Wash',
    'VIP Parking',
    'House Keeping',
    'Valet Service',
    'Pool',
  ];
  List<Color> servicesColor = [
    const Color(0xffFF0000),
    const Color(0xff1CCBF3),
    const Color(0xffF2E91C),
    const Color(0xff593D77),
    const Color(0xff36F176),
    const Color(0xff640166),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: WHITE_COLOR,
          iconTheme: const IconThemeData(
            color: PRIMARY_COLOR, //change your color here
          ),
          title: const Text("Home", style: TextStyle(color: PRIMARY_COLOR)),
        ),
        drawer: DrawerProfile(),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello", style: boldTextStyle(context, PURPLE_COLOR, 28)),
                      const SizedBox(height: 2),
                      Text("Skndr Bkht", style: boldTextStyle(context, PRIMARY_COLOR, 28)),
                      const SizedBox(height: 2),
                      Text("Good Morning", style: hintTextStyle(context, GREY)),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MyInfo()),
                    // );
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const CircleAvatar(
                          radius: 60,
                          backgroundColor: WHITE_COLOR,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              Constants.profile_IMGG,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 20,
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.edit, color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.white,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 4),
                                  color: Colors.black.withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 3,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Maintenance Services",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 270,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    imgList[index],
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(services[index], style: const TextStyle(color: Colors.black, fontSize: 19)),
                              ),
                            ],
                          );
                        }),
                  ),
                  const Text(
                    "General Services",
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 155,
                    ),
                    itemCount: 6,
                    itemBuilder: buildListItem,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  Widget buildListItem(BuildContext context, int index) {
    return InkWell(
      child: Card(
        elevation: 0,
        color: servicesColor[index].withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                serviceImage[index],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                serviceName[index],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
