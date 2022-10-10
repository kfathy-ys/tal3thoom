import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/auth/register/model/models.dart';
import 'package:meta/meta.dart';
import 'package:tal3thoom/screens/widgets/alerts.dart';

import '../../../../config/dio_helper/dio.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  //RegisterModel? register;

  String? typeSexId;
  String onSexTypeChanged(String value) => typeSexId = value;
  String? typeReadId;
  String onReadTypeChanged(String value) => typeReadId = value;

  //var userId = Prefs.getString("userId");

  Future<void> userRegister({
    required String firstName,
    required String middleName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
    required String countryPhoneCode,
    required String birthDate,
    required String nationality,
    required String country,
    required String city,
    required String workPlace,
  }) async {
    emit(RegisterLoading());
    try {
      final res = await NetWork.post(
        'Patients/AddPatient',
        body: {
          "id": 0,
          "firstName": firstName,
          "middleName": middleName,
          "lastName": lastName,
          "fullName": "",
          "email": email,
          "password": password,
          "phoneNumber": phoneNumber,
          "countryPhoneCode": countryPhoneCode,
          "gender": typeSexId,
          "birthDate": birthDate,
          "nationality": nationality,
          "idCardNumber": "",
          "country": country,
          "city": city,
          "neighborhood": "",
          "workPlace": workPlace,
          "type": typeReadId
        },
      );
      if (res.data['status'] == 0 || res.data['status'] == -1) {
        //throw res.data['message'];
        Alert.error("يجب إكمال الحقول المطلوبة");
      }

      emit(RegisterSuccess(RegisterModel.fromJson(res.data)));
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      emit(RegisterError(msg: e.toString()));
    }
  }
}
