// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'package:get/get.dart';
//
// import 'package:queen/core/helpers/prefs.dart';
// import 'package:queen/validation.dart';
// ';
// import '../../../widgets/loading.dart';
// import 'cubit/input_data.dart';
//
// // ignore: must_be_immutable
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final passController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final countryController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final dateController = TextEditingController();
//   final arabicFullNameController = TextEditingController();
//
//   void getUserData() {
//     _profileInputData.firstName = Prefs.getString('firstName');
//     _profileInputData.lastName = Prefs.getString('lastName');
//     _profileInputData.email = Prefs.getString('email');
//     _profileInputData.nameArabic = Prefs.getString('fullName');
//     _profileInputData.phoneNumber = Prefs.getString('phoneNumber');
//
//     /// TODO :: Cache Image
//     _profileInputData.profilePic = image;
//
//     firstNameController.text = Prefs.getString('firstName');
//     lastNameController.text = Prefs.getString('lastName');
//     emailController.text = Prefs.getString('email');
//     arabicFullNameController.text = Prefs.getString('fullName');
//     phoneController.text = Prefs.getString('phoneNumber');
//     setState(() {});
//   }
//
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     getUserData();
//     super.initState();
//   }
//
//   // dynamic image = "assets/image/kabah.png";
//   final _profileInputData = UpdateProfileInputData();
//
//   dynamic image =
//       "https://media.istockphoto.com/photos/kaaba-in-mecca-picture-id482206266?k=20&m=482206266&s=612x612&w=0&h=JvXTR5ih-ieBNh2MXfyBFU8_BAvgUH_m-NUx1m8RpPc=";
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//
//     return BlocProvider(
//       create: (context) => UserInfoCubit(),
//       child: BlocConsumer<UserInfoCubit, UserInfoState>(
//         listener: (context, state) {
//           if (state is UserInfoSuccess) {
//             Alert.success("تم التعديل");
//
//             Get.offAll(() => const HomeTabScreen());
//           } else if (state is UserInfoError) {
//             Alert.error(state.msg.toString());
//           }
//         },
//         builder: (context, state) {
//           final cubit = BlocProvider.of<UserInfoCubit>(context);
//
//           return Form(
//             key: formKey,
//             child: SizedBox(
//               height: context.height,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     HeaderTitle(icon: Icons.person, title: "myProfile" ),
//                     _profilePic(userName: "fakeName" ),
//                     CustomTextField(
//                       dIcon: Icons.person,
//                       label: "firstName" ,
//                       hint: "firstName" ,
//                       controller: firstNameController,
//                       validator: qValidator([
//                         IsRequired("enterFullName" ),
//                         IsOptional(),
//                         MaxLength(30),
//                       ]),
//                       type: TextInputType.name,
//                       onsave: (String? value) {
//                         _profileInputData.firstName = value;
//                       },
//                     ),
//                     CustomTextField(
//                       dIcon: Icons.person,
//                       label: "lastName" ,
//                       hint: "lastName" ,
//                       controller: lastNameController,
//                       validator: qValidator([
//                         IsRequired("thisFieldRequired" ),
//                         IsOptional(),
//                         MaxLength(30),
//                       ]),
//                       type: TextInputType.name,
//                       onsave: (String? value) {
//                         _profileInputData.lastName = value;
//                       },
//                     ),
//                     CustomTextField(
//                       dIcon: Icons.drive_file_rename_outline,
//                       label: "arabicFullName" ,
//                       hint: "arabicFullName" ,
//                       controller: arabicFullNameController,
//                       validator: qValidator([
//                         IsRequired("enterFullName" ),
//                         IsOptional(),
//                         MaxLength(30),
//                       ]),
//                       type: TextInputType.name,
//                       onsave: (String? value) {
//                         _profileInputData.nameArabic = value;
//                       },
//                     ),
//                     CustomTextField(
//                       hint: "userName" ,
//                       dIcon: Icons.person,
//                       label: "userName" ,
//                       controller: arabicFullNameController,
//                       validator: qValidator([
//                         IsRequired("thisFieldRequired" ),
//                         MaxLength(30),
//                       ]),
//                       type: TextInputType.text,
//                       onsave: (String? value) {
//                         _profileInputData.userName = value;
//                       },
//                     ),
//                     CustomTextField(
//                       dIcon: Icons.email,
//                       label: "email" ,
//                       hint: "email" ,
//                       controller: emailController,
//                       validator: qValidator([
//                         IsRequired("enterEmail" ),
//                         IsEmail("mustBeEmail" ),
//                         MaxLength(30),
//                       ]),
//                       type: TextInputType.emailAddress,
//                       onsave: (String? value) {
//                         _profileInputData.email = value;
//                       },
//                     ),
//                     CustomTextField(
//                       dIcon: Icons.real_estate_agent,
//                       label: "countryResidence" ,
//                       hint: "countryResidence" ,
//                       controller: countryController,
//                       validator: qValidator(
//                         [
//                           IsRequired("enterCountry" ),
//                           MaxLength(30),
//                         ],
//                       ),
//                       type: TextInputType.streetAddress,
//                     ),
//                     CustomTextField(
//                       hint: "password" ,
//                       icon: Icons.lock_outline,
//                       dIcon: Icons.lock_outline,
//                       label: "password" ,
//                       controller: passController,
//                       validator: qValidator([
//                         IsRequired("enterPassword" ),
//                         MinLength(6, "minPassword" ),
//                         MaxLength(30),
//                       ]),
//                       type: TextInputType.text,
//                     ),
//                     CustomTextField(
//                       hint: "phoneNumber" ,
//                       dIcon: Icons.phone,
//                       label: "phoneNumber" ,
//                       controller: phoneController,
//                       validator: qValidator([
//                         IsRequired("thisFieldRequired" ),
//                         MinLength(
//                           6,
//                         ),
//                         MaxLength(30),
//                       ]),
//                       type: TextInputType.phone,
//                       onsave: (String? value) {
//                         _profileInputData.phoneNumber = value;
//                       },
//                     ),
//                     SizedBox(
//                         height: context.height * 0.02,
//                         child: Image.asset("assets/image/smallarrow.png")),
//                     state is! UserInfoLoading
//                         ? Center(
//                             child: MediaButton(
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 cubit.updatedUserInfo(
//                                     userDate: _profileInputData);
//                               }
//                             },
//                             title: "save" ,
//                             color: kSafeAreasColor,
//                           ))
//                         : const LoadingFadingCircle(),
//                     Center(
//                       child: Text("dataRegister" ,
//                           style: const TextStyle(
//                               color: kSmallIconColor,
//                               fontSize: 18,
//                               fontFamily: 'DinLight')),
//                     ),
//                     DateCreated(typeDate: "hijri" , date: "15-5-1443"),
//                     DateCreated(typeDate: "century" , date: "15-5-2022"),
//                     SizedBox(
//                       height: context.height * 0.05,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _profilePic({required String userName}) {
//     return profilePicContainer(context, image, userName, "changeImage" , () {
//       openImagePicker(
//           context: context,
//           onCameraTapped: () {
//             _getPic(context, ImageSource.camera);
//           },
//           onGalleryTapped: () {
//             _getPic(context, ImageSource.gallery);
//           });
//     }, false);
//   }
//
//   final ImagePicker _picker = ImagePicker();
//
//   void _getPic(
//     BuildContext context,
//     ImageSource source,
//   ) async {
//     final pickedFile = await _picker.getImage(
//       source: source,
//       maxWidth: 400,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         image = File(pickedFile.path);
//         _profileInputData.profilePic = File(pickedFile.path);
//       });
//       Navigator.pop(context);
//       FocusScope.of(context).unfocus();
//     }
//   }
// }
