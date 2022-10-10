import 'package:flutter/cupertino.dart';
import 'package:tal3thoom/models/section.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostci_oases_test/view.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../../../../serives/diagnostic_oases_service/answers_service.dart';
import '../../../../../../../serives/diagnostic_oases_service/question_serives.dart';
import '../../../../../../widgets/alerts.dart';
import '../../../../../../widgets/fast_widget.dart';
import '../diagnostic_ssrs_test/view.dart';
import '../success_page.dart';

mixin QMixer on State<DiagnosticOasesTest> {
  final sections = <AppSectionModel>[
    const AppSectionModel("1- قباس المعلومات العامة في حياتك"),
    const AppSectionModel("2- قباس رد فعلك بالنسبة لاضطراب التلعثم"),
    const AppSectionModel("3- قباس التواصل مع المواقف اليومية"),
    const AppSectionModel("4- قباس جودة الحياة"),
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

  Future<void> loadQFromApi() async {
    //TODO :: loading

    log('will load from api');

    try {
      setState(() => isSubmiting = false);

      final qList = await OasesQuestionService.findManyDiagnosticOases();

      log('${qList.length} loaded from api');

      for (final q in qList) {
        final section = sections[(q.sectionId as int) - 1];
        questionsBySection[section]!.add(q);
      }
      selectedQuestion = questionsBySection[sections.first]!.first;
      setState(() {});
      log('${qList.length} loaded from api and filtered by sectionID');
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
    if (shouldEnableNextSectionButton) {
      selectNextQuestion();
    } else {
      submit();
    }
  }

  bool isSubmiting = false;

  // final answersTxt = <Question, String>{};

  Future<void> submit() async {
    try {
      setState(() => isSubmiting = true);
      await DiagnosticOasesAnswers.postDiagnosticOasesAnswers(
        answers: allAnswers,
        answersTxt: {},
      );
      Get.off(() => SuccessView(
            title1: "لقد تم إنتهاء إختبار OASES بنجاح",
            title2: "إنتقال إلي إختبار SSRS",
            onTap: () => Get.off(() => const SSRSDiagnosticsScreen()),
          ));
    } catch (e) {
      Get.snackbar(e.toString(), '');
    } finally {
      setState(() => isSubmiting = true);
    }
  }
}
