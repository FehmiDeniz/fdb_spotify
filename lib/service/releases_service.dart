import 'dart:convert';

import 'package:fdb_spotify/key.dart';
import 'package:fdb_spotify/models/releases_model.dart';
import 'package:http/http.dart' as http;

Future<ReleasesModel?> getReleasesService() async {
  ReleasesModel? data = ReleasesModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var params = {
    'country': 'TR',
    'limit': '10',
    'offset': '5',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/browse/new-releases?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) {
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  }

  data = ReleasesModel.fromJson(jsonDecode(res.body));
  return data;
}
