import 'package:fdb_spotify/models/profile_playlist_model.dart';
import 'package:fdb_spotify/service/profile_playlist_service.dart';
import 'package:flutter/cupertino.dart';

class ProfilePlaylistProvider extends ChangeNotifier {
  ProfilePlaylistModel? profilePlaylistData;
  bool isProfilePlaylistLoaded = false;

  getProfilePlaylistData() async {
    profilePlaylistData = await getProfilePlaylistService();
    print(profilePlaylistData);
    isProfilePlaylistLoaded = true;
    notifyListeners();
  }
}
