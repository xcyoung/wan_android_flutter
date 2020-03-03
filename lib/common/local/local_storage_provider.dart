import 'package:wan_android/common/local/local_storage.dart';
import 'package:wan_android/moudle/account/model/user_info.dart';

class LocalStorageProvider {
  static const String KEY_USER_INFO = 'wan_user_info';

  factory LocalStorageProvider() => _getInstance();

  static LocalStorageProvider get instance => _getInstance();
  static LocalStorageProvider _instance;

  LocalStorageProvider._internal() {}

  static LocalStorageProvider _getInstance() {
    if (_instance == null) {
      _instance = new LocalStorageProvider._internal();
    }
    return _instance;
  }

  Future<UserInfo> getUserInfo() async {
    final json = await LocalStorage.get(KEY_USER_INFO);
    if (json == null) {
      return Future.value(null);
    }
    final userInfo = UserInfo.fromJson(json);
    return Future.value(userInfo);
  }

  void setUserInfo(Map<String, dynamic> json) {
    LocalStorage.save(KEY_USER_INFO, json);
  }
}