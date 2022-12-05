import 'dart:convert';

import 'package:fdb_spotify/key.dart';
import 'package:fdb_spotify/models/search_model.dart';
import 'package:http/http.dart' as http;

Future<SearchTrackModel> getSearchTrackService(String artist) async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var params = {
    'q': artist,
    'type': 'track,artist',
    'market': 'ES',
    'limit': '5',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/search?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) {
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  }

  print(res.body);
  return SearchTrackModel.fromJson(jsonDecode(res.body));
}
