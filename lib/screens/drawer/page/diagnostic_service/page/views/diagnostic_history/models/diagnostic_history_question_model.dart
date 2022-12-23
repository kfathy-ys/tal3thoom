// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int id;
  final Object? qype;
  final Object? bankId;
  final String language;
  final Object? time;
  final Object? evalType;
  final Object? courseCode;
  final Object? examMode;
  final String? difficultyLevel;
  final String questionType;
  final String description;
  bool isAnswred;
  final Object? hint;
  final dynamic videoFile;
  final Object? audioFile;
  final Object? mark;
  final Object? tags;
  final Object? published;
  final Object? deleted;
  final int examId;
  final int categoryId;
  final int sectionId;
  final Object? exam;
  final CategoryModel? category;
  final SectionModel? section;
  final List<Answers> answers;

  Question(
      {required this.id,
      required this.qype,
      required this.bankId,
      required this.language,
      required this.time,
      required this.evalType,
      required this.courseCode,
      required this.examMode,
      required this.difficultyLevel,
      required this.questionType,
      required this.description,
      required this.hint,
      required this.videoFile,
      required this.audioFile,
      required this.mark,
      required this.tags,
      required this.published,
      required this.deleted,
      required this.examId,
      required this.categoryId,
      required this.sectionId,
      required this.exam,
      required this.category,
      required this.section,
      required this.answers,
      this.isAnswred = false});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json["question"]["id"],
        qype: json["question"]["qype"],
        bankId: json["question"]["bankId"],
        language: json["question"]["language"],
        time: json["question"]["time"],
        evalType: json["question"]["evalType"] ?? "",
        courseCode: json["question"]["courseCode"],
        examMode: json["question"]["examMode"],
        difficultyLevel: json["question"]["difficultyLevel"],
        questionType: json["question"]["questionType"],
        description: json["question"]["description"] ?? "",
        hint: json["question"]["hint"],
        videoFile: json["question"]["videoFile"],
        audioFile: json["question"]["audioFile"],
        mark: json["question"]["mark"],
        tags: json["question"]["tags"],
        published: json["question"]["published"],
        deleted: json["question"]["deleted"],
        examId: json["question"]["examId"],
        categoryId: json["question"]["categoryId"] == null
            ? 0
            : (json["question"]["categoryId"]),
        sectionId: json["question"]["sectionId"] ?? 0,
        exam: json["question"]["exam"],
        category: json["question"]["category"] == null
            ? null
            : CategoryModel.fromMap(json["question"]["category"]),
        section: json["question"]["section"] == null
            ? null
            : SectionModel.fromMap(json["question"]["section"]),
        answers: json["question"]["answers"] == null
            ? []
            : List.from(json["question"]["answers"])
                .map((e) => Answers.fromJson(e))
                .toList());
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
  final int id;
  final int questionId;
  final String answerOption;
  final Object? isTrueAnswer;
  final bool isOther;
  final Object? mark;
  final Object? altAnswers;
  bool isAnswered;

  Answers(
      {required this.id,
      required this.questionId,
      required this.answerOption,
      required this.isTrueAnswer,
      required this.isOther,
      required this.mark,
      required this.altAnswers,
      this.isAnswered = false});

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
        id: json["id"],
        questionId: json["questionId"],
        answerOption: json["answerOption"],
        isTrueAnswer: json["isTrueAnswer"],
        isOther: json["isOther"] ?? false,
        mark: json["mark"],
        altAnswers: json["altAnswers"],
        isAnswered: false);
  }

  @override
  List<Object?> get props =>
      [id, questionId, answerOption, isTrueAnswer, isOther, mark, altAnswers];
}

class SectionModel extends Equatable {
  final int id;
  final String sectionName;
  final String sectionNameEn;
  final int examId;
  final num lightStart;
  final num lightEnd;
  final num lightToMediumStart;
  final num lightToMediumEnd;
  final num mediumStart;
  final num mediumEnd;
  final num mediumToExtremeStart;
  final num mediumToExtremeEnd;
  final num extremeStart;
  final num extremeEnd;
  final Object exam;
  final Object questions;

  const SectionModel({
    required this.id,
    required this.sectionName,
    required this.sectionNameEn,
    required this.examId,
    required this.lightStart,
    required this.lightEnd,
    required this.lightToMediumStart,
    required this.lightToMediumEnd,
    required this.mediumStart,
    required this.mediumEnd,
    required this.mediumToExtremeStart,
    required this.mediumToExtremeEnd,
    required this.extremeStart,
    required this.extremeEnd,
    required this.exam,
    required this.questions,
  });

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: (map['id'].toInt() ?? 0) as int,
      sectionName: (map['sectionName'] ?? '') as String,
      sectionNameEn: (map['sectionNameEn'] ?? '') as String,
      examId: (map['examId'].toInt() ?? 0) as int,
      lightStart: (map['lightStart'] ?? 0),
      lightEnd: (map['lightEnd'] ?? 0.0) as double,
      lightToMediumStart: (map['lightToMediumStart'] ?? 0.0) as double,
      lightToMediumEnd: (map['lightToMediumEnd'] ?? 0.0) as double,
      mediumStart: (map['mediumStart'] ?? 0.0) as double,
      mediumEnd: (map['mediumEnd'] ?? 0.0) as double,
      mediumToExtremeStart: (map['mediumToExtremeStart'] ?? 0),
      mediumToExtremeEnd: (map['mediumToExtremeEnd'] ?? 0.0),
      extremeStart: (map['extremeStart'] ?? 0.0),
      extremeEnd: (map['extremeEnd'] ?? 0.0),
      exam: map['exam'] ?? "",
      questions: map['questions'] ?? "",
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      sectionName,
      sectionNameEn,
      examId,
      lightStart,
      lightEnd,
      lightToMediumStart,
      lightToMediumEnd,
      mediumStart,
      mediumEnd,
      mediumToExtremeStart,
      mediumToExtremeEnd,
      extremeStart,
      extremeEnd,
      exam,
      questions,
    ];
  }
}

class CategoryModel extends Equatable {
  final int id;
  final String category;
  final Question? questions;

  const CategoryModel({
    required this.id,
    required this.category,
    required this.questions,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: (map['id'].toInt() ?? 0) as int,
      category: (map['category'] ?? '') as String,
      questions: null,
    );
  }

  @override
  List<Object> get props => [
        id,
        category,
      ];
}

class Message extends Equatable {
  final String code;
  final String body;
  final String title;
  final int type;

  const Message({
    required this.code,
    required this.body,
    required this.title,
    required this.type,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      code: map['code'] as String,
      body: map['body'] as String,
      title: (map['title'] ?? '') as String,
      type: map['type'].toInt() as int,
    );
  }

  @override
  List<Object> get props => [code, body, title, type];
}
