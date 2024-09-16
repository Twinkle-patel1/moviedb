import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../commons/constants/enums/view_state.dart';
import '../../commons/utils/log_utils.dart';
import '../../data_source/network/api_endpoints.dart';
import '../../data_source/network/base_exception.dart';
import '../../models/networks_model/now_playing_model.dart';
import '../base_controller.dart';
import 'package:http/http.dart' as http;

class MovieScreenViewController extends BaseController {
  MovieScreenViewController(BuildContext buildContext) {
    context = buildContext;
  }

  TextEditingController customerProductNameController = TextEditingController();
  MovieNowPlayingModel? nowPlayingData;
  List<Results> nowPlayingResultList = [];


  void initialise() async{
    getNowPlayingList();
    // getSalesOrderList();
    // date = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();
    // username = (await getUsername())!;
    // getNotificationList();
    // getPettyCashBalance();
    notifyListeners();
  }

  void getNowPlayingList() async {
    nowPlayingResultList.clear();
    setState(ViewState.busy);

    try {
      final Map<String, String> headers = {
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzFmOWVhY2VmOThmMWYxYTY2ZTc1MmY2ZmYyNGUzYyIsIm5iZiI6MTcyNjUwNTE3OC4zNzMxMDYsInN1YiI6IjY2ZTg1ZTRiOWRmYmJkZjBlNmQwMTg1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ih3NenmGIV2H59AQTfSvKjsRfjb6idbw1H_y81R23KU"
      };

      // Response? response = await APIRequest()
      //     .getAPICall("${ApiEndPoints.getNowPlayingURL}", headers);

      final response = await http.get(Uri.parse("${ApiEndPoints.getNowPlayingURL}"), headers: headers);

      dynamic data = json.decode(response.body);
      if (response.statusCode == 200) {
        nowPlayingData = MovieNowPlayingModel.fromJson(data);
        nowPlayingResultList = nowPlayingData?.results ?? [];
        setState(ViewState.idle);
      }
      if(response.statusCode != 200){
        Map msg = json.decode(response.body);
        final decodedMap = json.decode(msg['_server_messages']);
        print('---------------------------------$msg');
        showMessage(decodedMap.toString(), true);
        setState(ViewState.idle);
      }
    } on BaseException catch (error) {
      LogUtils.writeLog(
          message: error.message,
          tag: "Now Playing List :getNowPlayingList");
      showMessage("Code : ${error.code} Error : ${error.message}", true);

      setState(ViewState.idle);
    }
  }


}
