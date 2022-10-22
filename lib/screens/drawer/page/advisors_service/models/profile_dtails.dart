// import 'package:equatable/equatable.dart';
//
// class ProfileDetailsModel extends Equatable {
//   final ProfileDetails data;
//   final List<dynamic> messages;
//   final int status;
//   final int dataLength;
//   const ProfileDetailsModel({
//     required this.data,
//     required this.messages,
//     required this.status,
//     required this.dataLength,
//   });
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'data': data.toMap(),
//       'messages': messages,
//       'status': status,
//       'dataLength': dataLength,
//     };
//   }
//
//   factory ProfileDetailsModel.fromMap(Map<String, dynamic> map) {
//     return ProfileDetailsModel(
//       data: ProfileDetails.fromMap(map['data'] as Map<String,dynamic>),
//       messages: List<dynamic>.from((map['messages'] ?? const <dynamic>[]) as List<dynamic>),
//       status: (map['status'].toInt() ?? 0) as int,
//       dataLength: (map['dataLength'].toInt() ?? 0) as int,
//     );
//   }
//
//   @override
//   List<Object> get props => [data, messages, status, dataLength];
// }
//
// class ProfileDetails extends Equatable {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String password;
//   final String birthDate;
//   final String gender;
//   final String midName;
//   final String phoneNumber;
//   final String idCardNumber;
//   final String address;
//   final String employer;
//   final String nationality;
//   final Object? userId;
//   final Object? id;
//   final String attachment;
//   final String attachmentName;
//   final String fileNameURL;
//   final String experienceYears;
//   final String job;
//   final String education;
//   final String scientificDegree;
//   final Object? zoomEmail;
//   final bool joinedInYourConsultant;
//   final int consultationPriceInHour;
//   final int consultationPriceIn45Minute;
//   final int consultationPriceIn30Minute;
//   final int consultationPriceIn15Minute;
//   const ProfileDetails({
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.password,
//     required this.birthDate,
//     required this.gender,
//     required this.midName,
//     required this.phoneNumber,
//     required this.idCardNumber,
//     required this.address,
//     required this.employer,
//     required this.nationality,
//     required this.userId,
//     required this.id,
//     required this.attachment,
//     required this.attachmentName,
//     required this.fileNameURL,
//     required this.experienceYears,
//     required this.job,
//     required this.education,
//     required this.scientificDegree,
//     required this.zoomEmail,
//     required this.joinedInYourConsultant,
//     required this.consultationPriceInHour,
//     required this.consultationPriceIn45Minute,
//     required this.consultationPriceIn30Minute,
//     required this.consultationPriceIn15Minute,
//   });
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'firstName': firstName,
//       'lastName': lastName,
//       'email': email,
//       'password': password,
//       'birthDate': birthDate,
//       'gender': gender,
//       'midName': midName,
//       'phoneNumber': phoneNumber,
//       'idCardNumber': idCardNumber,
//       'address': address,
//       'employer': employer,
//       'nationality': nationality,
//       'userId': userId,
//       'id': id,
//       'attachment': attachment,
//       'attachmentName': attachmentName,
//       'fileNameURL': fileNameURL,
//       'experienceYears': experienceYears,
//       'job': job,
//       'education': education,
//       'scientificDegree': scientificDegree,
//       'zoomEmail': zoomEmail,
//       'joinedInYourConsultant': joinedInYourConsultant,
//       'consultationPriceInHour': consultationPriceInHour,
//       'consultationPriceIn45Minute': consultationPriceIn45Minute,
//       'consultationPriceIn30Minute': consultationPriceIn30Minute,
//       'consultationPriceIn15Minute': consultationPriceIn15Minute,
//     };
//   }
//
//   factory ProfileDetails.fromMap(Map<String, dynamic> map) {
//     return ProfileDetails(
//       firstName: (map['firstName'] ?? '') as String,
//       lastName: (map['lastName'] ?? '') as String,
//       email: (map['email'] ?? '') as String,
//       password: (map['password'] ?? '') as String,
//       birthDate: (map['birthDate'] ?? '') as String,
//       gender: (map['gender'] ?? '') as String,
//       midName: (map['midName'] ?? '') as String,
//       phoneNumber: (map['phoneNumber'] ?? '') as String,
//       idCardNumber: (map['idCardNumber'] ?? '') as String,
//       address: (map['address'] ?? '') as String,
//       employer: (map['employer'] ?? '') as String,
//       nationality: (map['nationality'] ?? '') as String,
//       userId:map['userId'] ==null ? null: map['userId'] as Map<String,dynamic>,
//       id: map['id'] == null ? null: map['id'] as Map<String,dynamic>,
//       attachment: (map['attachment'] ?? '') as String,
//       attachmentName: (map['attachmentName'] ?? '') as String,
//       fileNameURL: (map['fileNameURL'] ?? '') as String,
//       experienceYears: (map['experienceYears'] ?? '') as String,
//       job: (map['job'] ?? '') as String,
//       education: (map['education'] ?? '') as String,
//       scientificDegree: (map['scientificDegree'] ?? '') as String,
//       zoomEmail: map['zoomEmail'] == null ? null : map['zoomEmail'] as Map<String,dynamic>,
//       joinedInYourConsultant: (map['joinedInYourConsultant'] ?? false) as bool,
//       consultationPriceInHour: (map['consultationPriceInHour'] ?? 0) as int,
//       consultationPriceIn45Minute: (map['consultationPriceIn45Minute'] ?? 0) as int,
//       consultationPriceIn30Minute: (map['consultationPriceIn30Minute'] ?? 0) as int,
//       consultationPriceIn15Minute: (map['consultationPriceIn15Minute'] ?? 0) as int,
//     );
//   }
//
//   @override
//   List<Object> get props {
//     return [
//       firstName,
//       lastName,
//       email,
//       password,
//       birthDate,
//       gender,
//       midName,
//       phoneNumber,
//       idCardNumber,
//       address,
//       employer,
//       nationality,
//       userId!,
//       id!,
//       attachment,
//       attachmentName,
//       fileNameURL,
//       experienceYears,
//       job,
//       education,
//       scientificDegree,
//       zoomEmail!,
//       joinedInYourConsultant,
//       consultationPriceInHour,
//       consultationPriceIn45Minute,
//       consultationPriceIn30Minute,
//       consultationPriceIn15Minute,
//     ];
//   }
// }
//
