// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class DiagnosticHistoryQuestionsModel extends Equatable {
  List<Data>? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  DiagnosticHistoryQuestionsModel(
      {this.data, this.messages, this.status, this.dataLength});

  DiagnosticHistoryQuestionsModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    if (messages != null) data["messages"] = messages;
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  List<Object?> get props => [data, messages, status, dataLength];
}

class Data extends Equatable {
  Questions? question;
  dynamic? patientAnswers;

  Data({this.question, this.patientAnswers});

  Data.fromJson(Map<String, dynamic> json) {
    question =
        json["question"] == null ? null : Questions.fromJson(json["question"]);
    patientAnswers = json["patientAnswers"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (question != null) data["question"] = question?.toJson();
    data["patientAnswers"] = patientAnswers;
    return data;
  }

  @override
  List<Object?> get props => [question, patientAnswers];
}

class Questions extends Equatable {
  int? id;
  dynamic? qype;
  dynamic? bankId;
  String? language;
  dynamic? time;
  dynamic? evalType;
  dynamic? courseCode;
  dynamic? examMode;
  String? difficultyLevel;
  String? questionType;
  String? description;
  dynamic? hint;
  dynamic? videoFile;
  dynamic? audioFile;
  dynamic? mark;
  dynamic? tags;
  dynamic? published;
  dynamic? createdBy;
  dynamic? createdAt;
  dynamic? deleted;
  int? examId;
  int? categoryId;
  dynamic? sectionId;
  dynamic? exam;
  dynamic? category;
  dynamic? section;
  List<Answers>? answers;

  Questions(
      {this.id,
      this.qype,
      this.bankId,
      this.language,
      this.time,
      this.evalType,
      this.courseCode,
      this.examMode,
      this.difficultyLevel,
      this.questionType,
      this.description,
      this.hint,
      this.videoFile,
      this.audioFile,
      this.mark,
      this.tags,
      this.published,
      this.createdBy,
      this.createdAt,
      this.deleted,
      this.examId,
      this.categoryId,
      this.sectionId,
      this.exam,
      this.category,
      this.section,
      this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    qype = json["qype"];
    bankId = json["bankId"];
    language = json["language"];
    time = json["time"];
    evalType = json["evalType"];
    courseCode = json["courseCode"];
    examMode = json["examMode"];
    difficultyLevel = json["difficultyLevel"];
    questionType = json["questionType"];
    description = json["description"];
    hint = json["hint"];
    videoFile = json["videoFile"];
    audioFile = json["audioFile"];
    mark = json["mark"];
    tags = json["tags"];
    published = json["published"];
    createdBy = json["createdBy"];
    createdAt = json["createdAt"];
    deleted = json["deleted"];
    examId = json["examId"];
    categoryId = json["categoryId"];
    sectionId = json["sectionId"];
    exam = json["exam"];
    category = json["category"];
    section = json["section"];
    answers = json["answers"] == null
        ? null
        : (json["answers"] as List).map((e) => Answers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["qype"] = qype;
    data["bankId"] = bankId;
    data["language"] = language;
    data["time"] = time;
    data["evalType"] = evalType;
    data["courseCode"] = courseCode;
    data["examMode"] = examMode;
    data["difficultyLevel"] = difficultyLevel;
    data["questionType"] = questionType;
    data["description"] = description;
    data["hint"] = hint;
    data["videoFile"] = videoFile;
    data["audioFile"] = audioFile;
    data["mark"] = mark;
    data["tags"] = tags;
    data["published"] = published;
    data["createdBy"] = createdBy;
    data["createdAt"] = createdAt;
    data["deleted"] = deleted;
    data["examId"] = examId;
    data["categoryId"] = categoryId;
    data["sectionId"] = sectionId;
    data["exam"] = exam;
    data["category"] = category;
    data["section"] = section;
    if (answers != null)
      data["answers"] = answers?.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        qype,
        bankId,
        language,
        time,
        evalType,
        courseCode,
        examMode,
        difficultyLevel,
        questionType,
        description,
        hint,
        videoFile,
        audioFile,
        mark,
        tags,
        published,
        createdBy,
        createdAt,
        deleted,
        examId,
        categoryId,
        sectionId,
        exam,
        category,
        section,
        answers
      ];
}

class Answers extends Equatable {
  int? id;
  int? questionId;
  String? answerOption;
  dynamic? isTrueAnswer;
  dynamic? isOther;
  dynamic? mark;
  dynamic? altAnswers;

  Answers(
      {this.id,
      this.questionId,
      this.answerOption,
      this.isTrueAnswer,
      this.isOther,
      this.mark,
      this.altAnswers});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    questionId = json["questionId"];
    answerOption = json["answerOption"];
    isTrueAnswer = json["isTrueAnswer"];
    isOther = json["isOther"];
    mark = json["mark"];
    altAnswers = json["altAnswers"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["questionId"] = questionId;
    data["answerOption"] = answerOption;
    data["isTrueAnswer"] = isTrueAnswer;
    data["isOther"] = isOther;
    data["mark"] = mark;
    data["altAnswers"] = altAnswers;
    return data;
  }

  @override
  List<Object?> get props =>
      [id, questionId, answerOption, isTrueAnswer, isOther, mark, altAnswers];
}
