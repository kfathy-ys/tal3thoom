import 'package:equatable/equatable.dart';

class AllBookingModel extends Equatable {
  final List<BookingInfo> data;
  final List<dynamic> messages;
  final int status;
  final int dataLength;

  const AllBookingModel({
    required this.data,
    required this.messages,
    required this.status,
    required this.dataLength,
  });

  factory AllBookingModel.fromMap(Map<String, dynamic> map) {
    return AllBookingModel(
      data: map['data'] == null
          ? []
          : List<BookingInfo>.from(
              (map['data'] as List<dynamic>).map<BookingInfo>(
              (x) => BookingInfo.fromMap(x as Map<String, dynamic>),
            )),
      messages: List<dynamic>.from(
          (map['messages'] ?? const <dynamic>[]) as List<dynamic>),
      status: (map['status'].toInt() ?? 0) as int,
      dataLength: (map['dataLength'].toInt() ?? 0) as int,
    );
  }

  @override
  List<Object> get props => [data, messages, status, dataLength];
}

class BookingInfo extends Equatable {
  final Object? status;
  final String startTime;
  final String endTime;
  final String day;
  final String availableDateTime;
  final Object? fullName;
  final int idScheduleDetails;
  final String userId;
  final Object? specialistGender;
  final String sessienUrl;
  final int specialistRate;
  final String zoomInvitationUrl;
  final String scheduledFor;
  final Object? patientDiagnosesStatus;
  final  bool? allowEnterZoomSession;

  const BookingInfo({
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.availableDateTime,
    required this.fullName,
    required this.idScheduleDetails,
    required this.userId,
    required this.specialistGender,
    required this.sessienUrl,
    required this.specialistRate,
    required this.zoomInvitationUrl,
    required this.scheduledFor,
    required this.patientDiagnosesStatus,
    required this.allowEnterZoomSession
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'startTime': startTime,
      'endTime': endTime,
      'day': day,
      'availableDateTime': availableDateTime,
      'fullName': fullName,
      'idScheduleDetails': idScheduleDetails,
      'userId': userId,
      'specialistGender': specialistGender,
      'sessienUrl': sessienUrl,
      'specialistRate': specialistRate,
      'zoomInvitationUrl': zoomInvitationUrl,
      'scheduledFor': scheduledFor,
      'patientDiagnosesStatus': patientDiagnosesStatus,
      'allowEnterZoomSession': allowEnterZoomSession,
    };
  }

  factory BookingInfo.fromMap(Map<String, dynamic> map) {
    return BookingInfo(
      status: map['status'],
      startTime: (map['startTime'] ?? '') as String,
      endTime: (map['endTime'] ?? '') as String,
      day: (map['day'] ?? '') as String,
      availableDateTime: (map['availableDateTime'] ?? '') as String,
      fullName: map['fullName'],
      idScheduleDetails: (map['idScheduleDetails'].toInt() ?? 0) as int,
      userId: (map['userId'] ?? '') as String,
      specialistGender: map['specialistGender'],
      sessienUrl: (map['sessienUrl'] ?? '') as String,
      specialistRate: (map['specialistRate'].toInt() ?? 0) as int,
      zoomInvitationUrl: (map['zoomInvitationUrl'] ?? '') as String,
      scheduledFor: (map['scheduledFor'] ?? '') as String,
      patientDiagnosesStatus: map['patientDiagnosesStatus'],
      allowEnterZoomSession: map['allowEnterZoomSession']

    );
  }

  @override
  List<Object> get props {
    return [
      status!,
      startTime,
      endTime,
      day,
      availableDateTime,
      fullName!,
      idScheduleDetails,
      userId,
      specialistGender!,
      sessienUrl,
      specialistRate,
      zoomInvitationUrl,
      scheduledFor,
      patientDiagnosesStatus!,
      allowEnterZoomSession!
    ];
  }
}
