class WanResponse<T> {
	T data;
	int errorCode;
	String errorMsg;

	WanResponse({this.data, this.errorCode, this.errorMsg});

	WanResponse.fromJson(Map<String, dynamic> json) {
		data = json['data'];
		errorCode = json['errorCode'];
		errorMsg = json['errorMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['data'] = this.data;
		data['errorCode'] = this.errorCode;
		data['errorMsg'] = this.errorMsg;
		return data;
	}
}
