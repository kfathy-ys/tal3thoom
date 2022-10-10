
class SsrsQuestionModel {
  Question? question;

  SsrsQuestionModel({this.question});

  SsrsQuestionModel.fromJson(Map<String, dynamic> json) {
    question = json["question"] == null ? null : Question.fromJson(json["question"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(question != null)
      data["question"] = question?.toJson();
    return data;
  }
}

class Question {
  int? id;
  dynamic? qype;
  dynamic? bankId;
  String? language;
  dynamic? time;
  dynamic? evalType;
  dynamic? courseCode;
  dynamic? examMode;
  dynamic? difficultyLevel;
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
  dynamic? categoryId;
  int? sectionId;
  dynamic? exam;
  dynamic? category;
  Section? section;
  List<Answers>? answers;

  Question({this.id, this.qype, this.bankId, this.language, this.time, this.evalType, this.courseCode, this.examMode, this.difficultyLevel, this.questionType, this.description, this.hint, this.videoFile, this.audioFile, this.mark, this.tags, this.published, this.createdBy, this.createdAt, this.deleted, this.examId, this.categoryId, this.sectionId, this.exam, this.category, this.section, this.answers});

  Question.fromJson(Map<String, dynamic> json) {
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
    section = json["section"] == null ? null : Section.fromJson(json["section"]);
    answers = json["answers"]==null ? null : (json["answers"] as List).map((e)=>Answers.fromJson(e)).toList();
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
    if(section != null)
      data["section"] = section?.toJson();
    if(answers != null)
      data["answers"] = answers?.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Answers {
  int? id;
  int? questionId;
  String? answerOption;
  dynamic? isTrueAnswer;
  dynamic? isOther;
  double? mark;
  dynamic? altAnswers;

  Answers({this.id, this.questionId, this.answerOption, this.isTrueAnswer, this.isOther, this.mark, this.altAnswers});

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
}

class Section {
  int? id;
  String? sectionName;
  String? sectionNameEn;
  int? examId;
  dynamic? lightStart;
  dynamic? lightEnd;
  dynamic? lightToMediumStart;
  dynamic? lightToMediumEnd;
  dynamic? mediumStart;
  dynamic? mediumEnd;
  dynamic? mediumToExtremeStart;
  dynamic? mediumToExtremeEnd;
  dynamic? extremeStart;
  dynamic? extremeEnd;
  dynamic? exam;
  dynamic? questions;

  Section({this.id, this.sectionName, this.sectionNameEn, this.examId, this.lightStart, this.lightEnd, this.lightToMediumStart, this.lightToMediumEnd, this.mediumStart, this.mediumEnd, this.mediumToExtremeStart, this.mediumToExtremeEnd, this.extremeStart, this.extremeEnd, this.exam, this.questions});

  Section.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    sectionName = json["sectionName"];
    sectionNameEn = json["sectionNameEn"];
    examId = json["examId"];
    lightStart = json["lightStart"];
    lightEnd = json["lightEnd"];
    lightToMediumStart = json["lightToMediumStart"];
    lightToMediumEnd = json["lightToMediumEnd"];
    mediumStart = json["mediumStart"];
    mediumEnd = json["mediumEnd"];
    mediumToExtremeStart = json["mediumToExtremeStart"];
    mediumToExtremeEnd = json["mediumToExtremeEnd"];
    extremeStart = json["extremeStart"];
    extremeEnd = json["extremeEnd"];
    exam = json["exam"];
    questions = json["questions"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["sectionName"] = sectionName;
    data["sectionNameEn"] = sectionNameEn;
    data["examId"] = examId;
    data["lightStart"] = lightStart;
    data["lightEnd"] = lightEnd;
    data["lightToMediumStart"] = lightToMediumStart;
    data["lightToMediumEnd"] = lightToMediumEnd;
    data["mediumStart"] = mediumStart;
    data["mediumEnd"] = mediumEnd;
    data["mediumToExtremeStart"] = mediumToExtremeStart;
    data["mediumToExtremeEnd"] = mediumToExtremeEnd;
    data["extremeStart"] = extremeStart;
    data["extremeEnd"] = extremeEnd;
    data["exam"] = exam;
    data["questions"] = questions;
    return data;
  }
}