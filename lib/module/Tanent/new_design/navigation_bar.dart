import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:purpleheatsdev/module/Tanent/new_design/property_info.dart';

import 'document.dart';
import 'home_screen.dart';
import 'my_properties.dart';

class Nvigatiobar extends StatefulWidget {
  // const Nvigatiobar({super.key});

  @override
  State<Nvigatiobar> createState() => _NvigatiobarState();
}

class _NvigatiobarState extends State<Nvigatiobar> {
  int _selectedIndex = 0; //default index

  List<Widget> pages = [
    Homescreen(),
    Myproperties(),
    PropertInfo(),
    Document()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 69,
        child: CustomLineIndicatorBottomNavbar(
          selectedColor: Color(0xff593D77),
          unSelectedColor: Colors.black54,
          backgroundColor: Color(0xffF5F4F8),
          currentIndex: _selectedIndex,
          selectedIconSize: 20,
          unselectedIconSize: 20,
          selectedFontSize: 10,
          unselectedFontSize: 10,

          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          enableLineIndicator: true,
          lineIndicatorWidth: 2,
          indicatorType: IndicatorType.Top,
          // gradient: LinearGradient(
          //   colors: kGradients,
          // ),

          customBottomBarItems: [
            CustomBottomBarItems(
              label: 'Home',
              icon: Icons.home,
            ),
            CustomBottomBarItems(label: 'Property', icon: Icons.business),
            CustomBottomBarItems(label: 'Docs', icon: Icons.file_copy),
            CustomBottomBarItems(
              label: 'Profile',
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
