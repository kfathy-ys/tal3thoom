import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tal3thoom/models/section.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/second_session/second_stage_oases_test/view.dart';
import 'package:tal3thoom/serives/second_stage_inject/second_oases_service/answers_service.dart';
import 'package:tal3thoom/serives/second_stage_inject/second_oases_service/question_serives.dart';

import '../../../../../../../widgets/constants.dart';
import '../../../../../diagnostic_service/page/views/success_page.dart';
import '../second_stage_ssrs_test/view.dart';

mixin QSecondMixer on State<SecondStageOasesTest> {
  final sections = <AppSectionModel>[
    const AppSectionModel("1- قياس المعلومات العامة في حياتك"),
    const AppSectionModel("2- قياس رد فعلك بالنسبة لاضطراب التلعثم"),
    const AppSectionModel("3- قياس التواصل مع المواقف اليومية"),
    const AppSectionModel("4- قياس جودة الحياة"),
  ];

  final questionsBySection = <AppSectionModel, List<Question>>{};
  final allAnswers = <Question, Answers>{};
  late AppSectionModel selectedSection;
  Question? selectedQuestion;

  bool get isCurrentQFirstOneInTheSection =>
      questionsBySection[selectedSection]?.first == selectedQuestion;

  bool get isCurrentQLastOneInTheSection =>
      questionsBySection[selectedSection]?.last == selectedQuestion;

  bool get enablePreviousButton => !isCurrentQFirstOneInTheSection;

  Answers? get answerForSelectedQuestion => allAnswers[selectedQuestion];

  bool get answerdCurrentQuestion => answerForSelectedQuestion != null;

  bool get enableNextQButton =>
      !isCurrentQLastOneInTheSection && answerdCurrentQuestion;

  bool get enableNextSectionButton {
    return questionsBySection.keys.last != selectedSection &&
        questionsBySection[selectedSection]?.last == selectedQuestion &&
        questionsBySection[selectedSection]!.length ==
            allAnswers.entries
                .where((entry) =>
                    questionsBySection[selectedSection]!.contains(entry.key))
                .length;
  }

  List<Question> get currentSectionQuestions =>
      questionsBySection[selectedSection]!;

  int get currentQIndex => currentSectionQuestions.indexOf(selectedQuestion!);

  int get currentQNumber => currentQIndex + 1;

  bool get hasSelectedQuestion => selectedQuestion != null;

  int get selectedQuestionNumberInSection {
    if (selectedQuestion != null) {
      final index = currentSectionQuestions.indexOf(selectedQuestion!);
      if (index >= 0) return index + 1;
    }
    return -1;
  }

  bool get shouldEnableNextSectionButton =>
      selectedSection != sections.last && currentQisLastInCurrentSection;

  bool get shouldEnablePreviousSectionButton =>
      selectedSection != sections.first &&
      selectedSection == currentSectionQuestions.first;

  bool get currentQisLastInCurrentSection =>
      selectedSection == currentSectionQuestions.last;

  bool get currentQisFirstInCurrentSection =>
      selectedSection == currentSectionQuestions.first;

  bool isSectionCompleted(AppSectionModel section) {
    return questionsBySection[section]!.length ==
        allAnswers.entries
            .where((entry) => questionsBySection[section]!.contains(entry.key))
            .length;
  }

  bool get canSubmit =>
      questionsBySection.keys.map(isSectionCompleted).every((e) => e);

  String get paginatorTitle {
    return '${selectedSection.title}   ($currentQNumber من ${currentSectionQuestions.length} )';
  }

  // bool get canGoToNextSection {
  //   final sectionQList = currentSectionQuestions;
  //   final allAnswersForCurrentQ = allAnswers.keys
  //       .where(sectionQList.contains)
  //       .where((element) => allAnswers[element] != null);
  //   return sectionQList.length == allAnswersForCurrentQ.length;
  // }
  bool isLoadQFromApi = true;

  Future<void> loadSecondQFromApi() async {
    //TODO :: loading

    log('will load from api');

    try {
      setState(() => isSubmiting = false);

      final qList = await SecondOasesQuestionService.findManySecondOases();

      log('${qList.length} loaded from api');

      for (final q in qList) {
        final section = sections[(q.sectionId) - 1];
        questionsBySection[section]!.add(q);
      }
      selectedQuestion = questionsBySection[sections.first]!.first;
      setState(() {});
      log('${qList.length} loaded from api and filtered by sectionID');
    } on DioError catch (_) {
      customText2(title: "لا يوجد اتصال بالانترنت ", color: kBlackText);
    } catch (e) {
      // Alert.error('الرجاء قيد الإنتظار !!!');
      Get.snackbar(e.toString(), '');
    } finally {
      setState(() => isSubmiting = false);
    }
  }

  void selectNextQuestion() {
    if (currentQisLastInCurrentSection) {
      selectNextSection();
    } else {
      final indexOfCurrentQ =
          currentSectionQuestions.indexOf(selectedQuestion!);
      selectedQuestion = currentSectionQuestions[indexOfCurrentQ + 1];
      setState(() {});
    }
  }

  void selectPreviousQuestion() {
    if (currentQisFirstInCurrentSection) {
      throw 'illeagel';
    } else {
      final indexOfCurrentQ =
          currentSectionQuestions.indexOf(selectedQuestion!);
      selectedQuestion = currentSectionQuestions[indexOfCurrentQ - 1];
      setState(() {});
    }
  }

  void selectNextSection() {
    final indexOfCurrentSection = sections.indexOf(selectedSection);
    selectedSection = sections[indexOfCurrentSection + 1];
    selectedQuestion = currentSectionQuestions.first;
    setState(() {});
  }

  void answerSelectedQ(Answers answer) {
    allAnswers[selectedQuestion!] = answer;
    // if (shouldEnableNextSectionButton) {
    //   selectNextQuestion();
    // } else {
    //  submit();
    //  }
  }

  bool isSubmiting = false;
  Future<void> submit() async {
    try {
      setState(() => isSubmiting = true);
      await SecondOasesAnswers.postSecondOasesAnswers(
        answers: allAnswers,
      );
      Get.off(() => SuccessView(
            title1: "لقد تم إنتهاء إختبار OASES بنجاح",
            title2: "إنتقال إلي إختبار SSRS",
            onTap: () => Get.off(() => const SecondStageSSRSTreatmentScreen()),
          ));
    } on DioError catch (_) {
      customText2(title: "لا يوجد اتصال بالانترنت ", color: kBlackText);
    } catch (e) {
      Get.snackbar(e.toString(), '');
    } finally {
      setState(() => isSubmiting = true);
    }
  }
}
