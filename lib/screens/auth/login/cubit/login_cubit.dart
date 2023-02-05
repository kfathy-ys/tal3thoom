import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';
import 'package:queen/core/helpers/prefs.dart';

import '../../../../config/dio_helper/dio.dart';
import '../../../widgets/alerts.dart';
import '../model/models.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // LoginModel? model;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {

      final res = await NetWork.post(
        'Auth/login',
        body: {
          "userName": email,
          "password": password,
        },
      );
      print(res.statusCode.toString() + "khallllllllled");
      print(res.data.toString() + "khallllllllled");
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        print(res.data['messages'][0]['title']);
        throw res.data['messages'][0]['title'].toString();
      }
      LoginModel loginModel = LoginModel.fromJson((res.data));
      Prefs.setString("token", res.data["data"]["token"]);
      Prefs.setString("userId", res.data["data"]["userId"]);

      Prefs.setString("fullName", loginModel.data!.userName!);
      Prefs.setString("email", loginModel.data!.email!);
      Prefs.setString("phoneNumber", loginModel.data!.phoneNumber!);

      Prefs.setString("firstName", loginModel.data!.userName!);
      Prefs.setString("lastName", loginModel.data!.email!);

      log("${res.data["data"]["token"]}");
      log("${res.data["data"]["userId"]}");

      log("${res.data["data"]["userName"]}");
      log("${res.data["data"]["email"]}");
      log("${res.data["data"]["phoneNumber"]}");
      print("foooooooooooooor");
      emit(LoginSuccess(LoginModel.fromJson((res.data))));
    } on DioError catch (_) {
      emit(LoginError(msg: "لا يوجد اتصال بالانترنت "));
    } catch (e, st) {
      Alert.error(e.toString());
      log(e.toString());
      log(st.toString());
      emit(LoginError(msg: e.toString()));
    }
  }
}
