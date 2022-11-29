class ForgetPasswordModel {
  UserInfo? data;
  List<Messages>? messages;
  int? status;
  int? dataLength;

  ForgetPasswordModel({this.data, this.messages, this.status, this.dataLength});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserInfo.fromJson(json['data']) : null;
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
    status = json['status'];
    dataLength = json['dataLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['dataLength'] = dataLength;
    return data;
  }
}

class UserInfo {
  String? email;
  dynamic? password;
  String? code;

  UserInfo({this.email, this.password, this.code});

  UserInfo.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['code'] = code;
    return data;
  }
}

class Messages {
  String? code;
  dynamic? body;
  String? title;
  int? type;

  Messages({this.code, this.body, this.title, this.type});

  Messages.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    body = json['body'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['body'] = body;
    data['title'] = title;
    data['type'] = type;
    return data;
  }
}
