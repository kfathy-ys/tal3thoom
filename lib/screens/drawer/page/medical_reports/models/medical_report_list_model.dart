class MedicalReportListModel {
  List<AllReportsList>? data;
  int? status;
  int? dataLength;

  MedicalReportListModel({this.data, this.status, this.dataLength});

  MedicalReportListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AllReportsList>[];
      json['data'].forEach((v) {
        data!.add(AllReportsList.fromJson(v));
      });
    }
    status = json['status'];
    dataLength = json['dataLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['dataLength'] = dataLength;
    return data;
  }
}

class AllReportsList {
  int? id;
  String? reportName;
  int? patientId;
  int? specialistId;
  String? specialistName;
  int? supervisorId;
  String? supervisorName;

  String? generatedBy;
  String? generatedAt;

  String? approvedBy;
  String? approvedAt;
  bool? isPending;
  bool? isRegenerated;
  bool? isApproved;

  Patient? patient;

  AllReportsList({
    this.id,
    this.reportName,
    this.patientId,
    this.specialistId,
    this.specialistName,
    this.supervisorId,
    this.supervisorName,
    this.generatedBy,
    this.generatedAt,
    this.approvedBy,
    this.approvedAt,
    this.isPending,
    this.isRegenerated,
    this.isApproved,
    this.patient,
  });

  AllReportsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportName = json['reportName'];
    patientId = json['patientId'];
    specialistId = json['specialistId'];
    specialistName = json['specialistName'];
    supervisorId = json['supervisorId'];
    supervisorName = json['supervisorName'];

    generatedBy = json['generatedBy'];
    generatedAt = json['generatedAt'];

    approvedBy = json['approvedBy'];
    approvedAt = json['approvedAt'];
    isPending = json['isPending'];
    isRegenerated = json['isRegenerated'];
    isApproved = json['isApproved'];

    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reportName'] = reportName;
    data['patientId'] = patientId;
    data['specialistId'] = specialistId;
    data['specialistName'] = specialistName;
    data['supervisorId'] = supervisorId;
    data['supervisorName'] = supervisorName;

    data['generatedBy'] = generatedBy;
    data['generatedAt'] = generatedAt;

    data['approvedBy'] = approvedBy;
    data['approvedAt'] = approvedAt;
    data['isPending'] = isPending;
    data['isRegenerated'] = isRegenerated;
    data['isApproved'] = isApproved;

    if (patient != null) {
      data['patient'] = patient!.toJson();
    }

    return data;
  }
}

class Patient {
  int? id;
  String? firstName;
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
}
