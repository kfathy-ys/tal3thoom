import 'package:equatable/equatable.dart';

class MedicalReportsModel extends Equatable {
  AllReports? data;
  List<dynamic>? messages;
  int? status;
  int? dataLength;

  MedicalReportsModel({this.data, this.messages, this.status, this.dataLength});

  MedicalReportsModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : AllReports.fromJson(json["data"]);
    messages = json["messages"] ?? [];
    status = json["status"];
    dataLength = json["dataLength"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) data["data"] = this.data;
    if (messages != null) data["messages"] = messages;
    data["status"] = status;
    data["dataLength"] = dataLength;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, messages, status, dataLength];
}

class AllReports extends Equatable {
  int? id;
  String? reportName;
  int? patientId;
  int? specialistId;
  String? specialistName;
  String? specialistScientificDegree;
  int? supervisorId;
  String? supervisorName;
  String? enrolmentDate;
  dynamic? dischargeDate;
  String? stutteringWasBecoming;
  String? bornWith;
  String? stutteringNoticedAge;
  String? stutteringNoticedByWhome;
  String? theStuttering;
  String? hasBecome;
  String? exhibits;
  String? generatedBy;
  String? generatedAt;
  dynamic? regeneratedBy;
  dynamic? regeneratedAt;
  String? approvedBy;
  String? approvedAt;
  bool? isPending;
  bool? isRegenerated;
  bool? isApproved;
  String? heOrShe;
  String? hisOrHer;
  String? patientAge;
  int? frequencyScore;
  int? durationScore;
  int? physicalScore;
  String? stutteringDuration;
  int? totalScore;
  String? severityEquivalent;
  String? percentileRank;
  int? ssrsValue;
  Patient? patient;
  List<OasesResults>? oasesResults;
  List<VideosFrequencyDetails>? videosFrequencyDetails;

  AllReports(
      {this.id,
      this.reportName,
      this.patientId,
      this.specialistId,
      this.specialistName,
      this.specialistScientificDegree,
      this.supervisorId,
      this.supervisorName,
      this.enrolmentDate,
      this.dischargeDate,
      this.stutteringWasBecoming,
      this.bornWith,
      this.stutteringNoticedAge,
      this.stutteringNoticedByWhome,
      this.theStuttering,
      this.hasBecome,
      this.exhibits,
      this.generatedBy,
      this.generatedAt,
      this.regeneratedBy,
      this.regeneratedAt,
      this.approvedBy,
      this.approvedAt,
      this.isPending,
      this.isRegenerated,
      this.isApproved,
      this.heOrShe,
      this.hisOrHer,
      this.patientAge,
      this.frequencyScore,
      this.durationScore,
      this.physicalScore,
      this.stutteringDuration,
      this.totalScore,
      this.severityEquivalent,
      this.percentileRank,
      this.ssrsValue,
      this.patient,
      this.oasesResults,
      this.videosFrequencyDetails});

  AllReports.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    reportName = json["reportName"];
    patientId = json["patientId"];
    specialistId = json["specialistId"];
    specialistName = json["specialistName"];
    specialistScientificDegree = json["specialistScientificDegree"];
    supervisorId = json["supervisorId"];
    supervisorName = json["supervisorName"];
    enrolmentDate = json["enrolmentDate"];
    dischargeDate = json["dischargeDate"];
    stutteringWasBecoming = json["stutteringWasBecoming"];
    bornWith = json["bornWith"];
    stutteringNoticedAge = json["stutteringNoticedAge"];
    stutteringNoticedByWhome = json["stutteringNoticedByWhome"];
    theStuttering = json["theStuttering"];
    hasBecome = json["hasBecome"];
    exhibits = json["exhibits"];
    generatedBy = json["generatedBy"];
    generatedAt = json["generatedAt"];
    regeneratedBy = json["regeneratedBy"];
    regeneratedAt = json["regeneratedAt"];
    approvedBy = json["approvedBy"];
    approvedAt = json["approvedAt"];
    isPending = json["isPending"];
    isRegenerated = json["isRegenerated"];
    isApproved = json["isApproved"];
    heOrShe = json["he_or_she"];
    hisOrHer = json["his_or_her"];
    patientAge = json["patientAge"];
    frequencyScore = json["frequencyScore"];
    durationScore = json["durationScore"];
    physicalScore = json["physicalScore"];
    stutteringDuration = json["stutteringDuration"];
    totalScore = json["totalScore"];
    severityEquivalent = json["severityEquivalent"];
    percentileRank = json["percentileRank"];
    ssrsValue = json["ssrsValue"];
    patient =
        json["patient"] == null ? null : Patient.fromJson(json["patient"]);
    oasesResults = json["oasesResults"] == null
        ? null
        : (json["oasesResults"] as List)
            .map((e) => OasesResults.fromJson(e))
            .toList();
    videosFrequencyDetails = json["videosFrequencyDetails"] == null
        ? null
        : (json["videosFrequencyDetails"] as List)
            .map((e) => VideosFrequencyDetails.fromJson(e))
            .toList();
  }


  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        reportName,
        patientId,
        specialistId,
        specialistName,
        supervisorId,
        supervisorName,
        enrolmentDate,
        dischargeDate,
        stutteringWasBecoming,
        bornWith,
        stutteringNoticedAge,
        stutteringNoticedByWhome,
        theStuttering,
        hasBecome,
        exhibits,
        generatedBy,
        generatedAt,
        regeneratedBy,
        regeneratedAt,
        approvedBy,
        approvedAt,
        isPending,
        isRegenerated,
        isApproved,
        heOrShe,
        hisOrHer,
        patientAge,
        frequencyScore,
        durationScore,
        physicalScore,
        stutteringDuration,
        totalScore,
        severityEquivalent,
        percentileRank,
        ssrsValue,
        patient,
        oasesResults,
        videosFrequencyDetails,
      ];
}

