import 'package:equatable/equatable.dart';

class AdvisorModel extends Equatable {
  final List<AdvisorProfile> data;
  final List<dynamic> messages;
  final int status;
  final int dataLength;
  const AdvisorModel({
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

  factory AdvisorModel.fromMap(Map<String, dynamic> map) {
    return AdvisorModel(
      data: List<AdvisorProfile>.from((map['data'] as List<Object>).map<AdvisorProfile>((x) => AdvisorProfile.fromMap(x as Map<String,dynamic>),),),
      messages: List<dynamic>.from((map['messages'] ?? const <dynamic>[]) as List<dynamic>),
      status: (map['status'].toInt() ?? 0) as int,
      dataLength: (map['dataLength'].toInt() ?? 0) as int,
    );
  }

  @override
  List<Object> get props => [data, messages, status, dataLength];
}

class AdvisorProfile extends Equatable {
  final int id;
  final String fullName;
  final String birthDate;
  final String gender;
  final String midName;
  final String lastName;
  final String phoneNumber;
  final String idCardNumber;
  final String address;
  final String employer;
  final String nationality;
  final String userId;
  final String attachment;
  final String attachmentName;
  final String fileNameURL;
  final String experienceYears;
  final String job;
  final String education;
  final int rate;
  final String scientificDegree;
  final String zoomEmail;
  final bool joinedInYourConsultant;
  final num consultationPriceInHour;
  final num consultationPriceIn45Minute;
  final num consultationPriceIn30Minute;
  final num consultationPriceIn15Minute;
  //final Object? scheduleDetails;
  const AdvisorProfile({
    required this.id,
    required this.fullName,
    required this.birthDate,
    required this.gender,
    required this.midName,
    required this.lastName,
    required this.phoneNumber,
    required this.idCardNumber,
    required this.address,
    required this.employer,
    required this.nationality,
    required this.userId,
    required this.attachment,
    required this.attachmentName,
    required this.fileNameURL,
    required this.experienceYears,
    required this.job,
    required this.education,
    required this.rate,
    required this.scientificDegree,
    required this.zoomEmail,
    required this.joinedInYourConsultant,
    required this.consultationPriceInHour,
    required this.consultationPriceIn45Minute,
    required this.consultationPriceIn30Minute,
    required this.consultationPriceIn15Minute,
   // required this.scheduleDetails,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'birthDate': birthDate,
      'gender': gender,
      'midName': midName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'idCardNumber': idCardNumber,
      'address': address,
      'employer': employer,
      'nationality': nationality,
      'userId': userId,
      'attachment': attachment,
      'attachmentName': attachmentName,
      'fileNameURL': fileNameURL,
      'experienceYears': experienceYears,
      'job': job,
      'education': education,
      'rate': rate,
      'scientificDegree': scientificDegree,
      'zoomEmail': zoomEmail,
      'joinedInYourConsultant': joinedInYourConsultant,
      'consultationPriceInHour': consultationPriceInHour,
      'consultationPriceIn45Minute': consultationPriceIn45Minute,
      'consultationPriceIn30Minute': consultationPriceIn30Minute,
      'consultationPriceIn15Minute': consultationPriceIn15Minute,
     // 'scheduleDetails': scheduleDetails,
    };
  }

  factory AdvisorProfile.fromMap(Map<String, dynamic> map) {
    return AdvisorProfile(
      id: map.containsKey('id')? map['id'] : 0 ,
      fullName: (map['fullName'] ?? '') as String,
      birthDate: (map['birthDate'] ?? '') as String,
      gender: (map['gender'] ?? '') as String,
      midName: (map['midName'] ?? '') as String,
      lastName: (map['lastName'] ?? '') as String,
      phoneNumber: (map['phoneNumber'] ?? '') as String,
      idCardNumber: (map['idCardNumber'] ?? '') as String,
      address: (map['address'] ?? '') as String,
      employer: (map['employer'] ?? '') as String,
      nationality: (map['nationality'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      attachment: (map['attachment'] ?? '') as String,
      attachmentName: (map['attachmentName'] ?? '') as String,
      fileNameURL: (map['fileNameURL'] ?? '') as String,
      experienceYears: (map['experienceYears'] ?? '') as String,
      job: (map['job'] ?? '') as String,
      education: (map['education'] ?? '') as String,
      rate: map['rate'] ?? 0,
      scientificDegree: (map['scientificDegree'] ?? '') as String,
      zoomEmail: (map['zoomEmail'] ?? '') as String,
      joinedInYourConsultant: (map['joinedInYourConsultant'] ?? false) as bool,
      consultationPriceInHour: map['consultationPriceInHour'] ?? 0,
      consultationPriceIn45Minute: map['consultationPriceIn45Minute']?? 0,
      consultationPriceIn30Minute: map['consultationPriceIn30Minute']?? 0,
      consultationPriceIn15Minute: map['consultationPriceIn15Minute']?? 0,
     // scheduleDetails: map['scheduleDetails']
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      fullName,
      birthDate,
      gender,
      midName,
      lastName,
      phoneNumber,
      idCardNumber,
      address,
      employer,
      nationality,
      userId,
      attachment,
      attachmentName,
      fileNameURL,
      experienceYears,
      job,
      education,
      rate,
      scientificDegree,
      zoomEmail,
      joinedInYourConsultant,
      consultationPriceInHour,
      consultationPriceIn45Minute,
      consultationPriceIn30Minute,
      consultationPriceIn15Minute,
      //scheduleDetails!,
    ];
  }
}

