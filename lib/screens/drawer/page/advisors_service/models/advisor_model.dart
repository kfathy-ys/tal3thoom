// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AllAdvisorModel extends Equatable {
  List<AllAdvisors>? data;
  int? status;
  int? dataLength;

  AllAdvisorModel({this.data, this.status, this.dataLength});

  AllAdvisorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AllAdvisors>[];
      json['data'].forEach((v) {
        data!.add(AllAdvisors.fromJson(v));
      });
    }
    status = json['status'];
    dataLength = json['dataLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['dataLength'] = dataLength;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, status, data];
}

class AllAdvisors extends Equatable {
  int? id;
  String? fullName;
  String? midName;
  String? lastName;
  String? userId;

  AllAdvisors(
      {this.id, this.fullName, this.midName, this.lastName, this.userId});

  AllAdvisors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    midName = json['midName'];
    lastName = json['lastName'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['midName'] = midName;
    data['lastName'] = lastName;
    data['userId'] = userId;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        midName,
        lastName,
        userId,
      ];
}
