import 'package:fdb_spotify/models/search_model.dart';
import 'package:fdb_spotify/service/search_service.dart';
import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  SearchTrackModel? searchTrackData;
  bool isLoadedTrack = false;

  getSearchTrackData(String artist) async {
    searchTrackData = await getSearchTrackService(artist);
    isLoadedTrack = true;
    notifyListeners();
  }
}
