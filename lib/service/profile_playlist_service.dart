import 'dart:convert';

import 'package:fdb_spotify/key.dart';
import 'package:fdb_spotify/models/profile_playlist_model.dart';
import 'package:http/http.dart' as http;

Future<ProfilePlaylistModel> getProfilePlaylistService() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var url = Uri.parse('https://api.spotify.com/v1/me/playlists');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');

  return ProfilePlaylistModel.fromJson(jsonDecode(res.body));
}
