// ignore_for_file: unnecessary_question_mark, must_be_immutable

import 'package:equatable/equatable.dart';

/*// ignore: must_be_immutable
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
}*/

class RegisterModel extends Equatable {
  UserData? data;
  List<Messages>? messages;
  int? status;
  int? dataLength;

  RegisterModel({this.data, this.messages, this.status, this.dataLength});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : UserData.fromJson(json["data"]);
    messages = json["messages"] == null
        ? null
        : (json["messages"] as List).map((e) => Messages.fromJson(e)).toList();
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data["data"] = this.data?.toJson();
    }
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

class Messages extends Equatable {
  dynamic? code;
  String? body;
  dynamic? title;
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
  List<Object?> get props => [code, bool, title, type];
}

class UserData extends Equatable {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? countryPhoneCode;
  String? idCardNumber;
  String? country;
  String? city;
  String? neighborhood;
  dynamic? address;
  String? workPlace;
  String? nationality;
  String? gender;
  String? birthDate;
  String? userId;
  bool? isActive;
  String? randomNumber;
  String? type;
  dynamic? currentStage;
  dynamic? currentDiagnoses;
  dynamic? allowBooking;
  dynamic? currentDiagnosesStatus;

  UserData(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.countryPhoneCode,
      this.idCardNumber,
      this.country,
      this.city,
      this.neighborhood,
      this.address,
      this.workPlace,
      this.nationality,
      this.gender,
      this.birthDate,
      this.userId,
      this.isActive,
      this.randomNumber,
      this.type,
      this.currentStage,
      this.currentDiagnoses,
      this.allowBooking,
      this.currentDiagnosesStatus});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    middleName = json["middleName"];
    lastName = json["lastName"];
    fullName = json["fullName"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    countryPhoneCode = json["countryPhoneCode"];
    idCardNumber = json["idCardNumber"];
    country = json["country"];
    city = json["city"];
    neighborhood = json["neighborhood"];
    address = json["address"];
    workPlace = json["workPlace"];
    nationality = json["nationality"];
    gender = json["gender"];
    birthDate = json["birthDate"];
    userId = json["userId"];
    isActive = json["isActive"];
    randomNumber = json["randomNumber"];
    type = json["type"];
    currentStage = json["currentStage"];
    currentDiagnoses = json["currentDiagnoses"];
    allowBooking = json["allowBooking"];
    currentDiagnosesStatus = json["currentDiagnosesStatus"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["firstName"] = firstName;
    data["middleName"] = middleName;
    data["lastName"] = lastName;
    data["fullName"] = fullName;
    data["email"] = email;
    data["phoneNumber"] = phoneNumber;
    data["countryPhoneCode"] = countryPhoneCode;
    data["idCardNumber"] = idCardNumber;
    data["country"] = country;
    data["city"] = city;
    data["neighborhood"] = neighborhood;
    data["address"] = address;
    data["workPlace"] = workPlace;
    data["nationality"] = nationality;
    data["gender"] = gender;
    data["birthDate"] = birthDate;
    data["userId"] = userId;
    data["isActive"] = isActive;
    data["randomNumber"] = randomNumber;
    data["type"] = type;
    data["currentStage"] = currentStage;
    data["currentDiagnoses"] = currentDiagnoses;
    data["allowBooking"] = allowBooking;
    data["currentDiagnosesStatus"] = currentDiagnosesStatus;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        middleName,
        lastName,
        fullName,
        email,
        phoneNumber,
        countryPhoneCode,
        idCardNumber,
        country,
        city,
        neighborhood,
        address,
        workPlace,
        nationality,
        gender,
        birthDate,
        userId,
        isActive,
        randomNumber,
        type,
        currentStage,
        currentDiagnoses,
        allowBooking,
        currentDiagnosesStatus
      ];
}
