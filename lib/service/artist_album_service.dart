import 'dart:convert';

import 'package:fdb_spotify/key.dart';
import 'package:fdb_spotify/models/artist_album_model.dart';
import 'package:fdb_spotify/widgets/artistProfileScreenWidgets/artist_albums.dart';
import 'package:http/http.dart' as http;

Future<ArtistAlbumModel> getArtistAlbumService(String id) async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var params = {
    'include_groups': 'single,appears_on',
    'market': 'TR',
    'limit': '10',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/artists/$id/albums?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) {
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  }
  print(res.body);
  return ArtistAlbumModel.fromJson(jsonDecode(res.body));
}
