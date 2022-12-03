import 'package:fdb_spotify/models/playlist_album.dart';
import 'package:fdb_spotify/models/releases_model.dart';
import 'package:fdb_spotify/providers/releases_provider.dart';
import 'package:fdb_spotify/service/playlist_service.dart';
import 'package:flutter/cupertino.dart';

class PlaylistProvider extends ChangeNotifier {
  PlaylistModel? playlistData;
  bool isPlaylistDataLoaded = false;

  getPlaylistData(String id) async {
    playlistData = await getPlaylistService(id);
    isPlaylistDataLoaded = true;
    notifyListeners();
  }
}
