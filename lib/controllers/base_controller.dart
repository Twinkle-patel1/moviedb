import 'dart:convert';

import 'package:movie_db/commons/app_colors.dart';
import 'package:movie_db/commons/constants/enums/view_state.dart';
import 'package:movie_db/commons/utils/log_utils.dart';
import 'package:movie_db/data_source/network/api_endpoints.dart';
import 'package:movie_db/data_source/network/api_requests.dart';
import 'package:movie_db/data_source/network/base_exception.dart';
import 'package:movie_db/services/locator.dart';
import 'package:movie_db/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class BaseController extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  BuildContext? context;

  ///view state to identify the state of view
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  @mustCallSuper
  void onInIt(){}
  void printWrapped(String text) {
    final pattern = RegExp('.{2,2048}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
  void setState(ViewState viewState) {
    if (_state != viewState) _state = viewState;
    notifyListeners();
  }

  pop() {
    _navigationService.pop();
  }

  redirectToPage(String routeName, {dynamic arguments}) {
    _navigationService.navigateTo(routeName, arguments: arguments);
  }

  redirectWithClearBackStack(String routeName, {dynamic arguments}) {
    _navigationService.popAllAndNavigateTo(routeName, arguments: arguments);
  }

  Future<void> redirectToPageWithAwait(String routeName,
      {dynamic arguments}) async {
    await _navigationService.navigateTo(routeName, arguments: arguments);
    return;
  }

  redirectWithPop(String routeName, {dynamic arguments}) {
    _navigationService.navigateToAndPop(routeName, arguments: arguments);
  }

  void showMessage(String message, bool isError) {
    try {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor:
              isError ? AppColors.errorColor : AppColors.secondaryGreenColor,
          textColor: AppColors.white,
          fontSize: 16.0);
    } on BaseException catch (e) {
      LogUtils.writeLog(message: e.message, tag: "showErrorMessage");
    }
  }

}
