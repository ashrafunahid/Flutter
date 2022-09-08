class LoginResponseModel {
  String? data;
  Null? error;
  bool? succeeded;
  String? message;

  LoginResponseModel({this.data, this.error, this.succeeded, this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    error = json['error'];
    succeeded = json['succeeded'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['error'] = this.error;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    return data;
  }
}