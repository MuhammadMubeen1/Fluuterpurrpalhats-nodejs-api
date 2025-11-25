import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../module/Tanent/new_design/worker_agent_side/dashboard/dashboard_screen.dart';
import '../../module/Worker/all_leaves.dart';
import '../../module/Worker/my_task.dart';
import '../../module/Worker/side_menu_worker.dart';
import '../../themes/app_colors.dart';
import '../reusable_text/reusable_text.dart';

class BottomNavigationAppBarAgentSide extends StatefulWidget {
  @override
  _BottomNavigationAppBarAgentSideState createState() => _BottomNavigationAppBarAgentSideState();
}

class _BottomNavigationAppBarAgentSideState extends State<BottomNavigationAppBarAgentSide> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const DashBoardScreen(),
    AllLeavesScreen(),
    const SizedBox(),
    MyTask(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SideMenu(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          // leading: _currentIndex == 0
          //     ? IconButton(
          //         icon: const Icon(
          //           Icons.menu,
          //           color: AppColors.mainColor,
          //         ),
          //         onPressed: () {
          //           Scaffold.of(context).openDrawer();
          //         },
          //       ): SizedBox(),
          //     :
          // _currentIndex == 1
          //         ? IconButton(
          //             icon: const Icon(
          //               Icons.menu,
          //               color: AppColors.mainColor,
          //             ),
          //             onPressed: () {},
          //           )
          //         : const SizedBox(),
          title: _currentIndex == 1
              ? const ReusableText(
                  title: 'Purple Hats',
                  size: 18,
                  weight: FontWeight.w700,
                  color: AppColors.mainColor,
                )
              : _currentIndex == 0
                  ? const ReusableText(
                      title: 'Purple Hats',
                      size: 18,
                      weight: FontWeight.w700,
                      color: AppColors.mainColor,
                    )
                  : _currentIndex == 3
                      ? const ReusableText(
                          title: 'Tasks',
                          size: 18,
                          weight: FontWeight.w700,
                          color: AppColors.mainColor,
                        )
                      : const SizedBox(),
          actions: [
            _currentIndex == 1
                ? SvgPicture.asset(
                    'assets/icons/bottombar_worker/messages.svg',
                    color: AppColors.mainColor,
                  )
                : _currentIndex == 0
                    ? SvgPicture.asset(
                        'assets/icons/bottombar_worker/messages.svg',
                        color: AppColors.mainColor,
                      )
                    : Container(),
            _currentIndex == 3
                ? SvgPicture.asset(
                    'assets/icons/bottombar_worker/messages.svg',
                    color: AppColors.mainColor,
                  )
                : _currentIndex == 3
                    ? SvgPicture.asset(
                        'assets/icons/bottombar_worker/messages.svg',
                        color: AppColors.mainColor,
                      )
                    : Container(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomTab(
                onTap: () {
                  onTabTapped(0);
                },
                indicatorColor: _currentIndex == 0 ? AppColors.mainColor : Colors.transparent,
                title: 'Dashboard',
                icon: 'assets/icons/bottombar_worker/Vector.svg',
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(1);
                },
                indicatorColor: _currentIndex == 1 ? AppColors.mainColor : Colors.transparent,
                title: 'Leaves',
                icon: 'assets/icons/bottombar_worker/Vector (1).svg',
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(2);
                },
                indicatorColor: _currentIndex == 2 ? AppColors.mainColor : Colors.transparent,
                title: 'Notifications',
                icon: 'assets/icons/bottombar_worker/Group.svg',
              ),
              BottomTab(
                onTap: () {
                  onTabTapped(3);
                },
                indicatorColor: _currentIndex == 3 ? AppColors.mainColor : Colors.transparent,
                title: 'Tasks',
                icon: 'assets/icons/bottombar_worker/Vector (2).svg',
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  final String title;
  final Color indicatorColor;
  final String icon;
  final VoidCallback onTap;

  const BottomTab({
    key,
    required this.title,
    required this.indicatorColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(height: 2, width: 70, color: indicatorColor),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 23,
            width: 22,
            child: SvgPicture.asset(

              icon,
              color: AppColors.mainColor,fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          ReusableText(
            title: title,
            size: 10,
            weight: FontWeight.w500,
            color: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}
