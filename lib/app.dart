import 'package:movie_db/routes/route_names.dart';
import 'package:movie_db/routes/router.dart';
import 'package:movie_db/services/locator.dart';
import 'package:movie_db/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_,child) {
        return OverlaySupport.global(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute:  RoutePaths.bottomViewRoute,
            navigatorKey: locator<NavigationService>().navigationKey,
            onGenerateRoute: generateRoute,
          ),
        );
      },
      designSize: const Size(392.72727272727275,783.2727272727273),
    );
  }
}
