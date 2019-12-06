import 'package:wan_android/bean/wan_response.dart';
import 'package:wan_android/bean/pagination.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "WanResponse") {
      return WanResponse.fromJson(json) as T;
    } else if (T.toString() == "Pagination") {
      return Pagination.fromJson(json) as T;
    } else {
      return null;
    }
  }
}