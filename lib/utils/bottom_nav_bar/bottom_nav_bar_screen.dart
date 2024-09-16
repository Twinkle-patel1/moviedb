import 'package:flutter/material.dart';
// import 'package:movie_db/screens/hospital/job_title_list.dart';
// import 'package:movie_db/screens/settings/setting_screen.dart';
// import 'package:movie_db/utils/size.dart';
// import 'package:movie_db/widgets/common_bottom_nav_bar.dart';

import '../../screens/movie_screen/movie_screen_view.dart';
import 'common_nav_bar.dart';

class BottomNavBarScreen extends StatefulWidget {
  int index;
  BottomNavBarScreen({super.key, required this.index});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int BottomCurrentIndex = 0;

  ///<----------------------> List of pages <---------------------->///

  List pages = [
    MovieScreenView(),
    Container()
    // JobTitleList(),
    // SettingScreen(),
    // CashierFavouriteScreen(),
    // Container(),
    // CashierManualPrice(),
    // Container(),
    // ProfileModule(),
// DashboardScreen(),
  ];

  ///<---------------------->on item taped<---------------------->///

  @override
  void initState() {
    BottomCurrentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // height = MediaQuery.of(context).size.height;
    // width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBody: true,

        bottomNavigationBar: CommonBottomNavBar(
          index: BottomCurrentIndex,
          onSuccess: (val) {
            setState(
                  () {
                BottomCurrentIndex = val;
              },
            );
          },
        ),

        ///<----------------------> bottom nav bar <---------------------->///

        body: pages[BottomCurrentIndex],
      ),
    );
  }
}
