import 'package:wan_android/bean/response_data.dart';
import 'package:wan_android/model/api_service.dart';

Repository _repository = new Repository();

Repository get repository => _repository;

class Repository {
  final _remote = ApiService();
  Future<ResultData> register(
      String username, String password, String rePassword) {
    return _remote.register(username, password, rePassword);
  }

  Future<ResultData> login(
      String username, String password) {
    return _remote.login(username, password).then((response) async {
      final res = response;
//      if (res.code == 0) {
//        LocalStorageProvider.instance.setUserInfo(res.data);
//      }
      return Future.value(response);
    });
  }

  Future<ResultData> getArticleList(int pageIndex) {
    return _remote.getArticleList(pageIndex);
  }

  Future<ResultData> getTopArticleList() {
    return _remote.getTopArticleList();
  }

  Future<ResultData> getBannerList() {
    return _remote.getBannerList();
  }

  Future<ResultData> collectInsideArticle(int id) {
    return _remote.collectInsideArticle(id);
  }

  Future<ResultData> unCollectArticle(int id) {
    return _remote.unCollectArticle(id);
  }
}