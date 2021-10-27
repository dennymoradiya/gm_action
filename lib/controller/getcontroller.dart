// ignore_for_file: non_constant_identifier_names

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:gm_action/api/topgame_connection.dart';
import 'package:gm_action/model/top_gamemodel.dart';

class Controller extends GetxController {
  var currentIndex = 0.obs;
  RxBool isinternetconnect = true .obs;

  void checkinternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    isinternetconnect.value == true;
  }
}

     

  
  

  
}