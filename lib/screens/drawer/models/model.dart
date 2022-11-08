// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class DataAccessPermissionModel extends Equatable {
  DataAccessPermission? data;
  int? status;
  int? dataLength;

  DataAccessPermissionModel({this.data, this.status, this.dataLength});

  DataAccessPermissionModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? DataAccessPermission.fromJson(json['data'])
        : null;
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

class DataAccessPermission extends Equatable {
  StagesDiagnosis? stagesDiagnosis;
  StagesTreatment? stagesTreatment;
  StagesTreatmentFirst? stagesTreatmentFirst;
  StagesTreatmentFirst? stagesTreatmentSecond;

  DataAccessPermission(
      {this.stagesDiagnosis,
      this.stagesTreatment,
      this.stagesTreatmentFirst,
      this.stagesTreatmentSecond});

  DataAccessPermission.fromJson(Map<String, dynamic> json) {
    stagesDiagnosis = json['stagesDiagnosis'] != null
        ? StagesDiagnosis.fromJson(json['stagesDiagnosis'])
        : null;
    stagesTreatment = json['stagesTreatment'] != null
        ? StagesTreatment.fromJson(json['stagesTreatment'])
        : null;
    stagesTreatmentFirst = json['stagesTreatmentFirst'] != null
        ? StagesTreatmentFirst.fromJson(json['stagesTreatmentFirst'])
        : null;
    stagesTreatmentSecond = json['stagesTreatmentSecond'] != null
        ? StagesTreatmentFirst.fromJson(json['stagesTreatmentSecond'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stagesDiagnosis != null) {
      data['stagesDiagnosis'] = stagesDiagnosis!.toJson();
    }
    if (stagesTreatment != null) {
      data['stagesTreatment'] = stagesTreatment!.toJson();
    }
    if (stagesTreatmentFirst != null) {
      data['stagesTreatmentFirst'] = stagesTreatmentFirst!.toJson();
    }
    if (stagesTreatmentSecond != null) {
      data['stagesTreatmentSecond'] = stagesTreatmentSecond!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        stagesDiagnosis,
        stagesTreatment,
        stagesTreatmentFirst,
        stagesTreatmentSecond
      ];
}

class StagesDiagnosis extends Equatable {
  bool? payment;
  bool? caseHistory;
  bool? oases;
  bool? ssrs;
  bool? ssi4;
  bool? booking;
  bool? closeBooking;

  StagesDiagnosis(
      {this.payment,
      this.caseHistory,
      this.oases,
      this.ssrs,
      this.ssi4,
      this.booking,
      this.closeBooking});

  StagesDiagnosis.fromJson(Map<String, dynamic> json) {
    payment = json['payment'];
    caseHistory = json['caseHistory'];
    oases = json['oases'];
    ssrs = json['ssrs'];
    ssi4 = json['ssi4'];
    booking = json['booking'];
    closeBooking = json['closeBooking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment'] = payment;
    data['caseHistory'] = caseHistory;
    data['oases'] = oases;
    data['ssrs'] = ssrs;
    data['ssi4'] = ssi4;
    data['booking'] = booking;
    data['closeBooking'] = closeBooking;
    return data;
  }

  @override
  List<Object?> get props =>
      [payment, caseHistory, oases, ssrs, ssi4, booking, closeBooking];
}

// ignore: must_be_immutable
class StagesTreatment extends Equatable {
  bool? payment;
  bool? preTreatment;

  StagesTreatment({this.payment, this.preTreatment});

  StagesTreatment.fromJson(Map<String, dynamic> json) {
    payment = json['payment'];
    preTreatment = json['preTreatment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment'] = payment;
    data['preTreatment'] = preTreatment;
    return data;
  }

  @override
  List<Object?> get props => [payment, preTreatment];
}

class StagesTreatmentFirst extends Equatable {
  bool? sessions;
  bool? oases;
  bool? ssrs;
  bool? ssi4;
  bool? booking;
  bool? closeBooking;

  StagesTreatmentFirst(
      {this.sessions,
      this.oases,
      this.ssrs,
      this.ssi4,
      this.booking,
      this.closeBooking});

  StagesTreatmentFirst.fromJson(Map<String, dynamic> json) {
    sessions = json['sessions'];
    oases = json['oases'];
    ssrs = json['ssrs'];
    ssi4 = json['ssi4'];
    booking = json['booking'];
    closeBooking = json['closeBooking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sessions'] = sessions;
    data['oases'] = oases;
    data['ssrs'] = ssrs;
    data['ssi4'] = ssi4;
    data['booking'] = booking;
    data['closeBooking'] = closeBooking;
    return data;
  }

  @override
  List<Object?> get props =>
      [sessions, oases, ssrs, ssi4, booking, closeBooking];
}
