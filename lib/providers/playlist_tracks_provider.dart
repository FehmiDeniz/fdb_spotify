import 'package:fdb_spotify/models/playlist_tracks_model.dart';
import 'package:fdb_spotify/service/playlist_tracks_service.dart';
import 'package:flutter/cupertino.dart';

class PlaylistTracksProvider with ChangeNotifier {
  PlaylistTracksModel? playlistTracksData;
  bool isPlaylistTracksLoaded = false;

  getPlaylistTracksData(String id) async {
    playlistTracksData = await getPlaylistTrackService(id);
    isPlaylistTracksLoaded = true;
    notifyListeners();
  }
}
