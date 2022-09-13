import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../diagnostic_service/page/views/question.dart';

part 'second_state_oases_test_state.dart';

class SecondStageOasesTestCubit extends Cubit<SecondStageOasesTestState> {
  SecondStageOasesTestCubit() : super(SecondStageOasesTestInitial());

  int index = 0;
  int totalCounter = 1;
  bool isFinishedAnswered = false;
  int selectedGroupIndex = 0;
  bool isFirstGroupFinished = false;
  List<CheckBoxItem> selectedQuestions = sixQuestionsList;

  void nextQuestionsOne() {
    index = 0;
    selectedGroupIndex++;
    isFinishedAnswered = false;
    emit(SecondStageOasesTestSuccess());
  }
}
