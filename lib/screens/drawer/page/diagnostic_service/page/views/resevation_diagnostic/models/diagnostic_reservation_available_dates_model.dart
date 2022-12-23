import 'package:equatable/equatable.dart';

class DiagnosticReservationAvailableDateModel extends Equatable {
  final List<DateTime> data;
  final List<dynamic> messages;
  final int status;
  final int dataLength;
  const DiagnosticReservationAvailableDateModel({
    required this.data,
    required this.messages,
    required this.status,
    required this.dataLength,
  });

  factory DiagnosticReservationAvailableDateModel.fromMap(
      Map<String, dynamic> map) {
    return DiagnosticReservationAvailableDateModel(
      data: List<DateTime>.from(
        (map['data'] as List<dynamic>).map<DateTime>(
          (x) => DateTime(
            x["year"],
            x["month"],
            x["day"],
          ),
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

/*
class AllAvailableDates extends Equatable {
  final DateTime day;
  final int month;
  final int year;
  const AllAvailableDates({
    required this.day,
    required this.month,
    required this.year,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'month': month,
      'year': year,
    };
  }

  factory AllAvailableDates.fromMap(Map<String, dynamic> map) {
    return AllAvailableDates(
      day: DateTime((map["day"] as int)),
      month: (map['month'].toInt() ?? 0) as int,
      year: (map['year'].toInt() ?? 0) as int,
    );
  }

  @override
  List<Object> get props => [day, month, year];
}
*/
