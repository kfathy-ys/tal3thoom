// ignore_for_file: unnecessary_question_mark

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RegisterModel extends Equatable {
  dynamic data;
  List<Messages>? messages;
  int? status;
  int? dataLength;

  RegisterModel({this.data, this.messages, this.status, this.dataLength});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json["data"];
    messages = json["messages"] == null
        ? null
        : (json["messages"] as List).map((e) => Messages.fromJson(e)).toList();
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = this.data;
    if (messages != null) {
      data["messages"] = messages?.map((e) => e.toJson()).toList();
    }
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

// ignore: must_be_immutable
class Messages extends Equatable {
  dynamic code;
  String? body;
  dynamic title;
  int? type;

  Messages({this.code, this.body, this.title, this.type});

  Messages.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    body = json["body"];
    title = json["title"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["body"] = body;
    data["title"] = title;
    data["type"] = type;
    return data;
  }

  @override
  List<Object?> get props => [code, body, title, type];
}
