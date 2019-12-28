class WanResponse<T> {
  T data;
  int errorCode;
  String errorMsg;
  List<T> listData = [];

  WanResponse({this.data, this.errorCode, this.errorMsg});

  factory WanResponse.fromJson(Map<String, dynamic> json) {
    return null;
  }
}
