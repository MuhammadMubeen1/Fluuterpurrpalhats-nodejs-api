import 'package:flutter/material.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/invoice/maintenance.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/invoice/paid.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/invoice/rent.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/invoice/service.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/invoice/unpaid.dart';



class tabsview extends StatefulWidget {
  const tabsview();

  @override
  State<tabsview> createState() => _tabsviewState();
}

class _tabsviewState extends State<tabsview> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                      print("index==${index}");
                    });
                  },
                  child: Container(
                    width: 130,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index == 0 ? Colors.purple : Colors.white,
                        border: Border.all(
                            color: index == 0 ? Colors.purple : Colors.grey)),
                    child: Center(
                        child: Text(
                      "Rent",
                      style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.grey,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                      print("index==${index}");
                    });
                  },
                  child: Container(
                    width: 130,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index == 1 ? Colors.purple : Colors.white,
                        border: Border.all(
                            color: index == 1 ? Colors.purple : Colors.grey)),
                    child: Center(
                        child: Text(
                      "Maintenance",
                      style: TextStyle(
                        color: index == 1 ? Colors.white : Colors.grey,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 2;
                      print("index==${index}");
                    });
                  },
                  child: Container(
                    width: 130,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index == 2 ? Colors.purple : Colors.white,
                        border: Border.all(
                            color: index == 2 ? Colors.purple : Colors.grey)),
                    child: Center(
                        child: Text(
                      "Services",
                      style: TextStyle(
                        color: index == 2 ? Colors.white : Colors.grey,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 3;
                      print("index==${index}");
                    });
                  },
                  child: Container(
                    width: 130,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index == 3 ? Colors.purple : Colors.white,
                        border: Border.all(
                            color: index == 3 ? Colors.purple : Colors.grey)),
                    child: Center(
                        child: Text(
                      "Paid",
                      style: TextStyle(
                        color: index == 3 ? Colors.white : Colors.grey,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 4;
                      print("index==${index}");
                    });
                  },
                  child: Container(
                    width: 130,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index == 4 ? Colors.purple : Colors.white,
                        border: Border.all(
                            color: index == 4 ? Colors.purple : Colors.grey)),
                    child: Center(
                        child: Text(
                      "Unpaid",
                      style: TextStyle(
                        color: index == 4 ? Colors.white : Colors.grey,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          index == 0 ? Expanded(child: rent()) : Container(),
          index == 1 ? Expanded(child: maintenance()) : Container(),
          index == 2 ? Expanded(child: service()) : Container(),
          index == 3 ? Expanded(child: paid()) : Container(),
          index == 4 ? Expanded(child: unpaid()) : Container(),
        ],
      ),
    );
  }
}
