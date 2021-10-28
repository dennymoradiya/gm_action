// ignore_for_file: non_constant_identifier_names

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:ActionGame/api/topgame_connection.dart';
import 'package:ActionGame/model/top_gamemodel.dart';

class Controller extends GetxController {
  var currentIndex = 0.obs;
  RxBool isinternetconnect = false.obs;

  void checkinternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile
        ||
            connectivityResult == ConnectivityResult.wifi
        ) {
      print("connect");
      isinternetconnect.value = true;
    } else {
      print("not connect");
      print("connection ${connectivityResult}");
    }
  }
}
