import 'dart:convert';

import 'package:gm_action/model/top_gamemodel.dart';
import 'package:http/http.dart' as http;

 

Future<Topgame?> fetchTopgamedata() async {
  final response = await http
      .get(Uri.parse('https://kurminfotech.in/gamemania/api/GetTopGames'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    
    return Topgame.fromMap(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
        return null;

  }
}