import 'package:wan_android/base/base_controller.dart';

class EndPointController extends BaseController {
  static EndPointController _instance;

  EndPoint curEndPoint;

  void setEndPoint(String type) {
    switch (type) {
      case 'dev':
        curEndPoint = EndPoint('dev', 'https://www.wanandroid.com');
        break;
      case 'pro':
        curEndPoint = EndPoint('pro', 'https://www.wanandroid.com');
        break;
    }
  }

  EndPoint getEndPoint() {
    if (curEndPoint == null) {
      setEndPoint('dev');
    }
    return curEndPoint;
  }

  static EndPointController getInstance() {
    if (_instance == null) _instance = EndPointController._();
    return _instance;
  }

  EndPointController._();
}

class EndPoint {
  String type;
  String baseUrl;

  EndPoint(type, baseUrl);
}
