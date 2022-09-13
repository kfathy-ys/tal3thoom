import 'dart:io';

import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queen/validation.dart';
import 'package:tal3thoom/config/keys.dart';
import '../../../../auth/register/cubit/register_cubit.dart';
import '../../../../auth/vcode/view.dart';
import '../../../../widgets/alerts.dart';
import '../../../../widgets/constants.dart';
import '../../../../widgets/customTextFeild.dart';

import '../../../../widgets/loading.dart';
import '../../../../widgets/pick_image.dart';
import '../../../../widgets/profile_pick_image.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();

  final _countryController = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final _familyNameControlller = TextEditingController();

  final _dadNameController = TextEditingController();

  final _firstNameController = TextEditingController();

  final _confirmPassController = TextEditingController();

  final _sexController = TextEditingController();

  final _entityNumberController = TextEditingController();

  final _entityWorkController = TextEditingController();

  final _cityController = TextEditingController();

  bool value = false;
  dynamic image =
      "https://media.istockphoto.com/photos/kaaba-in-mecca-picture-id482206266?k=20&m=482206266&s=612x612&w=0&h=JvXTR5ih-ieBNh2MXfyBFU8_BAvgUH_m-NUx1m8RpPc=";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
        if (state is RegisterSuccess) {
          /// TODO : Cached Token needed
          //Prefs.setString('token', state.registerModel.);
          //  Get.offAll(() =>  LoginScreen());
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const VCodeScreen()),
              (Route<dynamic> route) => false);
          Alert.success('تم تسجيل بنجاح');
        } else if (state is RegisterError) {
          Alert.error(state.msg);
        }
      }, builder: (context, state) {
        final cubit = BlocProvider.of<RegisterCubit>(context);
        return Card(
          color: kHomeColor,
          child: Container(
            height: context.height,
            color: kHomeColor,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    CustomTileContainer(
                        widthh: width * 0.5,
                        title: "المعلومات الشخصية",
                        context: context),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    _profilePic(userName: "Rashad Hamza"),
                    CustomTextField(
                      isEdit: true,
                      dIcon: Icons.person,
                      label: KeysConfig.userName,
                      hint: KeysConfig.userName,
                      controller: _firstNameController,
                      validator: qValidator([
                        IsRequired(KeysConfig.userName),
                      ]),
                      type: TextInputType.name,
                    ),
                    CustomTextField(
                      isEdit: true,
                      dIcon: Icons.date_range,
                      label: KeysConfig.date,
                      hint: KeysConfig.date,
                      controller: _emailController,
                      validator: qValidator([
                        IsRequired(KeysConfig.date),
                        const IsEmail("MustBeEmail"),
                      ]),
                      type: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      isEdit: true,
                      hint: KeysConfig.email,
                      dIcon: Icons.email,
                      label: KeysConfig.email,
                      controller: _emailController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired"),
                        //  IsOptional(),
                        MaxLength(30),
                      ]),
                      type: TextInputType.text,
                    ),
                    CustomTextField(
                      isEdit: true,
                      hint: KeysConfig.phoneNumber,
                      dIcon: Icons.phone,
                      label: KeysConfig.phoneNumber,
                      controller: _phoneController,
                      validator: qValidator([
                        IsRequired("thisFieldRequired"),
                        MinLength(6),
                        MaxLength(30),
                      ]),
                      type: TextInputType.phone,
                    ),
                    CustomTextField(
                      isEdit: true,
                      dIcon: Icons.location_on_outlined,
                      label: KeysConfig.city,
                      hint: KeysConfig.city,
                      controller: _cityController,
                      validator: qValidator(
                        [
                          IsRequired(KeysConfig.city),
                          MaxLength(30),
                        ],
                      ),
                      type: TextInputType.streetAddress,
                    ),
                    CustomTextField(
                      dIcon: Icons.male_outlined,
                      label: KeysConfig.sex,
                      hint: KeysConfig.sex,
                      controller: _sexController,
                      validator: qValidator(
                        [
                          IsRequired(KeysConfig.sex),
                          MaxLength(30),
                        ],
                      ),
                      type: TextInputType.text,
                    ),
                    CustomTextField(
                      isEdit: true,
                      dIcon: Icons.real_estate_agent,
                      label: KeysConfig.countryResidence,
                      hint: KeysConfig.countryResidence,
                      controller: _countryController,
                      validator: qValidator(
                        [
                          IsRequired(KeysConfig.countryResidence),
                          MaxLength(30),
                        ],
                      ),
                      type: TextInputType.streetAddress,
                    ),
                    CustomTextField(
                      isEdit: true,
                      dIcon: Icons.work_history_outlined,
                      label: KeysConfig.entityWork,
                      hint: KeysConfig.entityWork,
                      controller: _entityWorkController,
                      validator: qValidator(
                        [
                          IsRequired(KeysConfig.entityWork),
                          MaxLength(30),
                        ],
                      ),
                      type: TextInputType.text,
                    ),
                    CustomTextField(
                      isEdit: true,
                      dIcon: Icons.privacy_tip_outlined,
                      label: KeysConfig.entityNumber,
                      hint: KeysConfig.entityNumber,
                      controller: _entityNumberController,
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
                              // if (_formKey.currentState!.validate()) {
                              //                           //   cubit.userRegister(
                              //                           //       country: _countryController.text,
                              //                           //       fName: _firstNameController.text,
                              //                           //       lName: _lastNameController.text,
                              //                           //       fullName: _arabicFullNameController.text,
                              //                           //       userName: _userNameController.text,
                              //                           //       phone: _phoneController.text,
                              //                           //       email: _emailController.text,
                              //                           //       password: _passController.text);
                              //                           // }
                            })
                        : const LoadingFadingCircle(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
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
