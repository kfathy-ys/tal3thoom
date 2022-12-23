// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AdvisorModel extends Equatable {
  AdvisorProfile? data;
  int? status;
  int? dataLength;

  AdvisorModel({this.data, this.status, this.dataLength});

  AdvisorModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AdvisorProfile.fromJson(json['data']) : null;
    status = json['status'];
    dataLength = json['dataLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['dataLength'] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, status, dataLength];
}

class AdvisorProfile extends Equatable {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? birthDate;
  String? gender;
  String? midName;
  String? phoneNumber;
  String? idCardNumber;
  String? address;
  String? employer;
  String? nationality;
  dynamic userId;
  int? id;
  String? attachment;
  String? attachmentName;
  String? fileNameURL;
  String? experienceYears;
  String? job;
  String? education;
  dynamic scientificDegree;
  dynamic zoomEmail;
  bool? joinedInYourConsultant;
  num? consultationPriceInHour;
  num? consultationPriceIn45Minute;
  num? consultationPriceIn30Minute;
  num? consultationPriceIn15Minute;

  AdvisorProfile(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.birthDate,
      this.gender,
      this.midName,
      this.phoneNumber,
      this.idCardNumber,
      this.address,
      this.employer,
      this.nationality,
      this.userId,
      this.id,
      this.attachment,
      this.attachmentName,
      this.fileNameURL,
      this.experienceYears,
      this.job,
      this.education,
      this.scientificDegree,
      this.zoomEmail,
      this.joinedInYourConsultant,
      this.consultationPriceInHour,
      this.consultationPriceIn45Minute,
      this.consultationPriceIn30Minute,
      this.consultationPriceIn15Minute});

  AdvisorProfile.fromJson(Map<String, dynamic> json) {
    /// TODO:
    //firstName = json.containsKey("firstName")?json['firstName'] :"";
    firstName = json['firstName'] ?? "";
    lastName = json['lastName'] ?? "";
    email = json['email'] ?? "";
    password = json['password'] ?? "";
    birthDate = json['birthDate'] ?? "";
    gender = json['gender'] ?? "";
    midName = json['midName'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    idCardNumber = json['idCardNumber'] ?? "";
    address = json['address'] ?? "";
    employer = json['employer'] ?? "";
    nationality = json['nationality'];
    userId = json['userId'] ?? 0;
    id = json['id'];
    attachment = json['attachment'];
    attachmentName = json['attachmentName'];
    fileNameURL = json['fileNameURL'];
    experienceYears = json['experienceYears'];
    job = json['job'];
    education = json['education'];
    scientificDegree = json['scientificDegree'];
    zoomEmail = json['zoomEmail'];
    joinedInYourConsultant = json['joinedInYourConsultant'];
    consultationPriceInHour = json['consultationPriceInHour'];
    consultationPriceIn45Minute = json['consultationPriceIn45Minute'];
    consultationPriceIn30Minute = json['consultationPriceIn30Minute'];
    consultationPriceIn15Minute = json['consultationPriceIn15Minute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['midName'] = midName;
    data['phoneNumber'] = phoneNumber;
    data['idCardNumber'] = idCardNumber;
    data['address'] = address;
    data['employer'] = employer;
    data['nationality'] = nationality;
    data['userId'] = userId;
    data['id'] = id;
    data['attachment'] = attachment;
    data['attachmentName'] = attachmentName;
    data['fileNameURL'] = fileNameURL;
    data['experienceYears'] = experienceYears;
    data['job'] = job;
    data['education'] = education;
    data['scientificDegree'] = scientificDegree;
    data['zoomEmail'] = zoomEmail;
    data['joinedInYourConsultant'] = joinedInYourConsultant;
    data['consultationPriceInHour'] = consultationPriceInHour;
    data['consultationPriceIn45Minute'] = consultationPriceIn45Minute;
    data['consultationPriceIn30Minute'] = consultationPriceIn30Minute;
    data['consultationPriceIn15Minute'] = consultationPriceIn15Minute;
    return data;
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        birthDate,
        gender,
        midName,
        phoneNumber,
        idCardNumber,
        address,
        employer,
        nationality,
        userId,
        id,
        attachment,
        attachmentName,
        fileNameURL,
        experienceYears,
        job,
        education,
        scientificDegree,
        zoomEmail,
        joinedInYourConsultant,
        consultationPriceInHour,
        consultationPriceIn45Minute,
        consultationPriceIn30Minute,
        consultationPriceIn15Minute,
      ];
}
