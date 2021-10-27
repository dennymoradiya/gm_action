import 'package:get/get.dart';
import 'package:gm_action/api/topgame_connection.dart';
import 'package:gm_action/model/top_gamemodel.dart';
import 'package:gm_action/view/widget/gameslider.dart';

class Topgamecontroller  extends GetxController
{
  RxList topgamelist = [].obs ;
   RxBool  isload =  false.obs ;
 
    //  Future<Topgame> topgamedata =    
      void fetchtopgame () async
      {
        Topgame? topgamedata = await fetchTopgamedata();
        // ignore: unnecessary_null_comparison
        if(topgamedata!=null)
        {
        topgamelist.value = topgamedata.data!;
         
            isload.value = true ;
        }
        
         
        
 
      }
      
}