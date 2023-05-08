import 'package:equatable/equatable.dart';

class MedicalReportsModel extends Equatable {
  AllReports? data;
  int? status;
  int? dataLength;

  MedicalReportsModel({this.data, this.status, this.dataLength});

  MedicalReportsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AllReports.fromJson(json['data']) : null;
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

  @override
  List<Object?> get props => [data, status, dataLength];
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
  dynamic regeneratedBy;
  dynamic regeneratedAt;
  String? approvedBy;
  String? approvedAt;
  bool? isPending;
  bool? isRegenerated;
  bool? isApproved;
  String? heOrShe;
  String? hisOrHer;
  String? patientAge;
  num? frequencyScore;
  num? durationScore;
  num? physicalScore;
  String? stutteringDuration;
  num? totalScore;
  String? severityEquivalent;
  String? percentileRank;
  dynamic ssrsValue;
  Patient? patient;
  OasesResults? oasesResults;
  VideosFrequencyDetails? videosFrequencyDetails;

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
    id = json['id'];
    reportName = json['reportName'];
    patientId = json['patientId'];
    specialistId = json['specialistId'];
    specialistName = json['specialistName'];
    specialistScientificDegree = json['specialistScientificDegree'];
    supervisorId = json['supervisorId'];
    supervisorName = json['supervisorName'];
    enrolmentDate = json['enrolmentDate'];
    dischargeDate = json['dischargeDate'];
    stutteringWasBecoming = json['stutteringWasBecoming'];
    bornWith = json['bornWith'];
    stutteringNoticedAge = json['stutteringNoticedAge'];
    stutteringNoticedByWhome = json['stutteringNoticedByWhome'];
    theStuttering = json['theStuttering'];
    hasBecome = json['hasBecome'];
    exhibits = json['exhibits'];
    generatedBy = json['generatedBy'];
    generatedAt = json['generatedAt'];
    regeneratedBy = json['regeneratedBy'];
    regeneratedAt = json['regeneratedAt'];
    approvedBy = json['approvedBy'];
    approvedAt = json['approvedAt'];
    isPending = json['isPending'];
    isRegenerated = json['isRegenerated'];
    isApproved = json['isApproved'];
    heOrShe = json['he_or_she'];
    hisOrHer = json['his_or_her'];
    patientAge = json['patientAge'];
    frequencyScore = json['frequencyScore'];
    durationScore = json['durationScore'];
    physicalScore = json['physicalScore'];
    stutteringDuration = json['stutteringDuration'];
    totalScore = json['totalScore'];
    severityEquivalent = json['severityEquivalent'];
    percentileRank = json['percentileRank'];
    ssrsValue = json['ssrsValue'];
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    oasesResults = json['oasesResults'] != null
        ? OasesResults.fromJson(json['oasesResults'])
        : null;
    videosFrequencyDetails = json['videosFrequencyDetails'] != null
        ? VideosFrequencyDetails.fromJson(json['videosFrequencyDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reportName'] = reportName;
    data['patientId'] = patientId;
    data['specialistId'] = specialistId;
    data['specialistName'] = specialistName;
    data['specialistScientificDegree'] = specialistScientificDegree;
    data['supervisorId'] = supervisorId;
    data['supervisorName'] = supervisorName;
    data['enrolmentDate'] = enrolmentDate;
    data['dischargeDate'] = dischargeDate;
    data['stutteringWasBecoming'] = stutteringWasBecoming;
    data['bornWith'] = bornWith;
    data['stutteringNoticedAge'] = stutteringNoticedAge;
    data['stutteringNoticedByWhome'] = stutteringNoticedByWhome;
    data['theStuttering'] = theStuttering;
    data['hasBecome'] = hasBecome;
    data['exhibits'] = exhibits;
    data['generatedBy'] = generatedBy;
    data['generatedAt'] = generatedAt;
    data['regeneratedBy'] = regeneratedBy;
    data['regeneratedAt'] = regeneratedAt;
    data['approvedBy'] = approvedBy;
    data['approvedAt'] = approvedAt;
    data['isPending'] = isPending;
    data['isRegenerated'] = isRegenerated;
    data['isApproved'] = isApproved;
    data['he_or_she'] = heOrShe;
    data['his_or_her'] = hisOrHer;
    data['patientAge'] = patientAge;
    data['frequencyScore'] = frequencyScore;
    data['durationScore'] = durationScore;
    data['physicalScore'] = physicalScore;
    data['stutteringDuration'] = stutteringDuration;
    data['totalScore'] = totalScore;
    data['severityEquivalent'] = severityEquivalent;
    data['percentileRank'] = percentileRank;
    data['ssrsValue'] = ssrsValue;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (oasesResults != null) {
      data['oasesResults'] = oasesResults!.toJson();
    }
    if (videosFrequencyDetails != null) {
      data['videosFrequencyDetails'] = videosFrequencyDetails!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        reportName,
        patientId,
        specialistId,
        specialistName,
        specialistScientificDegree,
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
        videosFrequencyDetails
      ];
}

class Patient extends Equatable {
  int? id;
  String? firstName;
  String? firstNameEn;
  String? middleName;
  String? lastName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? countryPhoneCode;
  String? idCardNumber;
  String? country;
  String? city;
  String? neighborhood;
  dynamic address;
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
  String? nextSession;
  bool? allowBooking;
  bool? needSsi4Evaluation;
  int? currentDiagnosesStatus;
  String? diagnosesStatusUpdatedAt;

