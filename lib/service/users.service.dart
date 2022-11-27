import 'dart:convert';

import 'package:fdb_spotify/key.dart';
import 'package:fdb_spotify/models/users_model.dart';
import 'package:http/http.dart' as http;

Future<UsersModel> getUserService() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  var url = Uri.parse('https://api.spotify.com/v1/me');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  return UsersModel.fromJson(jsonDecode(res.body));
}
