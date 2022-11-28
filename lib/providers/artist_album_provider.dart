import 'package:fdb_spotify/models/artist_album_model.dart';
import 'package:fdb_spotify/service/artist_album_service.dart';
import 'package:flutter/cupertino.dart';

class ArtistAlbumProvider extends ChangeNotifier {
  ArtistAlbumModel? artistAlbumData;
  bool isArtistAlbumLoaded = false;

  getArtistAlbumData(String id) async {
    artistAlbumData = await getArtistAlbumService(id);
    isArtistAlbumLoaded = true;
    notifyListeners();
  }
}