class VideosFrequencyDetails extends Equatable {
  dynamic? videoUrl;
  int? sectionId;
  String? sectionName;
  String? sectionNameEn;
  int? sttCount;
  double? ssValue;
  int? taskScore;

  VideosFrequencyDetails(
      {this.videoUrl,
      this.sectionId,
      this.sectionName,
      this.sectionNameEn,
      this.sttCount,
      this.ssValue,
      this.taskScore});

  VideosFrequencyDetails.fromJson(Map<String, dynamic> json) {
    videoUrl = json["videoUrl"];
    sectionId = json["sectionId"];
    sectionName = json["sectionName"];
    sectionNameEn = json["sectionNameEn"];
    sttCount = json["sttCount"];
    ssValue = json["ssValue"];
    taskScore = json["taskScore"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["videoUrl"] = videoUrl;
    data["sectionId"] = sectionId;
    data["sectionName"] = sectionName;
    data["sectionNameEn"] = sectionNameEn;
    data["sttCount"] = sttCount;
    data["ssValue"] = ssValue;
    data["taskScore"] = taskScore;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        videoUrl,
        sectionId,
        sectionName,
        sectionNameEn,
        sttCount,
        ssValue,
        taskScore
      ];
}

class OasesResults extends Equatable {
  int? sectionId;
  String? sectionName;
  String? sectionNameEn;
  int? points;
  int? answeredQuestions;
  double? impactDegree;
  String? impactRating;

  OasesResults(
      {this.sectionId,
      this.sectionName,
      this.sectionNameEn,
      this.points,
      this.answeredQuestions,
      this.impactDegree,
      this.impactRating});

  OasesResults.fromJson(Map<String, dynamic> json) {
    sectionId = json["sectionId"];
    sectionName = json["sectionName"];
    sectionNameEn = json["sectionNameEn"];
    points = json["points"];
    answeredQuestions = json["answeredQuestions"];
    impactDegree = json["impactDegree"];
    impactRating = json["impactRating"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["sectionId"] = sectionId;
    data["sectionName"] = sectionName;
    data["sectionNameEn"] = sectionNameEn;
    data["points"] = points;
    data["answeredQuestions"] = answeredQuestions;
    data["impactDegree"] = impactDegree;
    data["impactRating"] = impactRating;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        sectionId,
        sectionName,
        sectionNameEn,
        points,
        answeredQuestions,
        impactDegree,
        impactRating
      ];
}

class Patient extends Equatable {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  String? email;
  String? phoneNumber;
  dynamic? countryPhoneCode;
  String? idCardNumber;
  String? country;
  String? city;
  String? neighborhood;
  dynamic? address;
  String? workPlace;
  String? nationality;
  String? gender;
  String? birthDate;
  String? userId;
  bool? isActive;
  String? randomNumber;
  String? type;
  int? currentStage;
  int? currentDiagnoses;
  bool? allowBooking;
  int? currentDiagnosesStatus;

  Patient(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.countryPhoneCode,
      this.idCardNumber,
      this.country,
      this.city,
      this.neighborhood,
      this.address,
      this.workPlace,
      this.nationality,
      this.gender,
      this.birthDate,
      this.userId,
      this.isActive,
      this.randomNumber,
      this.type,
      this.currentStage,
      this.currentDiagnoses,
      this.allowBooking,
      this.currentDiagnosesStatus});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    middleName = json["middleName"];
    lastName = json["lastName"];
    fullName = json["fullName"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    countryPhoneCode = json["countryPhoneCode"];
    idCardNumber = json["idCardNumber"];
    country = json["country"];
    city = json["city"];
    neighborhood = json["neighborhood"];
    address = json["address"];
    workPlace = json["workPlace"];
    nationality = json["nationality"];
    gender = json["gender"];
    birthDate = json["birthDate"];
    userId = json["userId"];
    isActive = json["isActive"];
    randomNumber = json["randomNumber"];
    type = json["type"];
    currentStage = json["currentStage"];
    currentDiagnoses = json["currentDiagnoses"];
    allowBooking = json["allowBooking"];
    currentDiagnosesStatus = json["currentDiagnosesStatus"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["firstName"] = firstName;
    data["middleName"] = middleName;
    data["lastName"] = lastName;
    data["fullName"] = fullName;
    data["email"] = email;
    data["phoneNumber"] = phoneNumber;
    data["countryPhoneCode"] = countryPhoneCode;
    data["idCardNumber"] = idCardNumber;
    data["country"] = country;
    data["city"] = city;
    data["neighborhood"] = neighborhood;
    data["address"] = address;
    data["workPlace"] = workPlace;
    data["nationality"] = nationality;
    data["gender"] = gender;
    data["birthDate"] = birthDate;
    data["userId"] = userId;
    data["isActive"] = isActive;
    data["randomNumber"] = randomNumber;
    data["type"] = type;
    data["currentStage"] = currentStage;
    data["currentDiagnoses"] = currentDiagnoses;
    data["allowBooking"] = allowBooking;
    data["currentDiagnosesStatus"] = currentDiagnosesStatus;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        firstName,
        middleName,
        lastName,
        fullName,
        email,
        phoneNumber,
        countryPhoneCode,
        idCardNumber,
        country,
        city,
        neighborhood,
        address,
        workPlace,
        nationality,
        gender,
        birthDate,
        userId,
        isActive,
        randomNumber,
        type,
        currentStage,
        currentDiagnoses,
        allowBooking,
        currentDiagnosesStatus,
      ];
}
