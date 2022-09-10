// // ignore_for_file: must_be_immutable
//
// import 'package:equatable/equatable.dart';
// class AnswersNewModel extends Equatable {
//   String? userId;
//   int? patientCurrentStage;
//   int? questionId;
//   String? description;
//   int? examId;
//   int? categoryId;
//   dynamic sectionId;
//   List<String>? patientAnswers;
//
//   AnswersNewModel({this.userId, this.patientCurrentStage, this.questionId, this.description, this.examId, this.categoryId, this.sectionId, this.patientAnswers});
//
//   AnswersNewModel.fromJson(Map<String, dynamic> json) {
//     userId = json["userId"];
//     patientCurrentStage = json["patientCurrentStage"];
//     questionId = json["questionId"];
//     description = json["description"];
//     examId = json["examId"];
//     categoryId = json["categoryId"];
//     sectionId = json["sectionId"];
//     patientAnswers = json["patientAnswers"]==null ? null : List<String>.from(json["patientAnswers"]);
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["userId"] = userId;
//     data["patientCurrentStage"] = patientCurrentStage;
//     data["questionId"] = questionId;
//     data["description"] = description;
//     data["examId"] = examId;
//     data["categoryId"] = categoryId;
//     data["sectionId"] = sectionId;
//     if(patientAnswers != null)
//       data["patientAnswers"] = patientAnswers;
//     return data;
//   }
//
//   @override
//
//   List<Object?> get props => [userId,patientCurrentStage,questionId,description,examId,categoryId,sectionId,patientAnswers];
// }