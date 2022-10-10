import 'package:equatable/equatable.dart';

class AllSpecialistModel extends Equatable {
  final List<Specialists> data;
  final List<dynamic> messages;
  final int status;
  final int dataLength;
  const AllSpecialistModel({
    required this.data,
    required this.messages,
    required this.status,
    required this.dataLength,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
      'messages': messages,
      'status': status,
      'dataLength': dataLength,
    };
  }

  factory AllSpecialistModel.fromMap(Map<String, dynamic> map) {
    return AllSpecialistModel(
      data: List<Specialists>.from((map['data'] as List<dynamic>).map<Specialists>((x) => Specialists.fromMap(x as Map<String,dynamic>),),),
      messages: List<dynamic>.from((map['messages'] ?? const <dynamic>[]) as List<dynamic>),
      status: (map['status'].toInt() ?? 0) as int,
      dataLength: (map['dataLength'].toInt() ?? 0) as int,
    );
  }

  @override
  List<Object> get props => [data, messages, status, dataLength];
}

class Specialists extends Equatable {
  final int id;
  final int scheduleId;
  final int patienttId;
  final int specialistId;
  final bool isActive;
  final String status;
  final String startTime;
  final String day;
  final String availableDate;
  final String employer;
  final String fullName;
  final String gender;
  final String midName;
  final String lastName;
  const Specialists({
    required this.id,
    required this.scheduleId,
    required this.patienttId,
    required this.specialistId,
    required this.isActive,
    required this.status,
    required this.startTime,
    required this.day,
    required this.availableDate,
    required this.employer,
    required this.fullName,
    required this.gender,
    required this.midName,
    required this.lastName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'scheduleId': scheduleId,
      'patienttId': patienttId,
      'specialistId': specialistId,
      'isActive': isActive,
      'status': status,
      'startTime': startTime,
      'day': day,
      'availableDate': availableDate,
      'employer': employer,
      'fullName': fullName,
      'gender': gender,
      'midName': midName,
      'lastName': lastName,
    };
  }

  factory Specialists.fromMap(Map<String, dynamic> map) {
    return Specialists(
      id: (map['id'].toInt() ?? 0) as int,
      scheduleId: (map['scheduleId'].toInt() ?? 0) as int,
      patienttId: (map['patienttId'].toInt() ?? 0) as int,
      specialistId: (map['specialistId'].toInt() ?? 0) as int,
      isActive: (map['isActive'] ?? false) as bool,
      status: (map['status'] ?? '') as String,
      startTime: (map['startTime'] ?? '') as String,
      day: (map['day'] ?? '') as String,
      availableDate: (map['availableDate'] ?? '') as String,
      employer: (map['employer'] ?? '') as String,
      fullName: (map['fullName'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      midName: (map['midName'] ?? '') as String,
      lastName: (map['lastName'] ?? '') as String,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      scheduleId,
      patienttId,
      specialistId,
      isActive,
      status,
      startTime,
      day,
      availableDate,
      employer,
      fullName,
      gender,
      midName,
      lastName,
    ];
  }
}