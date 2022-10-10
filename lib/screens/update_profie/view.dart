import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/update_profie/view.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queen/validation.dart';
import 'package:tal3thoom/config/keys.dart';


import '../auth/register/page/drop_down_is_readble.dart';
import '../auth/register/page/drop_down_six.dart';
import '../drawer/view.dart';
import '../home/pages/views/profile/cubit/profile_cubit.dart';
import '../home/view.dart';
import '../widgets/alerts.dart';
import '../widgets/appBar.dart';
import '../widgets/constants.dart';
import '../widgets/customTextFeild.dart';
import '../widgets/custom_textFornField_range.dart';
import '../widgets/custom_text_field_phone.dart';
import '../widgets/custom_text_filed_country_code.dart';
import '../widgets/date_convertors.dart';
import '../widgets/loading.dart';
import '../widgets/pick_image.dart';
import '../widgets/profile_pick_image.dart';
import 'cubit/update_profile_cubit.dart';
import 'models/profile_model.dart';
import 'page/drop_down_gender.dart';
import 'page/drop_down_read.dart';

class UpdateProfile extends StatefulWidget {

  final int id;
   const UpdateProfile({Key? key, required this.id}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}
class _UpdateProfileState extends State<UpdateProfile> {
  final formKey = GlobalKey<FormState>();


  bool value = false;
  dynamic image =
      "https://i.pinimg.com/originals/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;


    return Scaffold(

      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Container(
        height: context.height,
        color: kHomeColor,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => UpdateProfileCubit(),
              child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                listener: (context, state) {
                 if (state is UpdateProfileSuccess) {
                  // TODO : Cached Token needed
                   // Prefs.setString('token', state.registerModel.);
                     //Get.offAll(() =>  LoginScreen());
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>  const HomeTabScreen()),
                        (Route<dynamic> route) => false);
                    Alert.success('تم التعديل بنجاح');
                  } else if (state is UpdateProfileError) {
                    Alert.error(state.msg);
                  }
                },
                builder: (context, state) {
                  final cubit = BlocProvider.of<UpdateProfileCubit>(context);
                  return Column(
                    children: [
                      CustomTileContainer(
                          widthh: width * 0.5,
                          title: "المعلومات الشخصية",
                          context: context),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      _profilePic(userName: Prefs.getString('fullName')),

                      CustomTextField(
                        dIcon: Icons.person,
                        label: KeysConfig.firstName,
                        hint: KeysConfig.firstName,
                        controller: cubit.firstNameController,
                        validator: qValidator([
                          IsRequired(KeysConfig.thisFieldRequired),
                          MinLength(3, "يجب ان ييكون 3 أحرف علي الاقل"),
                        ]),
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Zء-ي]')),
                        ],
                        type: TextInputType.name,
                      ),

                      CustomTextField(
                        dIcon: Icons.person,
                        label: KeysConfig.dadName,
                        hint: KeysConfig.dadName,
                        controller: cubit.dadNameController,
                        validator: qValidator([
                          IsRequired(KeysConfig.thisFieldRequired),
                          MinLength(3, "يجب ان ييكون 3 أحرف علي الاقل"),

                          // IsOptional(),
                          MaxLength(30),
                        ]),
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Zء-ي]')),
                        ],
                        type: TextInputType.name,
                      ),

