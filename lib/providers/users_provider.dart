import 'package:fdb_spotify/models/users_model.dart';
import 'package:fdb_spotify/service/users.service.dart';
import 'package:flutter/cupertino.dart';

class UsersProvider with ChangeNotifier {
  UsersModel? usersData;
  bool isLoadingUserData = false;

  getUsersData() async {
    usersData = await getUserService();
    isLoadingUserData = true;
    notifyListeners();
  }
}
