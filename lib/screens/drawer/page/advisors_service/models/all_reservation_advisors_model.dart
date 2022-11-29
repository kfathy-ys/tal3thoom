import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllReservationsAdvisorModel extends Equatable {
  List<ReservationsAdvisor>? data;
  int? status;
  int? dataLength;

  AllReservationsAdvisorModel({this.data, this.status, this.dataLength});

  AllReservationsAdvisorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReservationsAdvisor>[];
      json['data'].forEach((v) {
        data!.add(ReservationsAdvisor.fromJson(v));
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
  List<Object?> get props => [data, status, dataLength];
}

class ReservationsAdvisor extends Equatable {
  int? id;
  String? availableDateTime;
  int? scheduleId;
  int? patienttId;
  int? specialistId;
  bool? isActive;
  String? createdAt;
  String? createdBy;
  dynamic changedAt;
  String? changedBy;
  String? status;
  String? startTime;
  String? endTime;
  String? sessienUrl;
  String? patientRate;
  int? specialistRate;
  dynamic stageId;
  dynamic zoomInvitationUrl;
  dynamic schedule;

  ReservationsAdvisor(
      {this.id,
      this.availableDateTime,
      this.scheduleId,
      this.patienttId,
      this.specialistId,
      this.isActive,
      this.createdAt,
      this.createdBy,
      this.changedAt,
      this.changedBy,
      this.status,
      this.startTime,
      this.endTime,
      this.sessienUrl,
      this.patientRate,
      this.specialistRate,
      this.stageId,
      this.zoomInvitationUrl,
      this.schedule});

  ReservationsAdvisor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    availableDateTime = json['availableDateTime'];
    scheduleId = json['scheduleId'];
    patienttId = json['patienttId'];
    specialistId = json['specialistId'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    changedAt = json['changedAt'];
    changedBy = json['changedBy'];
    status = json['status'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    sessienUrl = json['sessienUrl'];
    patientRate = json['patientRate'];
    specialistRate = json['specialistRate'];
    stageId = json['stageId'];
    zoomInvitationUrl = json['zoomInvitationUrl'];
    schedule = json['schedule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['availableDateTime'] = availableDateTime;
    data['scheduleId'] = scheduleId;
    data['patienttId'] = patienttId;
    data['specialistId'] = specialistId;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['changedAt'] = changedAt;
    data['changedBy'] = changedBy;
    data['status'] = status;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['sessienUrl'] = sessienUrl;
    data['patientRate'] = patientRate;
    data['specialistRate'] = specialistRate;
    data['stageId'] = stageId;
    data['zoomInvitationUrl'] = zoomInvitationUrl;
    data['schedule'] = schedule;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        availableDateTime,
        scheduleId,
        patienttId,
        specialistId,
        isActive,
        createdAt,
        createdBy,
        changedAt,
        changedBy,
        status,
        startTime,
        endTime,
        sessienUrl,
        patientRate,
        specialistRate,
        stageId,
        zoomInvitationUrl,
        schedule
      ];
}
