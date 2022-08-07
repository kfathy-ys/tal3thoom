import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LoginModel extends Equatable {
  Data? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  LoginModel({this.data, this.messages, this.status, this.dataLength});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.toJson();
    }
    if (messages != null) {
      data["messages"] = messages;
    }
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, dataLength];
}

// ignore: must_be_immutable
class Data extends Equatable {
  String? userId;
  String? userName;
  String? firstName;
  String? lastName;
  String? fullName;
  String? nameArabic;
  String? email;
  String? phoneNumber;
  String? token;
  String? defaultRoleCode;
  List<String>? roleCode;

  Data(
      {this.userId,
      this.userName,
      this.firstName,
      this.lastName,
      this.fullName,
      this.nameArabic,
      this.email,
      this.phoneNumber,
      this.token,
      this.defaultRoleCode,
      this.roleCode});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    userName = json["userName"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    fullName = json["fullName"];
    nameArabic = json["nameArabic"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    token = json["token"];
    defaultRoleCode = json["defaultRoleCode"];
    roleCode =
        json["roleCode"] == null ? null : List<String>.from(json["roleCode"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userId"] = userId;
    data["userName"] = userName;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["fullName"] = fullName;
    data["nameArabic"] = nameArabic;
    data["email"] = email;
    data["phoneNumber"] = phoneNumber;
    data["token"] = token;
    data["defaultRoleCode"] = defaultRoleCode;
    if (roleCode != null) {
      data["roleCode"] = roleCode;
    }
    return data;
  }

  @override
  List<Object?> get props => [
        userId,
        userName,
        firstName,
        lastName,
        fullName,
        nameArabic,
        email,
        phoneNumber,
        defaultRoleCode,
        roleCode
      ];
}
