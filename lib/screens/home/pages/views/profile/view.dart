import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:country_picker/country_picker.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queen/validation.dart';
import 'package:tal3thoom/config/keys.dart';
import '../../../../auth/delete_account/view.dart';
import '../../../../auth/register/cubit/register_cubit.dart';
import '../../../../update_profie/view.dart';
import '../../../../widgets/constants.dart';
import '../../../../widgets/customTextFeild.dart';

import '../../../../widgets/custom_textFornField_range.dart';
import '../../../../widgets/date_convertors.dart';
import '../../../../widgets/loading.dart';
import '../../../../widgets/pick_image.dart';
import '../../../../widgets/profile_pick_image.dart';
import 'cubit/profile_cubit.dart';
import 'page/drop_down_gender.dart';
import 'page/drop_down_read.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formKey = GlobalKey<FormState>();

  bool value = false;
  dynamic image =
      "https://i.pinimg.com/originals/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    BlocProvider.of<ProfileCubit>(context).getProfile();
    return Card(
      color: kHomeColor,
      child: Container(
        height: context.height,
        color: kHomeColor,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit = BlocProvider.of<ProfileCubit>(context);
                if (state is ProfileLoading) {
                  return const Center(child: LoadingFadingCircle());
                }
                if (state is ProfileSuccess) {
                  return FadeInLeftBig(
                    child: Column(
                      children: [
                        CustomTileContainer(
                            widthh: width * 0.5,
                            title: "المعلومات الشخصية",
                            context: context),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              'https://www.vitaalbank.nl/wp-content/uploads/2021/09/man-1.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        //_profilePic(userName: Prefs.getString('fullName')),
                        CustomTextField(
                          read: true,
                          dIcon: Icons.person,
                          label: KeysConfig.userName,
                          hint: KeysConfig.userName,
                          controller: cubit.firstNameController
                            ..text = Prefs.getString('fullName'),
                          validator: qValidator([
                            IsRequired(KeysConfig.userName),
                          ]),
                          type: TextInputType.name,
                        ),

                        CustomTextFieldRange(
                          read: true,
                          dIcon: Icons.date_range_outlined,
                          hint: "تاريخ الميلاد",
                          controller: cubit.dateController
                            ..text = DateConverter.dateConverterOnlys(
                                Prefs.getString('birthDate')),
                          validator: qValidator([
                            IsRequired(KeysConfig.thisFieldRequired),
                            //  IsOptional(),
                            MaxLength(30),
                          ]),
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2030),
                              initialDate: DateTime(1950),
                            ).then((value) {
                              if (value == null) return;
                              cubit.dateController.text =
                                  value.toString().substring(0, 10);

                              //  provider.onRageChanges(value);
                            });
                          },
                        ),
                        CustomTextField(
                          read: true,
                          hint: KeysConfig.email,
                          dIcon: Icons.email,
                          label: KeysConfig.email,
                          controller: cubit.emailController
                            ..text = Prefs.getString('email'),
                          validator: qValidator([
                            IsRequired("thisFieldRequired"),
                            //  IsOptional(),
                            MaxLength(30),
                          ]),
                          type: TextInputType.text,
                        ),
                        CustomTextField(
                          read: true,
                          hint: KeysConfig.phoneNumber,
                          dIcon: Icons.phone,
                          label: KeysConfig.phoneNumber,
                          controller: cubit.phoneController
                            ..text = Prefs.getString('phoneNumber'),
                          validator: qValidator([
                            IsRequired("thisFieldRequired"),
                            MinLength(6),
                            MaxLength(30),
                          ]),
                          type: TextInputType.phone,
                        ),
                        DropDownGender(onChanged: cubit.onSexTypeChanged),
                        DropDownIsRead(onChanged: cubit.onReadTypeChanged),
                        CustomTextField(
                          read: true,
                          dIcon: Icons.real_estate_agent,
                          label: "الدولة",
                          hint: "الدولة",
                          controller: cubit.countryController
                            ..text = Prefs.getString('country'),
                          validator: qValidator(
                            [
                              IsRequired(KeysConfig.thisFieldRequired),
                              MaxLength(30),
                            ],
                          ),
                          type: TextInputType.streetAddress,
                          onTap: () {
                            showCountryPicker(
                              context: context,

                              exclude: <String>['ar', 'EG'],
                              favorite: <String>['SA', 'EG'],
                              //showPhoneCode: true,

                              onSelect: (Country country) {
                                setState(() {
                                  cubit.countryController.text =
                                      country.nameLocalized!;

                                  //.replaceAll(RegExp('[^A-Za-z]'), ' ')
                                });

                                print('Select country: ${country.displayName}');
                              },
                              countryListTheme: CountryListThemeData(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                                inputDecoration: InputDecoration(
                                  labelText: 'البحث',
                                  hintText: 'ابدأ الكتابة للبحث',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        CustomTextField(
                          read: true,
                          dIcon: Icons.location_city_rounded,
                          label: "الجنسية",
                          hint: "الجنسية",
                          controller: cubit.nationality
                            ..text = Prefs.getString('country'),
                          validator: qValidator(
                            [
                              IsRequired(KeysConfig.thisFieldRequired),
                              MaxLength(30),
                            ],
                          ),
                          type: TextInputType.text,
                          onTap: () {
                            showCountryPicker(
                              context: context,

                              exclude: <String>['ar', 'EG'],
                              favorite: <String>['SA', 'EG'],
                              //showPhoneCode: true,

                              onSelect: (Country country) {
                                setState(() {
                                  cubit.nationality.text =
                                      country.nameLocalized!;

                                  //.replaceAll(RegExp('[^A-Za-z]'), ' ')
                                });

                                print('Select country: ${country.displayName}');
                              },
                              countryListTheme: CountryListThemeData(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                                inputDecoration: InputDecoration(
                                  labelText: 'البحث',
                                  hintText: 'ابدأ الكتابة للبحث',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        CustomTextField(
                          read: true,
                          dIcon: Icons.work_history_outlined,
                          label: KeysConfig.entityWork,
                          hint: KeysConfig.entityWork,
                          controller: cubit.entityWorkController
                            ..text = Prefs.getString('workPlace'),
                          validator: qValidator(
                            [
                              IsRequired(KeysConfig.entityWork),
                              MaxLength(30),
                            ],
                          ),
                          type: TextInputType.text,
                        ),
                        CustomTextField(
                          read: true,
                          dIcon: Icons.privacy_tip_outlined,
                          label: KeysConfig.entityNumber,
                          hint: KeysConfig.entityNumber,
                          controller: cubit.entityNumberController
                            ..text = Prefs.getString('idCardNumber'),
                          validator: qValidator(
                            [
                              IsRequired(KeysConfig.entityNumber),
                              MaxLength(30),
                            ],
                          ),
                          type: TextInputType.number,
                        ),
                        state is! RegisterLoading
                            ? MediaButton(
                                color: kPrimaryColor,
                                title: "تعديل",
                                onPressed: () {
                                  Get.to(() => UpdateProfile(
                                        id: state.profileModel.data.id,
                                      ));
                                })
                            : const LoadingFadingCircle(),

                        GestureDetector(
                            onTap: () => Get.to(() => const DeleteAccount()),
                            child: customText4(
                                title: "هل تريد حذف الحساب ؟ ",
                                color: kPrimaryColor)),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                      ],
                    ),
                  );
                }
                if (state is ProfileError) {
                  return Text(state.msg);
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _profilePic({required String userName}) {
    return profilePicContainer(context, image, userName, KeysConfig.changeImage,
        () {
      openImagePicker(
          context: context,
          onCameraTapped: () {
            _getPic(context, ImageSource.camera);
          },
          onGalleryTapped: () {
            _getPic(context, ImageSource.gallery);
          });
    }, false);
  }

  final ImagePicker _picker = ImagePicker();

  void _getPic(
    BuildContext context,
    ImageSource source,
  ) async {
    final pickedFile = await _picker.getImage(
      source: source,
      maxWidth: 400,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
        image.profilePic = File(pickedFile.path);
      });
      Navigator.pop(context);
      FocusScope.of(context).unfocus();
    }
  }
}
