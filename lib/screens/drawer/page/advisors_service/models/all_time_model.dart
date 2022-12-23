// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AllTimeModel extends Equatable {
  List<int>? data;
  int? status;
  int? dataLength;

  AllTimeModel({this.data, this.status, this.dataLength});

  AllTimeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<int>();
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
