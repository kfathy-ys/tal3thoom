// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
/*class LoginModel extends Equatable {
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
}*/

// ignore: must_be_immutable
class LoginModel extends Equatable {
  Data? data;
 // List<dynamic>? messages;
  List<Messages>? messages;
  int? status;
  int? dataLength;

  LoginModel({this.data, this.messages, this.status, this.dataLength});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  //  messages = json["messages"] ?? [];
    messages = json["messages"] == null ? null : (json["messages"] as List).map((e) => Messages.fromJson(e)).toList();

    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.toJson();
    }
    if (messages != null) {
     // data["messages"] = messages;
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
class Data extends Equatable {
  String? userId;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  List<String>? roleCode;
  List<RolesDetails>? rolesDetails;
  bool? completeData;
  int? patientId;
  bool? isSso;
  String? phoneNumber;

  Data(
      {this.userId,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.token,
      this.roleCode,
      this.rolesDetails,
      this.completeData,
      this.patientId,
      this.isSso,
      this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    userName = json["userName"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    email = json["email"];
    token = json["token"];
    roleCode =
        json["roleCode"] == null ? null : List<String>.from(json["roleCode"]);
    rolesDetails = json["rolesDetails"] == null
        ? null
        : (json["rolesDetails"] as List)
            .map((e) => RolesDetails.fromJson(e))
            .toList();
    completeData = json["completeData"];
    patientId = json["patientId"];
    isSso = json["isSSO"];
    phoneNumber = json["phoneNumber"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userId"] = userId;
    data["userName"] = userName;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["email"] = email;
    data["token"] = token;
    if (roleCode != null) data["roleCode"] = roleCode;
    if (rolesDetails != null) {
      data["rolesDetails"] = rolesDetails?.map((e) => e.toJson()).toList();
    }
    data["completeData"] = completeData;
    data["patientId"] = patientId;
    data["isSSO"] = isSso;
    data["phoneNumber"] = phoneNumber;
    return data;
  }

  @override
  List<Object?> get props => [
        userId,
        userName,
        firstName,
        lastName,
        email,
        token,
        roleCode,
        rolesDetails,
        completeData,
        patientId,
        patientId,
        isSso
      ];
}

// ignore: must_be_immutable
class RolesDetails extends Equatable {
  String? roleCode;
  String? enRoleName;
  dynamic? arRoleName;

  RolesDetails({this.roleCode, this.enRoleName, this.arRoleName});

  RolesDetails.fromJson(Map<String, dynamic> json) {
    roleCode = json["roleCode"];
    enRoleName = json["enRoleName"];
    arRoleName = json["arRoleName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["roleCode"] = roleCode;
    data["enRoleName"] = enRoleName;
    data["arRoleName"] = arRoleName;
    return data;
  }

  @override
  List<Object?> get props => [roleCode, enRoleName, arRoleName];
}
class Messages extends Equatable{
  String? code;
  String? body;
  String? title;
  int? type;

  Messages({this.code, this.body, this.title, this.type});

  Messages.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    body = json["body"];
    title = json["title"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["body"] = body;
    _data["title"] = title;
    _data["type"] = type;
    return _data;
  }

  @override
  List<Object?> get props => [code,body,title,type];
}