  Patient(
      {this.id,
      this.firstName,
        this.firstNameEn,
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
      this.nextSession,
      this.allowBooking,
      this.needSsi4Evaluation,
      this.currentDiagnosesStatus,
      this.diagnosesStatusUpdatedAt});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    firstNameEn = json['firstNameEn'];

    middleName = json['middleName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    countryPhoneCode = json['countryPhoneCode'];
    idCardNumber = json['idCardNumber'];
    country = json['country'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    address = json['address'];
    workPlace = json['workPlace'];
    nationality = json['nationality'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    userId = json['userId'];
    isActive = json['isActive'];
    randomNumber = json['randomNumber'];
    type = json['type'];
    currentStage = json['currentStage'];
    currentDiagnoses = json['currentDiagnoses'];
    nextSession = json['nextSession'];
    allowBooking = json['allowBooking'];
    needSsi4Evaluation = json['needSsi4Evaluation'];
    currentDiagnosesStatus = json['currentDiagnosesStatus'];
    diagnosesStatusUpdatedAt = json['diagnosesStatusUpdatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['firstNameEn'] = firstNameEn;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['countryPhoneCode'] = countryPhoneCode;
    data['idCardNumber'] = idCardNumber;
    data['country'] = country;
    data['city'] = city;
    data['neighborhood'] = neighborhood;
    data['address'] = address;
    data['workPlace'] = workPlace;
    data['nationality'] = nationality;
    data['gender'] = gender;
    data['birthDate'] = birthDate;
    data['userId'] = userId;
    data['isActive'] = isActive;
    data['randomNumber'] = randomNumber;
    data['type'] = type;
    data['currentStage'] = currentStage;
    data['currentDiagnoses'] = currentDiagnoses;
    data['nextSession'] = nextSession;
    data['allowBooking'] = allowBooking;
    data['needSsi4Evaluation'] = needSsi4Evaluation;
    data['currentDiagnosesStatus'] = currentDiagnosesStatus;
    data['diagnosesStatusUpdatedAt'] = diagnosesStatusUpdatedAt;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        firstNameEn,
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
        nextSession,
        allowBooking,
        needSsi4Evaluation,
        currentDiagnosesStatus,
        diagnosesStatusUpdatedAt
      ];
}

class OasesResults extends Equatable {
  Section1? section1;
  Section1? section2;
  Section3? section3;
  Section1? section4;
  Section5? section5;

  OasesResults(
      {this.section1,
      this.section2,
      this.section3,
      this.section4,
      this.section5});

  OasesResults.fromJson(Map<String, dynamic> json) {
    section1 =
        json['section1'] != null ? Section1.fromJson(json['section1']) : null;
    section2 =
        json['section2'] != null ? Section1.fromJson(json['section2']) : null;
    section3 =
        json['section3'] != null ? Section3.fromJson(json['section3']) : null;
    section4 =
        json['section4'] != null ? Section1.fromJson(json['section4']) : null;
    section5 =
        json['section5'] != null ? Section5.fromJson(json['section5']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (section1 != null) {
      data['section1'] = section1!.toJson();
    }
    if (section2 != null) {
      data['section2'] = section2!.toJson();
    }
    if (section3 != null) {
      data['section3'] = section3!.toJson();
    }
    if (section4 != null) {
      data['section4'] = section4!.toJson();
    }
    if (section5 != null) {
      data['section5'] = section5!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [section1, section2, section3, section4, section5];
}

class Section1 extends Equatable {
  int? sectionId;
  String? sectionName;
  String? sectionNameEn;
  dynamic? points;
  int? answeredQuestions;
  double? impactDegree;
  String? impactRating;

  Section1(
      {this.sectionId,
      this.sectionName,
      this.sectionNameEn,
      this.points,
      this.answeredQuestions,
      this.impactDegree,
      this.impactRating});

  Section1.fromJson(Map<String, dynamic> json) {
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    sectionNameEn = json['sectionNameEn'];
    points = json['points'];
    answeredQuestions = json['answeredQuestions'];
    impactDegree = json['impactDegree'];
    impactRating = json['impactRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sectionId'] = sectionId;
    data['sectionName'] = sectionName;
    data['sectionNameEn'] = sectionNameEn;
    data['points'] = points;
    data['answeredQuestions'] = answeredQuestions;
    data['impactDegree'] = impactDegree;
    data['impactRating'] = impactRating;
    return data;
  }

  @override
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

class Section3 extends Equatable {
  int? sectionId;
  String? sectionName;
  String? sectionNameEn;
  dynamic? points;
  int? answeredQuestions;
  num? impactDegree;
  String? impactRating;

  Section3(
      {this.sectionId,
      this.sectionName,
      this.sectionNameEn,
      this.points,
      this.answeredQuestions,
      this.impactDegree,
      this.impactRating});

  Section3.fromJson(Map<String, dynamic> json) {
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    sectionNameEn = json['sectionNameEn'];
    points = json['points'];
    answeredQuestions = json['answeredQuestions'];
    impactDegree = json['impactDegree'];
    impactRating = json['impactRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sectionId'] = sectionId;
    data['sectionName'] = sectionName;
    data['sectionNameEn'] = sectionNameEn;
    data['points'] = points;
    data['answeredQuestions'] = answeredQuestions;
    data['impactDegree'] = impactDegree;
    data['impactRating'] = impactRating;
    return data;
  }

  @override
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

class Section5 extends Equatable {
  dynamic sectionId;
  String? sectionName;
  String? sectionNameEn;
  dynamic? points;
  int? answeredQuestions;
  double? impactDegree;
  String? impactRating;

  Section5(
      {this.sectionId,
      this.sectionName,
      this.sectionNameEn,
      this.points,
      this.answeredQuestions,
      this.impactDegree,
      this.impactRating});

  Section5.fromJson(Map<String, dynamic> json) {
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    sectionNameEn = json['sectionNameEn'];
    points = json['points'];
    answeredQuestions = json['answeredQuestions'];
    impactDegree = json['impactDegree'];
    impactRating = json['impactRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sectionId'] = sectionId;
    data['sectionName'] = sectionName;
    data['sectionNameEn'] = sectionNameEn;
    data['points'] = points;
    data['answeredQuestions'] = answeredQuestions;
    data['impactDegree'] = impactDegree;
    data['impactRating'] = impactRating;
    return data;
  }

  @override
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

class VideosFrequencyDetails extends Equatable {
  SpeakingSample? speakingSample;
  SpeakingSample? readingSample;

  VideosFrequencyDetails({this.speakingSample, this.readingSample});

  VideosFrequencyDetails.fromJson(Map<String, dynamic> json) {
    speakingSample = json['speakingSample'] != null
        ? SpeakingSample.fromJson(json['speakingSample'])
        : null;
    readingSample = json['readingSample'] != null
        ? SpeakingSample.fromJson(json['readingSample'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (speakingSample != null) {
      data['speakingSample'] = speakingSample!.toJson();
    }
    if (readingSample != null) {
      data['readingSample'] = readingSample!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [speakingSample, readingSample];
}

class SpeakingSample extends Equatable {
  dynamic videoUrl;
  int? sectionId;
  String? sectionName;
  String? sectionNameEn;
  dynamic? sttCount;
  double? ssValue;
  int? taskScore;

  SpeakingSample(
      {this.videoUrl,
      this.sectionId,
      this.sectionName,
      this.sectionNameEn,
      this.sttCount,
      this.ssValue,
      this.taskScore});

  SpeakingSample.fromJson(Map<String, dynamic> json) {
    videoUrl = json['videoUrl'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    sectionNameEn = json['sectionNameEn'];
    sttCount = json['sttCount'];
    ssValue = json['ssValue'];
    taskScore = json['taskScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoUrl'] = videoUrl;
    data['sectionId'] = sectionId;
    data['sectionName'] = sectionName;
    data['sectionNameEn'] = sectionNameEn;
    data['sttCount'] = sttCount;
    data['ssValue'] = ssValue;
    data['taskScore'] = taskScore;
    return data;
  }

  @override
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
