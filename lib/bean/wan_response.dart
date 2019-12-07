import '../entity_factory.dart';

class WanResponse<T> {
  T data;
  int errorCode;
  String errorMsg;
  List<T> listData = [];

  WanResponse({this.data, this.errorCode, this.errorMsg});

  WanResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    if (json.containsKey('data')) {
      if (json['data'] is List) {
        (json['data'] as List).forEach((item) {
          listData.add(EntityFactory.generateOBJ<T>(item));
        });
      } else {
        if (T.toString() == "String") {
          data = json['data'].toString() as T;
        } else if (T.toString() == "Map<dynamic, dynamic>") {
          data = json['data'] as T;
        } else {
          data = EntityFactory.generateOBJ<T>(json['data']);
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}
