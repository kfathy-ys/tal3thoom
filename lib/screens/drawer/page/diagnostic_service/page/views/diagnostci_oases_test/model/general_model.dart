// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
//
// import 'package:equatable/equatable.dart';
//
// class GeneralModel extends Equatable {
//   final List<AllInfo> data;
//   final List<dynamic> messages;
//   final int status;
//   final int dataLength;
//   const GeneralModel({
//     required this.data,
//     required this.messages,
//     required this.status,
//     required this.dataLength,
//   });
//
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'data': data.map((x) => x.toMap()).toList(),
//       'messages': messages,
//       'status': status,
//       'dataLength': dataLength,
//     };
//   }
//
//   factory GeneralModel.fromMap(Map<String, dynamic> map) {
//     return GeneralModel(
//         data: List<AllInfo>.from((map['data'] as List<int>).map<AllInfo>((x) => AllInfo.fromMap(x as Map<String,dynamic>),),),
//     messages: List<dynamic>.from((map['messages'] as List<dynamic>),
//     status: map['status'].toInt() as int,
//     dataLength: map['dataLength'].toInt() as int,
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory GeneralModel.fromJson(String source) => GeneralModel.fromMap(json.decode(source) as Map<String, dynamic>);
//
//
//
//
//
//   @override
//   List<Object> get props => [data, messages, status, dataLength];
// }
//
// class AllInfo extends Equatable {
//   final Question question;
//   final PatientAnswers patientAnswers;
//   const AllInfo({
//     required this.question,
//     required this.patientAnswers,
//   });
//
//
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'question': question.toMap(),
//       'patientAnswers': patientAnswers.toMap(),
//     };
//   }
//
//   factory AllInfo.fromMap(Map<String, dynamic> map) {
//     return AllInfo(
//       question: Question.fromMap(map['question'] as Map<String,dynamic>),
//       patientAnswers: PatientAnswers.fromMap(map['patientAnswers'] as Map<String,dynamic>),
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory AllInfo.fromJson(String source) => AllInfo.fromMap(json.decode(source) as Map<String, dynamic>);
//
//
//   @override
//   List<Object> get props => [question, patientAnswers];
// }
//
// class Question extends Equatable {
//   final int id;
//   final Qype qype;
//   final BankId bankId;
//   final String language;
//   final Time time;
//   final EvalType evalType;
//   final CourseCode courseCode;
//   final ExamMode examMode;
//   final DifficultyLevel difficultyLevel;
//   final String questionType;
//   final String description;
//   final Hint hint;
//   final VideoFile videoFile;
//   final AudioFile audioFile;
//   final Mark mark;
//   final Tags tags;
//   final Published published;
//   final CreatedBy createdBy;
//   final CreatedAt createdAt;
//   final Deleted deleted;
//   final int examId;
//   final int categoryId;
//   final int sectionId;
//   final Exam exam;
//   final Category category;
//   final Section section;
//   final List<Answer> answers;
//   Question({
//     required this.id,
//     required this.qype,
//     required this.bankId,
//     required this.language,
//     required this.time,
//     required this.evalType,
//     required this.courseCode,
//     required this.examMode,
//     required this.difficultyLevel,
//     required this.questionType,
//     required this.description,
//     required this.hint,
//     required this.videoFile,
//     required this.audioFile,
//     required this.mark,
//     required this.tags,
//     required this.published,
//     required this.createdBy,
//     required this.createdAt,
//     required this.deleted,
//     required this.examId,
//     required this.categoryId,
//     required this.sectionId,
//     required this.exam,
//     required this.category,
//     required this.section,
//     required this.answers,
//   });
//
//
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'qype': qype.toMap(),
//       'bankId': bankId.toMap(),
//       'language': language,
//       'time': time.toMap(),
//       'evalType': evalType.toMap(),
//       'courseCode': courseCode.toMap(),
//       'examMode': examMode.toMap(),
//       'difficultyLevel': difficultyLevel.toMap(),
//       'questionType': questionType,
//       'description': description,
//       'hint': hint.toMap(),
//       'videoFile': videoFile.toMap(),
//       'audioFile': audioFile.toMap(),
//       'mark': mark.toMap(),
//       'tags': tags.toMap(),
//       'published': published.toMap(),
//       'createdBy': createdBy.toMap(),
//       'createdAt': createdAt.toMap(),
//       'deleted': deleted.toMap(),
//       'examId': examId,
//       'categoryId': categoryId,
//       'sectionId': sectionId,
//       'exam': exam.toMap(),
//       'category': category.toMap(),
//       'section': section.toMap(),
//       'answers': answers.map((x) => x.toMap()).toList(),
//     };
//   }
//
//   factory Question.fromMap(Map<String, dynamic> map) {
//     return Question(
//       id: map['id'].toInt() as int,
//       qype: Qype.fromMap(map['qype'] as Map<String,dynamic>),
//       bankId: BankId.fromMap(map['bankId'] as Map<String,dynamic>),
//       language: map['language'] as String,
//       time: Time.fromMap(map['time'] as Map<String,dynamic>),
//       evalType: EvalType.fromMap(map['evalType'] as Map<String,dynamic>),
//       courseCode: CourseCode.fromMap(map['courseCode'] as Map<String,dynamic>),
//       examMode: ExamMode.fromMap(map['examMode'] as Map<String,dynamic>),
//       difficultyLevel: DifficultyLevel.fromMap(map['difficultyLevel'] as Map<String,dynamic>),
//       questionType: map['questionType'] as String,
//       description: map['description'] as String,
//       hint: Hint.fromMap(map['hint'] as Map<String,dynamic>),
//       videoFile: VideoFile.fromMap(map['videoFile'] as Map<String,dynamic>),
//       audioFile: AudioFile.fromMap(map['audioFile'] as Map<String,dynamic>),
//       mark: Mark.fromMap(map['mark'] as Map<String,dynamic>),
//       tags: Tags.fromMap(map['tags'] as Map<String,dynamic>),
//       published: Published.fromMap(map['published'] as Map<String,dynamic>),
//       createdBy: CreatedBy.fromMap(map['createdBy'] as Map<String,dynamic>),
//       createdAt: CreatedAt.fromMap(map['createdAt'] as Map<String,dynamic>),
//       deleted: Deleted.fromMap(map['deleted'] as Map<String,dynamic>),
//       examId: map['examId'].toInt() as int,
//       categoryId: map['categoryId'].toInt() as int,
//       sectionId: map['sectionId'].toInt() as int,
//       exam: Exam.fromMap(map['exam'] as Map<String,dynamic>),
//       category: Category.fromMap(map['category'] as Map<String,dynamic>),
//       section: Section.fromMap(map['section'] as Map<String,dynamic>),
//       answers: List<Answer>.from((map['answers'] as List<int>).map<Answer>((x) => Answer.fromMap(x as Map<String,dynamic>),),),
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);
//
//
//
//
//
//
//   @override
//   List<Object> get props {
//     return [
//       id,
//       qype,
//       bankId,
//       language,
//       time,
//       evalType,
//       courseCode,
//       examMode,
//       difficultyLevel,
//       questionType,
//       description,
//       hint,
//       videoFile,
//       audioFile,
//       mark,
//       tags,
//       published,
//       createdBy,
//       createdAt,
//       deleted,
//       examId,
//       categoryId,
//       sectionId,
//       exam,
//       category,
//       section,
//       answers,
//     ];
//   }
// }
//
//
//
// class Category extends Equatable {
//   final int id;
//   final String category;
//   final Questions questions;
//   Category({
//     required this.id,
//     required this.category,
//     required this.questions,
//   });
//
//
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'category': category,
//       'questions': questions.toMap(),
//     };
//   }
//
//   factory Category.fromMap(Map<String, dynamic> map) {
//     return Category(
//       id: map['id'].toInt() as int,
//       category: map['category'] as String,
//       questions: Questions.fromMap(map['questions'] as Map<String,dynamic>),
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory Category.fromJson(String source) => Category.fromMap(json.decode(source) as Map<String, dynamic>);
//
//
//
//   @override
//   List<Object> get props => [id, category, questions];
// }
//
//
//
// class Section extends Equatable {
//   final int id;
//   final String sectionName;
//   final String sectionNameEn;
//   final int examId;
//   final int lightStart;
//   final double lightEnd;
//   final double lightToMediumStart;
//   final double lightToMediumEnd;
//   final double mediumStart;
//   final double mediumEnd;
//   final int mediumToExtremeStart;
//   final double mediumToExtremeEnd;
//   final double extremeStart;
//   final int extremeEnd;
//   final Exam exam;
//   final Questions questions;
//   Section({
//     required this.id,
//     required this.sectionName,
//     required this.sectionNameEn,
//     required this.examId,
//     required this.lightStart,
//     required this.lightEnd,
//     required this.lightToMediumStart,
//     required this.lightToMediumEnd,
//     required this.mediumStart,
//     required this.mediumEnd,
//     required this.mediumToExtremeStart,
//     required this.mediumToExtremeEnd,
//     required this.extremeStart,
//     required this.extremeEnd,
//     required this.exam,
//     required this.questions,
//   });
//
//
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'sectionName': sectionName,
//       'sectionNameEn': sectionNameEn,
//       'examId': examId,
//       'lightStart': lightStart,
//       'lightEnd': lightEnd,
//       'lightToMediumStart': lightToMediumStart,
//       'lightToMediumEnd': lightToMediumEnd,
//       'mediumStart': mediumStart,
//       'mediumEnd': mediumEnd,
//       'mediumToExtremeStart': mediumToExtremeStart,
//       'mediumToExtremeEnd': mediumToExtremeEnd,
//       'extremeStart': extremeStart,
//       'extremeEnd': extremeEnd,
//       'exam': exam.toMap(),
//       'questions': questions.toMap(),
//     };
//   }
//
//   factory Section.fromMap(Map<String, dynamic> map) {
//     return Section(
//       id: map['id'].toInt() as int,
//       sectionName: map['sectionName'] as String,
//       sectionNameEn: map['sectionNameEn'] as String,
//       examId: map['examId'].toInt() as int,
//       lightStart: map['lightStart'].toInt() as int,
//       lightEnd: map['lightEnd'].toDouble() as double,
//       lightToMediumStart: map['lightToMediumStart'].toDouble() as double,
//       lightToMediumEnd: map['lightToMediumEnd'].toDouble() as double,
//       mediumStart: map['mediumStart'].toDouble() as double,
//       mediumEnd: map['mediumEnd'].toDouble() as double,
//       mediumToExtremeStart: map['mediumToExtremeStart'].toInt() as int,
//       mediumToExtremeEnd: map['mediumToExtremeEnd'].toDouble() as double,
//       extremeStart: map['extremeStart'].toDouble() as double,
//       extremeEnd: map['extremeEnd'].toInt() as int,
//       exam: Exam.fromMap(map['exam'] as Map<String,dynamic>),
//       questions: Questions.fromMap(map['questions'] as Map<String,dynamic>),
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory Section.fromJson(String source) => Section.fromMap(json.decode(source) as Map<String, dynamic>);
//
//   @override
//   List<Object> get props {
//     return [
//       id,
//       sectionName,
//       sectionNameEn,
//       examId,
//       lightStart,
//       lightEnd,
//       lightToMediumStart,
//       lightToMediumEnd,
//       mediumStart,
//       mediumEnd,
//       mediumToExtremeStart,
//       mediumToExtremeEnd,
//       extremeStart,
//       extremeEnd,
//       exam,
//       questions,
//     ];
//   }
// }
//
// class Answer extends Equatable {
//   final int id;
//   final int questionId;
//   final String answerOption;
//   final IsTrueAnswer isTrueAnswer;
//   final IsOther isOther;
//   final int mark;
//   final AltAnswers altAnswers;
//   Answer({
//     required this.id,
//     required this.questionId,
//     required this.answerOption,
//     required this.isTrueAnswer,
//     required this.isOther,
//     required this.mark,
//     required this.altAnswers,
//   });
//
//   Answer copyWith({
//     int? id,
//     int? questionId,
//     String? answerOption,
//     IsTrueAnswer? isTrueAnswer,
//     IsOther? isOther,
//     int? mark,
//     AltAnswers? altAnswers,
//   }) {
//     return Answer(
//       id: id ?? this.id,
//       questionId: questionId ?? this.questionId,
//       answerOption: answerOption ?? this.answerOption,
//       isTrueAnswer: isTrueAnswer ?? this.isTrueAnswer,
//       isOther: isOther ?? this.isOther,
//       mark: mark ?? this.mark,
//       altAnswers: altAnswers ?? this.altAnswers,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'questionId': questionId,
//       'answerOption': answerOption,
//       'isTrueAnswer': isTrueAnswer.toMap(),
//       'isOther': isOther.toMap(),
//       'mark': mark,
//       'altAnswers': altAnswers.toMap(),
//     };
//   }
//
//   factory Answer.fromMap(Map<String, dynamic> map) {
//     return Answer(
//       id: map['id'].toInt() as int,
//       questionId: map['questionId'].toInt() as int,
//       answerOption: map['answerOption'] as String,
//       isTrueAnswer: IsTrueAnswer.fromMap(map['isTrueAnswer'] as Map<String,dynamic>),
//       isOther: IsOther.fromMap(map['isOther'] as Map<String,dynamic>),
//       mark: map['mark'].toInt() as int,
//       altAnswers: AltAnswers.fromMap(map['altAnswers'] as Map<String,dynamic>),
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source) as Map<String, dynamic>);
//
//
//
//   @override
//   List<Object> get props {
//     return [
//       id,
//       questionId,
//       answerOption,
//       isTrueAnswer,
//       isOther,
//       mark,
//       altAnswers,
//     ];
//   }
// }
//
