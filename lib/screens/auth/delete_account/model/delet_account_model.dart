// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AllMessages extends Equatable {
  dynamic data;
  List<Messages>? messages;
  int? status;
  int? dataLength;

  AllMessages({this.data, this.messages, this.status, this.dataLength});

  AllMessages.fromJson(Map<String, dynamic> json) {
    data = json['data'];
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
    data['data'] = this.data;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['dataLength'] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

class Messages extends Equatable {
  dynamic code;
  dynamic body;
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

  @override
  List<Object?> get props => [code, body, title, type];
}
