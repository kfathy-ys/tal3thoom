import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tal3thoom/screens/auth/register/model/models.dart';
import 'package:meta/meta.dart';

import '../../../../config/dio_helper/dio.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  RegisterModel? register;

  Future<void> userRegister({
    required String fName,
    required String lName,
    required String fullName,
    required String phone,
    required String country,
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(RegisterLoading());
    try {
      final res = await NetWork.post(
        'Accounts/Register',
        body: {
          "email": email,
          "password": password,
          "firstName": fName,
          "lastName": lName,
          "nameArabic": fullName,
          "phoneNumber": phone,
          "location": country,
          "userName": userName,
          "defaultRole": "Visitor",
          "active": true,
          "activationPageUrl": null,
          "roleName": ["Visitor"],
          "userId":null
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        throw res.data['message'];
      }
      emit(RegisterSuccess(RegisterModel.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(RegisterError(msg: e.toString()));
    }
  }
}
