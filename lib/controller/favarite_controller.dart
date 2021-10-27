import 'package:get/get.dart';
import 'package:ActionGame/model/hive_favarite.dart';
import 'package:hive/hive.dart';

class favaritecontroller extends GetxController {
  RxList favaritelist = [].obs;
  List datalist = [].obs;
  void getFavlist() async {
    var box = await Hive.openBox<DataModel>("favaritegamebox");
    

    datalist = box.values.toList();
    // print("datalist");
    // print(datalist[0].name);
    if (datalist.isNotEmpty) {
      for (int i = 0; i < datalist.length; i++) {
        favaritelist.add(datalist[i].id);
      }
    }
    print("list from controller $favaritelist");
  }
}