import 'dart:convert';

import 'package:fdb_spotify/key.dart';
import 'package:fdb_spotify/models/playlist_model.dart';
import 'package:http/http.dart' as http;

Future<PlaylistModel> getPlaylistService(String id) async {
  PlaylistModel? data = PlaylistModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var params = {
    'market': 'TR',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url =
      Uri.parse('https://api.spotify.com/v1/artists/$id/top-tracks?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) {
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  }
  data = PlaylistModel.fromJson(jsonDecode(res.body));
  return data;
}
