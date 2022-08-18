import 'dart:developer';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tal3thoom/screens/auth/register/page/drop_down_is_readble.dart';
import 'package:tal3thoom/screens/auth/register/page/drop_down_six.dart';
import 'package:tal3thoom/screens/auth/register/page/title_subtitle.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/validation.dart';
import '../../widgets/alerts.dart';
import '../../widgets/custom_textFornField_range.dart';
import '../../widgets/donotHave.dart';
import '../../widgets/loading.dart';
import '../login/view.dart';
import '../vcode/view.dart';
import 'cubit/register_cubit.dart';
import 'page/back_icon.dart';
import '../../../../../../config/keys.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();

  final _countryController = TextEditingController();
  final _countryPhoneCode = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();
  final _nationality = TextEditingController();
  final _country = TextEditingController();
  final _city = TextEditingController();

  final _familyNameControlller = TextEditingController();

  final _dadNameController = TextEditingController();

  final _firstNameController = TextEditingController();

  final _confirmPassController = TextEditingController();

  final _dateController = TextEditingController();

  final _entityNumberController = TextEditingController();
  final _neighborhood = TextEditingController();

  final _entityWorkController = TextEditingController();

  final _cityController = TextEditingController();

  bool value = false;

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
              MaterialPageRoute(builder: (context) =>  LoginScreen()),
              (Route<dynamic> route) => false);
          Alert.success('تم تسجيل بنجاح');
        } else if (state is RegisterError) {
          Alert.error(state.msg);
        }
      }, builder: (context, state) {
        final cubit = BlocProvider.of<RegisterCubit>(context);
        return Scaffold(
          backgroundColor: kHomeColor,
          body: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                const IconBack(),
                SizedBox(
                    height: height * 0.15,
                    child: Image.asset("assets/images/logoregister.png")),
                const TextTitleSubTitle(),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  dIcon: Icons.person,
                  label: KeysConfig.firstName,
                  hint: KeysConfig.firstName,
                  controller: _firstNameController,
                  validator: qValidator([
                    IsRequired(KeysConfig.enterFullName),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  dIcon: Icons.person,
                  label: KeysConfig.dadName,
                  hint: KeysConfig.dadName,
                  controller: _dadNameController,
                  validator: qValidator([
                    IsRequired(KeysConfig.thisFieldRequired),
                    // IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  dIcon: Icons.person,
                  label: KeysConfig.familyName,
                  hint: KeysConfig.familyName,
                  controller: _familyNameControlller,
                  validator: qValidator([
                    IsRequired(KeysConfig.dadName),
                    // IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  hint: KeysConfig.email,
                  dIcon: Icons.email,
                  label: KeysConfig.email,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired(KeysConfig.thisFieldRequired),
                    //  IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),

                CustomTextFieldRange(
                  dIcon: Icons.date_range_outlined,
                  hint: "تاريخ الميلاد",
                  controller: _dateController,
                  onTap: ()async {
                    await  showDatePicker(
                      context: context,

                      firstDate: DateTime(1950),
                      lastDate: DateTime(2030),
                      initialDate: DateTime(1950),

                    ).then(( value) {
                      if(value == null) return;
                      _dateController.text= value.toString().substring(0,10);

                    //  provider.onRageChanges(value);
                    });


                  },

                ),
                // CustomTextField(
                //   dIcon: Icons.date_range,
                //   label: KeysConfig.date,
                //   hint: KeysConfig.date,
                //   controller: _dateController,
                //   validator: qValidator([
                //     IsRequired(KeysConfig.date),
                //    // const IsEmail(KeysConfig.date),
                //   ]),
                //   type: TextInputType.emailAddress,
                // ),
                DropDownSix(onChanged: cubit.onSexTypeChanged),
                DropDownRead(onChanged: cubit.onReadTypeChanged),


                CustomTextField(
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
                  dIcon: Icons.location_on_rounded,
                  label: "المدينة",
                  hint: "المدينة",
                  controller: _city,
                  validator: qValidator(
                    [
                      IsRequired(KeysConfig.countryResidence),
                      MaxLength(30),
                    ],
                  ),
                  type: TextInputType.streetAddress,
                ),
                CustomTextField(
                  dIcon: Icons.add_location_alt_outlined,
                  label: "الحي السكني",
                  hint: "الحي السكني",
                  controller: _neighborhood,
                  validator: qValidator(
                    [
                      IsRequired(KeysConfig.countryResidence),
                      MaxLength(30),
                    ],
                  ),
                  type: TextInputType.streetAddress,
                ),
                CustomTextField(
                  dIcon: Icons.work,
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
                ),  CustomTextField(
                  dIcon: Icons.location_city_rounded,
                  label: "الجنسية",
                  hint:  "الجنسية",
                  controller: _nationality,
                  validator: qValidator(
                    [
                      IsRequired(KeysConfig.thisFieldRequired),
                      MaxLength(30),
                    ],
                  ),
                  type: TextInputType.text,
                ),

                CustomTextField(
                  dIcon: Icons.person_add_alt_1,
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
                CustomTextField(
                  hint: KeysConfig.password,
                  icon: Icons.lock_outline,
                  dIcon: Icons.lock_outline,
                  label: KeysConfig.password,
                  controller: _passController,
                  validator: qValidator([
                    IsRequired(KeysConfig.enterPass),
                    MinLength(6, KeysConfig.minPassword),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  hint: KeysConfig.confirmPass,
                  icon: Icons.lock_outline,
                  dIcon: Icons.lock_outline,
                  label: KeysConfig.confirmPass,
                  controller: _confirmPassController,
                  // validator: qValidator([
                  //   IsRequired(KeysConfig.confirmPass ),
                  //   Match(KeysConfig.notSimilar,caseSensitive: true,error: KeysConfig.notSimilar ),
                  //   MinLength(6, KeysConfig.minPassword ),
                  //   MaxLength(30),
                  // ],
                  //
                  //
                  // ),

                  validator: (val) {
                    if (val!.isEmpty) {
                      return KeysConfig.thisFieldRequired;
                    }
                    if (val != _passController.text) {
                      return KeysConfig.notSimilar;
                    }
                    return null;
                  },
                  type: TextInputType.text,
                ),
             /*   Container(
                  height: height * 0.13,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                  child: IntlPhoneField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontFamily: "DinReguler",
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kPrimaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    initialCountryCode: 'SA',
                    onChanged: (phone) {
                      log(phone.completeNumber);
                    },
                    onCountryChanged: (country) {
                      log('Country changed to: ' + country.name);
                    },
                  ),
                ),*/
                  CustomTextField(
                  hint: KeysConfig.phoneNumber ,
                  dIcon: Icons.phone,
                  label: KeysConfig.phoneNumber ,
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired(KeysConfig.thisFieldRequired ),

                    MinLength(6),
                    MaxLength(30),
                  ]),
                  type: TextInputType.phone,
                ),
                CustomTextField(
                  hint: "مثال : +966" ,
                  dIcon: Icons.key,
                  label: "كود الدولة" ,
                  controller: _countryPhoneCode,
                  validator: qValidator([
                    IsRequired(KeysConfig.thisFieldRequired ),

                    MinLength(2),
                    MaxLength(30),
                  ]),
                  type: TextInputType.phone,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                  // horizontalTitleGap: 10,
                  title: const Text(KeysConfig.accept,
                      style: TextStyle(
                          color: kBlackText,
                          fontSize: 10,
                          fontFamily: 'DinReguler')),
                  leading: Checkbox(
                    activeColor: kDarkPrimaryColor,
                    value: value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: const Text(KeysConfig.conditions,
                        style: TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                            fontFamily: "DinMedium",
                            color: kSkyButton,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                state is! RegisterLoading
                    ? CustomButton(
                        color: kPrimaryColor,
                        title: KeysConfig.createAccount,
                        onPressed: () {
                          /// TODO:: must remove in integrated
                          MaterialPageRoute(
                              builder: (context) => const VCodeScreen());

                          if (_formKey.currentState!.validate()) {
                            cubit.userRegister(
                              firstName: _firstNameController.text,
                              middleName: _dadNameController.text,
                              lastName: _familyNameControlller.text,
                              email: _emailController.text,
                              password: _passController.text,
                              phoneNumber: _phoneController.text,

                              countryPhoneCode: _countryPhoneCode.text,
                              birthDate: _dateController.text,
                              nationality: _nationality.text,
                              country: _countryController.text,
                              city: _city.text,
                              workPlace: _entityWorkController.text,

                            );
                          }
                        })
                    : const LoadingFadingCircle(),
                DoNotHave(
                  text: KeysConfig.login,
                  route: () => navigateTo(context, LoginScreen()),
                  have: KeysConfig.donHave,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
