class AuthorizationModel {
  String? token;
  String? smsToken;
  String? message;

  AuthorizationModel({this.token, this.smsToken, this.message});

  AuthorizationModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    smsToken = json['sms_token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['sms_token'] = smsToken;
    data['message'] = message;
    return data;
  }
}