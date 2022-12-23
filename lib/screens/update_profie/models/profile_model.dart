import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final AllProfile data;
  final List<dynamic> messages;
  final int status;
  final int dataLength;
  const ProfileModel({
    required this.data,
    required this.messages,
    required this.status,
    required this.dataLength,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
      'messages': messages,
      'status': status,
      'dataLength': dataLength,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      data: AllProfile.fromMap(map['data'] as Map<String, dynamic>),
      messages: List<dynamic>.from(
          (map['messages'] ?? const <dynamic>[]) as List<dynamic>),
      status: (map['status'].toInt() ?? 0) as int,
      dataLength: (map['dataLength'].toInt() ?? 0) as int,
    );
  }

  @override
  List<Object> get props => [data, messages, status, dataLength];
}

class AllProfile extends Equatable {
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String countryPhoneCode;
  final String idCardNumber;
  final String country;
  final String city;
  final String neighborhood;
  final String workPlace;
  final String nationality;
  final String gender;
  final String birthDate;
  final String userId;
  final bool isActive;
  final String randomNumber;
  final String type;
  final Object currentStage;
  final Object currentDiagnoses;
  final Object allowBooking;
  final Object currentDiagnosesStatus;
  const AllProfile({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.countryPhoneCode,
    required this.idCardNumber,
    required this.country,
    required this.city,
    required this.neighborhood,
    required this.workPlace,
    required this.nationality,
    required this.gender,
    required this.birthDate,
    required this.userId,
    required this.isActive,
    required this.randomNumber,
    required this.type,
    required this.currentStage,
    required this.currentDiagnoses,
    required this.allowBooking,
    required this.currentDiagnosesStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'countryPhoneCode': countryPhoneCode,
      'idCardNumber': idCardNumber,
      'country': country,
      'city': city,
      'neighborhood': neighborhood,
      'workPlace': workPlace,
      'nationality': nationality,
      'gender': gender,
      'birthDate': birthDate,
      'userId': userId,
      'isActive': isActive,
      'randomNumber': randomNumber,
      'type': type,
      'currentStage': currentStage,
      'currentDiagnoses': currentDiagnoses,
      'allowBooking': allowBooking,
      'currentDiagnosesStatus': currentDiagnosesStatus,
    };
  }

  factory AllProfile.fromMap(Map<String, dynamic> map) {
    return AllProfile(
      id: (map['id'].toInt() ?? 0) as int,
      firstName: (map['firstName'] ?? '') as String,
      middleName: (map['middleName'] ?? '') as String,
      lastName: (map['lastName'] ?? '') as String,
      fullName: (map['fullName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      phoneNumber: (map['phoneNumber'] ?? '') as String,
      countryPhoneCode: (map['countryPhoneCode'] ?? '') as String,
      idCardNumber: (map['idCardNumber'] ?? '') as String,
      country: (map['country'] ?? '') as String,
      city: (map['city'] ?? '') as String,
      neighborhood: (map['neighborhood'] ?? '') as String,
      workPlace: (map['workPlace'] ?? '') as String,
      nationality: (map['nationality'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      birthDate: (map['birthDate'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      isActive: (map['isActive'] ?? false) as bool,
      randomNumber: (map['randomNumber'] ?? '') as String,
      type: (map['type'] ?? '') as String,
      currentStage: map['currentStage'] ?? '',
      currentDiagnoses: map['currentDiagnoses'] ?? '',
      allowBooking: map['allowBooking'] ?? '',
      currentDiagnosesStatus: map['currentDiagnosesStatus'] ?? '',
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      middleName,
      lastName,
      fullName,
      email,
      phoneNumber,
      countryPhoneCode,
      idCardNumber,
      country,
      city,
      neighborhood,
      workPlace,
      nationality,
      gender,
      birthDate,
      userId,
      isActive,
      randomNumber,
      type,
      currentStage,
      currentDiagnoses,
      allowBooking,
      currentDiagnosesStatus,
    ];
  }
}
