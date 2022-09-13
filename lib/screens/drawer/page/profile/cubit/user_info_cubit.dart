// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:maktabat_alharam/screens/drawer/page/profile/cubit/input_data.dart';
// import 'package:queen/core/helpers/prefs.dart';
//
// import '../../../../../config/dio_helper/dio.dart';
//
// part 'user_info_state.dart';
//
// class UserInfoCubit extends Cubit<UserInfoState> {
//   // ignore: empty_constructor_bodies
//   UserInfoCubit() : super(UserInfoInitial()) {}
//   final fullName = Prefs.getString('fullName');
//   final email = Prefs.getString('email');
//   final phoneNumber = Prefs.getString('phoneNumber');
//
//   final formKey = GlobalKey<FormState>();
//
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//
//   final firstNameController = TextEditingController();
//
//   final lastNameController = TextEditingController();
//   final dateController = TextEditingController();
//   final arabicFullNameController = TextEditingController();
//
//   dynamic image = "assets/image/kabah.png";
//
//   // Future<void> getUserInfo() async {
//   //   emit(UserInfoLoading());
//   //   try {
//   //     final userId = Prefs.getString("userId");
//   //     final res = await NetWork.get('User/$userId');
//   //
//   //     if (res.data['status'] == 0 ||
//   //         res.data['status'] == -1 ||
//   //         res.statusCode != 200) {
//   //       throw res.data['message'];
//   //     }
//   //
//   //     emit(UserInfoSuccess());
//   //
//   //   } catch (e, es) {
//   //     log(e.toString());
//   //     log(es.toString());
//   //     emit(UserInfoError(msg: e.toString()));
//   //   }
//   // }
//   Future<void> updatedUserInfo({UpdateProfileInputData? userDate}) async {
//     emit(UserInfoLoading());
//     try {
//       final res = await NetWork.post('User/UpdateUserProfile', body: {
//         "jsonString": json.encode(userDate!.toJson()),
//         "pictureUrl": userDate.profilePic is String
//             ? userDate.profilePic
//             : MultipartFile.fromFileSync(userDate.profilePic.path,
//                 filename: userDate.profilePic.path),
//       });
//       log(res.data.toString());
//       if (res.statusCode == 200) {
//         Prefs.setString("firstName", userDate.firstName!);
//         Prefs.setString("fullName", userDate.userName!);
//         Prefs.setString("email", userDate.email!);
//         Prefs.setString("phoneNumber", userDate.phoneNumber!);
//         Prefs.setString("lastName", userDate.lastName!);
//         emit(UserInfoSuccess());
//       }
//     } catch (e, st) {
//       log(e.toString());
//       log(st.toString());
//       emit(UserInfoError(msg: e.toString()));
//     }
//   }
// }
