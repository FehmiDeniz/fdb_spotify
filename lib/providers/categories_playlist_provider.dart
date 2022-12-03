import 'package:fdb_spotify/models/categories_playlist_model.dart';
import 'package:fdb_spotify/service/categories_playlist_service.dart';
import 'package:flutter/cupertino.dart';

class CategoriesPlaylistProvider extends ChangeNotifier {
  CategoriesPlaylistModel? categoriesPlaylistData;
  bool isCategoriesPlaylistLoaded = false;

  getCategoriesPlaylistData(String id) async {
    categoriesPlaylistData = await getCategoriesPlaylistService(id);
    isCategoriesPlaylistLoaded = true;
    notifyListeners();
  }
}
