import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../question.dart';

part 'oases_test_state.dart';

class OasesTestCubit extends Cubit<OasesTestState> {
  OasesTestCubit() : super(OasesTestInitial());

  var scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  int  totalCounter = 1;
  bool isFinishedAnswered = false;
  int selectedGroupIndex = 0;
  bool isFirstGroupFinished = false;
  List<CheckBoxItem> selectedQuestions = sixQuestionsList;

  void nextQuestions(){

  }
}