                      CustomTextField(
                        dIcon: Icons.person,
                        label: KeysConfig.familyName,
                        hint: KeysConfig.familyName,
                        controller: cubit.familyNameControlller,
                        validator: qValidator([
                          IsRequired(KeysConfig.thisFieldRequired),
                          MinLength(3, "يجب ان ييكون 3 أحرف علي الاقل"),

                          // IsOptional(),
                          MaxLength(30),
                        ]),
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Zء-ي]')),
                        ],
                        type: TextInputType.name,
                      ),

                      CustomTextFieldRange(
                        dIcon: Icons.date_range_outlined,
                        hint: "تاريخ الميلاد",
                        controller: cubit.dateController
                        ,                            validator: qValidator([
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
                        isEdit: true,
                        hint: KeysConfig.email,
                        dIcon: Icons.email,
                        label: KeysConfig.email,
                        controller: cubit.emailController,
                        validator: qValidator([
                          IsRequired("thisFieldRequired"),
                          //  IsOptional(),
                          MaxLength(30),
                        ]),
                        type: TextInputType.text,
                      ),
                      DropDownSix(onChanged: cubit.onSexTypeChanged),
                      DropDownRead(onChanged: cubit.onReadTypeChanged),
                      CustomTextField(
                        isEdit: true,

                        read: true,
                        dIcon: Icons.real_estate_agent,
                        label: "الدولة",
                        hint: "الدولة",
                        controller: cubit.countryController,
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
                                cubit.countryController.text = country.nameLocalized!;

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
                                    color:
                                    const Color(0xFF8C98A8).withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      CustomTextField(
                        isEdit: true,

                        read: true,
                        dIcon: Icons.location_city_rounded,
                        label: "الجنسية",
                        hint: "الجنسية",
                        controller: cubit.nationality ,
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
                                cubit.nationality.text = country.nameLocalized!;

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
                                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      CustomTextField(
                        dIcon: Icons.location_on_rounded,
                        label: "المدينة",
                        hint: "المدينة",
                        controller: cubit.city,
                        validator: qValidator([
                          IsRequired(KeysConfig.thisFieldRequired),
                          //   IsOptional(),
                          // MinLength(3),
                          MaxLength(30),
                        ]),
                        type: TextInputType.streetAddress,
                      ),



                      CustomTextField(
                        isEdit: true,
                        dIcon: Icons.work_history_outlined,
                        label: KeysConfig.entityWork,
                        hint: KeysConfig.entityWork,
                        controller: cubit.entityWorkController
                        ,
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
                        controller: cubit.idCardNumber
                        ,
                        validator: qValidator(
                          [
                            IsRequired(KeysConfig.entityNumber),
                            MaxLength(30),
                          ],
                        ),
                        type: TextInputType.number,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFieldPhoneCode(
                            read: true,
                            dIcon: Icons.key,
                            hint: "مثال : +966",
                            label: "كود الدولة",
                            controller: cubit.countryPhoneCode,
                            validator: qValidator([
                              IsRequired(KeysConfig.thisFieldRequired),
                              MinLength(2),
                              MaxLength(30),
                            ]),
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                exclude: <String>['ar', 'EG'],
                                favorite: <String>['SA', 'EG'],
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  setState(() {
                                    cubit.countryPhoneCode.text = country.displayName
                                        .replaceAll(RegExp('[^0-9]'), '');
                                  });

                                  print('Select country: ${country.displayName}');
                                },
                                countryListTheme: CountryListThemeData(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40.0),
                                    topRight: Radius.circular(40.0),
                                  ),
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
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
                          CustomTextFieldPhone(
                            hint: KeysConfig.phoneNumber,
                            dIcon: Icons.phone,
                            label: KeysConfig.phoneNumber,
                            controller: cubit.phoneController,
                            validator: qValidator([
                              IsRequired(KeysConfig.thisFieldRequired),
                              MinLength(10, "يجب ان يكون الحد الأدني 10 أرقام "),
                              MaxLength(30),
                            ]),
                            type: TextInputType.phone,
                            textInputFormatter: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                            ],
                          ),
                        ],
                      ),
                      state is! UpdateProfileLoading
                          ? MediaButton(
                          color: kPrimaryColor,
                          title: "تعديل",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.updateProfile(
                                id: widget.id,
                                firstName: cubit.firstNameController.text,
                                middleName: cubit.dadNameController.text,
                                lastName: cubit.familyNameControlller.text,
                                email: cubit.emailController.text,
                                phoneNumber: cubit.phoneController.text,
                                countryPhoneCode: cubit.countryPhoneCode.text,
                                birthDate: cubit.dateController.text,
                                nationality: cubit.nationality.text,
                                idCardNumber:cubit.idCardNumber.text ,
                                country: cubit.countryController.text,
                                city: cubit.city.text,
                                workPlace: cubit.entityWorkController.text,


                              );
                            }
                          })
                          : const LoadingFadingCircle(),
                    ],
                  );

                },
              ),
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
