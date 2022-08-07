import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../config/dio_helper/dio.dart';
import '../models/model.dart';

part 'top_three_state.dart';

class TopThreeCubit extends Cubit<TopThreeState> {
  TopThreeCubit() : super(TopThreeInitial()){
    getTopThree();
  }
  Future<void> getTopThree() async {
    emit(TopThreeLoading());
    try {
      final res =
      await NetWork.get('User/GetTopThreeRequestedRequests');

      if (res.data['status'] == 0 ||
          res.data['status'] == -1 ||
          res.statusCode != 200) {
        throw res.data['message'];
      }

      emit(TopThreeSuccess(topThreeModels:
      TopThreeModels.fromJson(res.data)));
    } catch (e, es) {
      log(e.toString());
      log(es.toString());
      emit(TopThreeError(msg: e.toString()));
    }
  }
}
