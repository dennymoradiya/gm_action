import 'package:get/get.dart';
import 'package:ActionGame/api/category_game_connection.dart';
import 'package:ActionGame/model/category_game.dart';

class categorygamecontroller  extends GetxController
{
  RxList categoryamelist = [].obs ;
   RxBool  isload =  false.obs ;
 
    //  Future<Topgame> topgamedata =    
      void fetchcategorygame () async
      {
        Categorygame? categorygamedata = await fetchcategorydata();
        // ignore: unnecessary_null_comparison
        if(categorygamedata!=null)
        {
        categoryamelist.value = categorygamedata.data!;
            isload.value = true ;
            
        }
        
         
        
 
      }
      
}