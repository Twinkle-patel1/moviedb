import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../commons/app_colors.dart';

class CommonBottomNavBar extends StatefulWidget {
  final int index;
  final Function onSuccess;
  CommonBottomNavBar({super.key, required this.index, required this.onSuccess});

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  int currentIndex = 0;
  void initState() {
    currentIndex = widget.index;

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.h,
        // color: Colors.black,
        child: Theme(
          data: ThemeData(
              splashColor: Colors.white,
              highlightColor: Colors.white),
          child: BottomAppBar(
            color: AppColors.white,
            elevation: 0,
            // padding: EdgeInsets.only(top:2.h),
            child: Container(
              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      currentIndex = 0;
                      widget.onSuccess(currentIndex);
                      setState(() {});
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.device_desktop,
                            // ImageConstant.moduleIcon,
                            color: currentIndex == 0
                                ? AppColors.primaryBlueColor
                                : Colors.grey,
                            size: 20.r,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'Movies',
                            style: TextStyle(color:  currentIndex == 0
                                ? AppColors.primaryBlueColor
                                : Colors.grey,),
                            // style: currentIndex == 0
                            //     ? interSemiBold.copyWith(
                            //     fontSize: width * 0.032)
                            //     : interNormal.copyWith(
                            //     fontSize: width * 0.032,
                            //     color: blue8F9098Color),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      currentIndex = 1;
                      widget.onSuccess(currentIndex);
                      setState(() {});
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search,
                            // ImageConstant.moduleIcon,
                            color: currentIndex == 1
                                ? AppColors.primaryBlueColor
                                : Colors.grey,
                            size: 24.r,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(color: currentIndex == 1
                                ? AppColors.primaryBlueColor
                                : Colors.grey,),
                            // style: currentIndex == 1
                            //     ? interSemiBold.copyWith(
                            //     fontSize: width * 0.032)
                            //     : interNormal.copyWith(
                            //     fontSize: width * 0.032,
                            //     color: blue8F9098Color),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}