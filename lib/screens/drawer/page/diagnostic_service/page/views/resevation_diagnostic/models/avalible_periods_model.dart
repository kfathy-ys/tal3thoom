import 'package:equatable/equatable.dart';

class AvailablePeriodsModel extends Equatable {
  final List<AvailablePeriods> data;
  final List<dynamic> messages;
  final int status;
  final int dataLength;
  const AvailablePeriodsModel({
    required this.data,
    required this.messages,
    required this.status,
    required this.dataLength,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x).toList(),
      'messages': messages,
      'status': status,
      'dataLength': dataLength,
    };
  }

  factory AvailablePeriodsModel.fromMap(Map<String, dynamic> map) {
    return AvailablePeriodsModel(
      data: List<AvailablePeriods>.from(
        (map['data'] as List<int>).map<AvailablePeriods>(
              (x) => AvailablePeriods.fromMap(x as Map<String, dynamic>),
        ),
      ),
      messages: List<dynamic>.from(
          (map['messages'] ?? const <dynamic>[]) as List<dynamic>),
      status: (map['status'].toInt() ?? 0) as int,
      dataLength: (map['dataLength'].toInt() ?? 0) as int,
    );
  }

  @override
  List<Object> get props => [data, messages, status, dataLength];
}

class AvailablePeriods extends Equatable {
  final int id;
  final int scheduleId;
  final int patienttId;
  final int specialistId;
  final bool isActive;
  final String status;
  final String startTime;
  final Object endTime;
  final String availableDate;
  final Object day;
  const AvailablePeriods({
    required this.id,
    required this.scheduleId,
    required this.patienttId,
    required this.specialistId,
    required this.isActive,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.availableDate,
    required this.day,
  });


  factory AvailablePeriods.fromMap(Map<String, dynamic> map) {
    return AvailablePeriods(
      id: (map['id'].toInt() ?? 0) as int,
      scheduleId: (map['scheduleId'].toInt() ?? 0) as int,
      patienttId: (map['patienttId'].toInt() ?? 0) as int,
      specialistId: (map['specialistId'].toInt() ?? 0) as int,
      isActive: (map['isActive'] ?? false) as bool,
      status: (map['status'] ?? '') as String,
      startTime: (map['startTime'] ?? '') as String,
      endTime: (map['endTime'] ??''),
      availableDate: (map['availableDate'] ?? '') as String,
      day: (map['day'] ?? ''),
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
      endTime,
      availableDate,
      day,
    ];
  }
}


