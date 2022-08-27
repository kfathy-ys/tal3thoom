
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AnswersModel extends Equatable{
  Question? question;
  List<String>? patientAnswers;

  AnswersModel({this.question, this.patientAnswers});

  AnswersModel.fromJson(Map<String, dynamic> json) {
    question = json["question"] == null ? null : Question.fromJson(json["question"]);
    patientAnswers = json["patientAnswers"]==null ? null : List<String>.from(json["patientAnswers"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(question != null)
      data["question"] = question?.toJson();
    if(patientAnswers != null)
      data["patientAnswers"] = patientAnswers;
    return data;
  }

  @override

  List<Object?> get props => [question,patientAnswers];
}

class Question extends Equatable{
  int? id;
  String? description;
  int? examId;
  int? categoryId;
  dynamic? sectionId;

  Question({this.id, this.description, this.examId, this.categoryId, this.sectionId});

  Question.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    description = json["description"];
    examId = json["examId"];
    categoryId = json["categoryId"];
    sectionId = json["sectionId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["description"] = description;
    data["examId"] = examId;
    data["categoryId"] = categoryId;
    data["sectionId"] = sectionId;
    return data;
  }

  @override
  List<Object?> get props =>[id,description,examId,categoryId,sectionId];
}