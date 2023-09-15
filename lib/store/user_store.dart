import 'package:mobx/mobx.dart';
import 'package:mobx_flutter/service/preference_service.dart';
import 'package:mobx_flutter/service/user_service.dart';

import '../model/user/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

  @observable
  List<User> userList = [];

  @action
  Future<void> addUser(User user) async {
    PreferencesService().setAuthToken('user');
    userList = [...userList, user];
  }

  @action
  Future<void> getUsers() async {
    List<User>? userList = await UserService().getUsers();
    userList = userList ?? [];
  }

  _UserStore(){
    getUsers();
  }
}