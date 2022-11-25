import 'package:fdb_spotify/models/releases_model.dart';
import 'package:fdb_spotify/service/releases_service.dart';
import 'package:flutter/cupertino.dart';

class ReleasesProvider extends ChangeNotifier {
  ReleasesModel? releasesData;
  bool isReleasesDataLoaded = false;

  getReleasesData() async {
    releasesData = await getReleasesService();
    isReleasesDataLoaded = true;
    notifyListeners();
  }
}
