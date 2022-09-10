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
  final Object? hint;
  final Object? videoFile;
  final Object? audioFile;
  final Object? mark;
  final Object? tags;
  final Object? published;

  final Object? deleted;
  final int examId;
  final int categoryId;
  final Object? sectionId;
  final Object? exam;
  final Object? category;
  final Object? section;
 final List<Answers>  answers;

  const Question(
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
      required this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json["question"]["id"] ,
        qype: json["question"]["qype"],
        bankId: json["question"]["bankId"],
        language: json["question"]["language"],
        time: json["question"]["time"],
        evalType: json["question"]["evalType"],
        courseCode: json["question"]["courseCode"],
        examMode: json["question"]["examMode"],
        difficultyLevel: json["question"]["difficultyLevel"],
        questionType: json["question"]["questionType"],
        description: json["question"]["description"],
        hint: json["question"]["hint"],
        videoFile: json["question"]["videoFile"],
        audioFile: json["question"]["audioFile"],
        mark: json["question"]["mark"],
        tags: json["question"]["tags"],
        published: json["question"]["published"],
        deleted: json["question"]["deleted"],
        examId: json["question"]["examId"],
        categoryId: json["question"]["categoryId"],
        sectionId: json["question"]["section"],
        exam: json["question"]["exam"],
        category: json["question"]["category"],
        section: json["question"]["section"],
        answers:  json["question"]["answers"] ==null ? []: List.from( json["question"]["answers"])
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

  const Answers(
      {required this.id,
      required this.questionId,
      required this.answerOption,
      required this.isTrueAnswer,
      required this.isOther,
      required this.mark,
      required this.altAnswers});

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
        id: json["id"],
        questionId: json["questionId"],
        answerOption: json["answerOption"],
        isTrueAnswer: json["isTrueAnswer"],
        isOther: json["isOther"] ?? false,
        mark: json["mark"],
        altAnswers: json["altAnswers"]);
  }

  @override
  List<Object?> get props =>
      [id, questionId, answerOption, isTrueAnswer, isOther, mark, altAnswers];
}
