// ignore_for_file: constant_identifier_names

enum TypeEntityName { researchRetreat, scientificMaterial, mix }

extension TypeNameHelpers on TypeEntityName {
  bool get shouldEnterCallNumber =>
      this == TypeEntityName.scientificMaterial || this == TypeEntityName.mix;

  bool get shouldPickFromAviliableRange =>
      this == TypeEntityName.researchRetreat || this == TypeEntityName.mix;

  bool get shouldPickHall =>
      this == TypeEntityName.researchRetreat || this == TypeEntityName.mix;

  int toInt() {
    switch (this) {
      case TypeEntityName.researchRetreat:
        return 11;
      case TypeEntityName.scientificMaterial:
        return 12;
      case TypeEntityName.mix:
        return 13;
    }
  }
}

enum StagesEnums {
  DIAGONSES(1, 'DIAGONSES'),
  TREAT_FIRST_STAGE(2, 'TREAT_FIRST_STAGE'),
  TREATMENT_SECOND_STAGE(4, 'TREATMENT_SECOND_STAGE');

  const StagesEnums(this.code, this.description);

  final int code;
  final String description;

  @override
  String toString() => 'StagesEnums($code, $description)';
}

enum StagesDiagnosesEnum {
  MEDICAL_HISTORY(1, "MEDICAL_HISTORY"),
  OASES(2, "OASES"),
  SSRS(3, "SSRS"),
  SSI4(4, "SSI4"),
  Booking(10, "Booking"),
  Done(11, "Done"),
  Pre_Treatment(12, "Pre_Treatment"),
  Treatment_Session_1(13, "Treatment_Session_1"),
  Treatment_Session_2(14, "Treatment_Session_2"),
  Treatment_Session_3(15, "Treatment_Session_3"),
  Treatment_Session_4(16, "Treatment_Session_4"),
  Treatment_Session_5(17, "Treatment_Session_5"),
  Treatment_Session_6(18, "Treatment_Session_6"),
  Treatment_Session_7(19, "Treatment_Session_7"),
  Treatment_Session_8(20, "Treatment_Session_8"),
  Treatment_Session_9(21, "Treatment_Session_9"),
  Treatment_Session_10(22, "Treatment_Session_10"),
  Treatment_Session_11(23, "Treatment_Session_11"),
  Treatment_Session_12(24, "Treatment_Session_12"),
  Treatment_Session_13(25, "Treatment_Session_13"),
  Treatment_Session_14(26, "Treatment_Session_14"),
  Treatment_Session_15(27, "Treatment_Session_15"),
  Treatment_Session_16(28, "Treatment_Session_16"),
  Treatment_Session_17(29, "Treatment_Session_17"),
  Treatment_Session_18(30, "Treatment_Session_18"),
  Treatment_Session_19(31, "Treatment_Session_19"),
  Treatment_Session_20(32, "Treatment_Session_20"),
  Treatment_Session_21(33, "Treatment_Session_21"),
  Treatment_Session_22(34, "Treatment_Session_22"),
  Treatment_Session_23(35, "Treatment_Session_23"),
  Treatment_Session_24(36, "Treatment_Session_24"),
  Treatment_Session_25(37, "Treatment_Session_25"),
  Treatment_Session_26(38, "Treatment_Session_26"),
  Treatment_Session_27(39, "Treatment_Session_27"),
  Treatment_Session_28(40, "Treatment_Session_28"),
  Treatment_Session_29(41, "Treatment_Session_29"),
  Treatment_Session_30(42, "Treatment_Session_30");

  const StagesDiagnosesEnum(this.code, this.description);

  final int code;
  final String description;

  @override
  String toString() => 'StagesDiagnosesEnum($code, $description)';
}

enum DiagnosesStatusEnum {
  Pending(1, "Pending"),
  Retake(2, "Retake"),
  Passed(3, "Passed");

  const DiagnosesStatusEnum(this.code, this.description);

  final int code;
  final String description;

  @override
  String toString() => 'DiagnosesStatusEnum($code, $description)';
}
