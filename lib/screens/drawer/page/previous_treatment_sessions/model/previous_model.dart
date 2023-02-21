import 'package:equatable/equatable.dart';

class PreviousAnswersModel {
  AllSections? data;
  List<Messages>? messages;
  int? status;
  int? dataLength;

  PreviousAnswersModel({this.data, this.status, this.dataLength});

  PreviousAnswersModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AllSections.fromJson(json['data']) : null;

    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
    status = json['status'];
    dataLength = json['dataLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['dataLength'] = dataLength;
    return data;
  }
}

class AllSections extends Equatable {
  List<CognitiveResult>? cognitiveResult;
  List<BehavioralResult>? behavioralResult;
  Conclution? conclution;
  CurrentEvalution? currentEvalution;
  CurrentEvalution? nextEvalution;

  AllSections(
      {this.cognitiveResult,
      this.behavioralResult,
      this.conclution,
      this.currentEvalution,
      this.nextEvalution});

  AllSections.fromJson(Map<String, dynamic> json) {
    if (json['cognitiveResult'] != null) {
      cognitiveResult = <CognitiveResult>[];
      json['cognitiveResult'].forEach((v) {
        cognitiveResult!.add(CognitiveResult.fromJson(v));
      });
    }
    if (json['behavioralResult'] != null) {
      behavioralResult = <BehavioralResult>[];
      json['behavioralResult'].forEach((v) {
        behavioralResult!.add(BehavioralResult.fromJson(v));
      });
    }
    conclution = json['conclution'] != null
        ? Conclution.fromJson(json['conclution'])
        : null;
    currentEvalution = json['currentEvalution'] != null
        ? CurrentEvalution.fromJson(json['currentEvalution'])
        : null;
    nextEvalution = json['nextEvalution'] != null
        ? CurrentEvalution.fromJson(json['nextEvalution'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cognitiveResult != null) {
      data['cognitiveResult'] =
          cognitiveResult!.map((v) => v.toJson()).toList();
    }
    if (behavioralResult != null) {
      data['behavioralResult'] =
          behavioralResult!.map((v) => v.toJson()).toList();
    }
    if (conclution != null) {
      data['conclution'] = conclution!.toJson();
    }
    if (currentEvalution != null) {
      data['currentEvalution'] = currentEvalution!.toJson();
    }
    if (nextEvalution != null) {
      data['nextEvalution'] = nextEvalution!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        cognitiveResult,
        behavioralResult,
        conclution,
        currentEvalution,
        nextEvalution
      ];
}

class BehavioralResult extends Equatable {
  Question? question;
  List<String>? patientAnswers;

  BehavioralResult({this.question, this.patientAnswers});

  BehavioralResult.fromJson(Map<String, dynamic> json) {
    question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
    patientAnswers = json['patientAnswers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (question != null) {
      data['question'] = question!.toJson();
    }
    data['patientAnswers'] = patientAnswers;
    return data;
  }

  @override
  List<Object?> get props => [question, patientAnswers];
}

class CognitiveResult extends Equatable {
  Question? question;
  List<String>? patientAnswers;

  CognitiveResult({this.question, this.patientAnswers});

  CognitiveResult.fromJson(Map<String, dynamic> json) {
    question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
    patientAnswers = json["patientAnswers"] == null
        ? null
        : List<String>.from(json["patientAnswers"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (question != null) {
      data['question'] = question!.toJson();
    }
    data['patientAnswers'] = patientAnswers;
    return data;
  }

  @override
  List<Object?> get props => [question, patientAnswers];
}

class Question extends Equatable {
  int? id;
  dynamic qype;
  dynamic bankId;
  String? language;
  dynamic time;
  dynamic evalType;
  dynamic courseCode;
  dynamic examMode;
  dynamic difficultyLevel;
  String? questionType;
  String? description;
  dynamic hint;
  String? videoFile;
  dynamic audioFile;
  dynamic mark;
  dynamic tags;
  dynamic published;
  dynamic createdBy;
  dynamic createdAt;
  dynamic deleted;
  int? examId;
  dynamic categoryId;
  int? sectionId;
  dynamic exam;
  dynamic category;
  Section? section;
  List<Answers>? answers;

  Question(
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

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qype = json['qype'];
    bankId = json['bankId'];
    language = json['language'];
    time = json['time'];
    evalType = json['evalType'];
    courseCode = json['courseCode'];
    examMode = json['examMode'];
    difficultyLevel = json['difficultyLevel'];
    questionType = json['questionType'];
    description = json['description'];
    hint = json['hint'];
    videoFile = json['videoFile'];
    audioFile = json['audioFile'];
    mark = json['mark'];
    tags = json['tags'];
    published = json['published'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    deleted = json['deleted'];
    examId = json['examId'];
    categoryId = json['categoryId'];
    sectionId = json['sectionId'];
    exam = json['exam'];
    category = json['category'];
    section =
        json['section'] != null ? Section.fromJson(json['section']) : null;
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qype'] = qype;
    data['bankId'] = bankId;
    data['language'] = language;
    data['time'] = time;
    data['evalType'] = evalType;
    data['courseCode'] = courseCode;
    data['examMode'] = examMode;
    data['difficultyLevel'] = difficultyLevel;
    data['questionType'] = questionType;
    data['description'] = description;
    data['hint'] = hint;
    data['videoFile'] = videoFile;
    data['audioFile'] = audioFile;
    data['mark'] = mark;
    data['tags'] = tags;
    data['published'] = published;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['deleted'] = deleted;
    data['examId'] = examId;
    data['categoryId'] = categoryId;
    data['sectionId'] = sectionId;
    data['exam'] = exam;
    data['category'] = category;
    if (section != null) {
      data['section'] = section!.toJson();
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
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

class Section extends Equatable {
  int? id;
  String? sectionName;
  dynamic sectionNameEn;
  int? examId;
  dynamic lightStart;
  dynamic lightEnd;
  dynamic lightToMediumStart;
  dynamic lightToMediumEnd;
  dynamic mediumStart;
  dynamic mediumEnd;
  dynamic mediumToExtremeStart;
  dynamic mediumToExtremeEnd;
  dynamic extremeStart;
  dynamic extremeEnd;
  dynamic exam;
  dynamic questions;

  Section(
      {this.id,
      this.sectionName,
      this.sectionNameEn,
      this.examId,
      this.lightStart,
      this.lightEnd,
      this.lightToMediumStart,
      this.lightToMediumEnd,
      this.mediumStart,
      this.mediumEnd,
      this.mediumToExtremeStart,
      this.mediumToExtremeEnd,
      this.extremeStart,
      this.extremeEnd,
      this.exam,
      this.questions});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionName = json['sectionName'];
    sectionNameEn = json['sectionNameEn'];
    examId = json['examId'];
    lightStart = json['lightStart'];
    lightEnd = json['lightEnd'];
    lightToMediumStart = json['lightToMediumStart'];
    lightToMediumEnd = json['lightToMediumEnd'];
    mediumStart = json['mediumStart'];
    mediumEnd = json['mediumEnd'];
    mediumToExtremeStart = json['mediumToExtremeStart'];
    mediumToExtremeEnd = json['mediumToExtremeEnd'];
    extremeStart = json['extremeStart'];
    extremeEnd = json['extremeEnd'];
    exam = json['exam'];
    questions = json['questions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sectionName'] = sectionName;
    data['sectionNameEn'] = sectionNameEn;
    data['examId'] = examId;
    data['lightStart'] = lightStart;
    data['lightEnd'] = lightEnd;
    data['lightToMediumStart'] = lightToMediumStart;
    data['lightToMediumEnd'] = lightToMediumEnd;
    data['mediumStart'] = mediumStart;
    data['mediumEnd'] = mediumEnd;
    data['mediumToExtremeStart'] = mediumToExtremeStart;
    data['mediumToExtremeEnd'] = mediumToExtremeEnd;
    data['extremeStart'] = extremeStart;
    data['extremeEnd'] = extremeEnd;
    data['exam'] = exam;
    data['questions'] = questions;
    return data;
  }

  @override
  List<Object?> get props => [
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
        questions
      ];
}

class Answers extends Equatable {
  int? id;
  int? questionId;
  String? answerOption;
  bool? isTrueAnswer;
  dynamic isOther;
  dynamic mark;
  dynamic altAnswers;

  Answers(
      {this.id,
      this.questionId,
      this.answerOption,
      this.isTrueAnswer,
      this.isOther,
      this.mark,
      this.altAnswers});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['questionId'];
    answerOption = json['answerOption'];
    isTrueAnswer = json['isTrueAnswer'];
    isOther = json['isOther'];
    mark = json['mark'];
    altAnswers = json['altAnswers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['questionId'] = questionId;
    data['answerOption'] = answerOption;
    data['isTrueAnswer'] = isTrueAnswer;
    data['isOther'] = isOther;
    data['mark'] = mark;
    data['altAnswers'] = altAnswers;
    return data;
  }

  @override
  List<Object?> get props =>
      [id, questionId, answerOption, isTrueAnswer, isOther, mark, altAnswers];
}

class Conclution extends Equatable {
  int? totalCognitiveQuestions;
  int? correctCognitiveAnswers;
  dynamic? answerdVideo;

  Conclution(
      {this.totalCognitiveQuestions,
      this.correctCognitiveAnswers,
      this.answerdVideo});

  Conclution.fromJson(Map<String, dynamic> json) {
    totalCognitiveQuestions = json['totalCognitiveQuestions'];
    correctCognitiveAnswers = json['correctCognitiveAnswers'];
    answerdVideo = json['answerdVideo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCognitiveQuestions'] = totalCognitiveQuestions;
    data['correctCognitiveAnswers'] = correctCognitiveAnswers;
    data['answerdVideo'] = answerdVideo;
    return data;
  }

  @override
  List<Object?> get props =>
      [totalCognitiveQuestions, correctCognitiveAnswers, answerdVideo];
}

class CurrentEvalution extends Equatable {
  String? name;
  num? patientRank;
  num? specialistRank;

  CurrentEvalution({this.name, this.patientRank, this.specialistRank});

  CurrentEvalution.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    patientRank = json['patientRank'] ?? 0;
    specialistRank = json['specialistRank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['patientRank'] = patientRank;
    data['specialistRank'] = specialistRank;
    return data;
  }

  @override
  List<Object?> get props => [name, patientRank, specialistRank];
}

class Messages extends Equatable {
  dynamic code;
  dynamic body;
  String? title;
  int? type;

  Messages({this.code, this.body, this.title, this.type});

  Messages.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    body = json['body'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['body'] = body;
    data['title'] = title;
    data['type'] = type;
    return data;
  }

  @override
  List<Object?> get props => [code, body, title, type];
}
