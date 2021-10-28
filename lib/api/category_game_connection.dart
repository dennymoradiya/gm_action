import 'dart:convert';

import 'package:ActionGame/model/category_game.dart';
import 'package:http/http.dart' as http;

 

Future<Categorygame?> fetchcategorydata() async {
  var url = "https://kurminfotech.in/gamemania/";

  //   final response = await http.post(
  //   Uri.parse("https://kurminfotech.in/gamemania/api/CatWiseGames"),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, String>{
  //     'Cat_id': "6",
  //   }),
  // );
    
     
  final response = await http.post(Uri.parse(url + 'api/CatWiseGames'),
   headers: {
      "Content-Type": "application/json",
    },
     body: json.encode({'cat_id': 6}),
     encoding : Encoding.getByName('utf-8')
  );

   

  if (response.statusCode == 200) {
     
    
    return Categorygame.fromMap(jsonDecode(response.body));
  } else {
    return null;
  }
}
 

 