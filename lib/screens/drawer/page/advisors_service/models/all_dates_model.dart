// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AllDatesModel extends Equatable {
  List<String>? data;
  int? status;
  int? dataLength;

  AllDatesModel({this.data, this.status, this.dataLength});

  AllDatesModel.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<String>();
    status = json['status'];
    dataLength = json['dataLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['status'] = status;
    data['dataLength'] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, status, dataLength];
}
