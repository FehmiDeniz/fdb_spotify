import 'package:fdb_spotify/models/categorires_model.dart';
import 'package:fdb_spotify/service/categories_service.dart';
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoriesModel? categoriesData;
  bool isCategoriesLoaded = false;

  getCategoriesData() async {
    categoriesData = await getCategoriesService();
    isCategoriesLoaded = true;
    notifyListeners();
  }
}
