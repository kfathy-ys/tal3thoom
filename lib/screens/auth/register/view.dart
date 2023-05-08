import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
import '../../widgets/custom_text_field_phone.dart';
import '../../widgets/custom_text_filed_country_code.dart';
import '../../widgets/donotHave.dart';
import '../../widgets/loading.dart';
import '../login/view.dart';
import '../policy_privacy/view.dart';
import '../termination_conditions/view.dart';
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
  final _city = TextEditingController();

  final _familyNameControlller = TextEditingController();

  final _dadNameController = TextEditingController();

  final _firstNameController = TextEditingController();
  final _firstNameENController = TextEditingController();
  final _middleNameEnController = TextEditingController();
  final _lastNameEnController = TextEditingController();

  final _confirmPassController = TextEditingController();

  final _dateController = TextEditingController();

  final _entityNumberController = TextEditingController();
  final _neighborhood = TextEditingController();

  final _entityWorkController = TextEditingController();

  bool value = false;

  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

  @override
  Widget build(BuildContext context) {
    const String sCharacters =
        "المطلوب 8 حروف كبيرة,صغيرة وأرقام";

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
        if (state is RegisterSuccess) {
          /// TODO : Cached Token needed
          //Prefs.setString('token', state.registerModel.);
          //  Get.offAll(() =>  LoginScreen());
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (Route<dynamic> route) => false);
          Alert.success('تم تسجيل بنجاح');
        } else if (state is RegisterError) {
          Alert.error(state.msg);
          // Alert.error("خطأ في  تسجيل البيانات",
          //     desc:
          //         "المعلومات المدخلة غير صالحة الرجاء ملئ الحقول والتاكد من صحة البيانات المطلوبة");
        }
      }, builder: (context, state) {
        final cubit = BlocProvider.of<RegisterCubit>(context);
        return Scaffold(
          backgroundColor: kHomeColor,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  const IconBack(),
                  FadeInDownBig(
                    child: Column(
                      children: [
                        SizedBox(
                            height: context.height * 0.15,
                            child:
                                Image.asset("assets/images/logoregister.png")),
                        const TextTitleSubTitle(
                            HeadTitle: KeysConfig.signUpNow),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  CustomTextField(
                    dIcon: Icons.person,
                    label: KeysConfig.firstName+" *",
                    hint: KeysConfig.firstName,
                    controller: _firstNameController,
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
                    label: KeysConfig.dadName+" *",
                    hint: KeysConfig.dadName,
                    controller: _dadNameController,
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
                    label: KeysConfig.familyName+" *",
                    hint: KeysConfig.familyName,
                    controller: _familyNameControlller,
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
                    label: "الأسم الاول باللغة الانجليزية"" *",
                    hint: "الأسم الاول باللغة الانجليزية",
                    controller: _firstNameENController,
                    validator: qValidator([
                      IsRequired(KeysConfig.thisFieldRequired),
                      MinLength(3, "يجب ان ييكون 3 أحرف علي الاقل"),
                    ]),
                    textInputFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp('[a-zA-Z]')),
                    ],
                    type: TextInputType.name,
                  ),


                  CustomTextField(
                    dIcon: Icons.person,
                    label: "الأسم الأب باللغة الانجليزية"" *",
                    hint: "الأسم الأب باللغة الانجليزية",
                    controller: _middleNameEnController,
                    validator: qValidator([
                      IsRequired(KeysConfig.thisFieldRequired),
                      MinLength(3, "يجب ان ييكون 3 أحرف علي الاقل"),
                    ]),
                    textInputFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp('[a-zA-Z]')),
                    ],
                    type: TextInputType.name,
                  ),

                  CustomTextField(
                    dIcon: Icons.person,
                    label: "الأسم العائلة باللغة الانجليزية"" *",
                    hint: "الأسم العائلة باللغة الانجليزية",
                    controller: _lastNameEnController,
                    validator: qValidator([
                      IsRequired(KeysConfig.thisFieldRequired),
                      MinLength(3, "يجب ان ييكون 3 أحرف علي الاقل"),
                    ]),
                    textInputFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp('[a-zA-Z]')),
                    ],
                    type: TextInputType.name,
                  ),
                  CustomTextField(
                    hint: KeysConfig.email,
                    dIcon: Icons.email,
                    label: KeysConfig.email+" *",
                    controller: _emailController,
                    validator: qValidator([
                      IsRequired(KeysConfig.thisFieldRequired),
                      const IsEmail(KeysConfig.mustBeEmail),
                      MaxLength(30),
                    ]),
                    type: TextInputType.emailAddress,
                  ),

                  CustomTextFieldRange(
                    dIcon: Icons.date_range_outlined,
                    hint: "تاريخ الميلاد"" *",
                    controller: _dateController,
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
                        _dateController.text =
                            value.toString().substring(0, 10);

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
                  /* Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 12),
                    child: CSCPicker(
                      ///Enable disable state dropdown [OPTIONAL PARAMETER]
                      showStates: true,


                      /// Enable disable city drop down [OPTIONAL PARAMETER]
                      showCities: true,


                      ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                      flagState: CountryFlag.DISABLE,

                      ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                      dropdownDecoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                      ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(const Radius.circular(10)),
                          color: Colors.grey.shade300,
                          border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                      ///placeholders for dropdown search field
                      countrySearchPlaceholder: "الدولة",
                      stateSearchPlaceholder: "المدينة",
                      citySearchPlaceholder: "الحي السكني",

                      ///labels for dropdown
                      countryDropdownLabel: "الدولة",
                      stateDropdownLabel: "المدينة",
                      cityDropdownLabel: "الحي السكني",

                      ///Default Country
                      defaultCountry: DefaultCountry.Saudi_Arabia,

                      ///Disable country dropdown (Note: use it with default country)
                      //disableCountry: true,

                      ///selected item style [OPTIONAL PARAMETER]
                      selectedItemStyle: const TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontFamily: "DinMedium",
                      ),

                      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                      dropdownHeadingStyle: const TextStyle(
                        fontSize: 17,
                        color: kPrimaryColor,
                        fontFamily: "DinMedium",),

                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: const TextStyle(
                          fontSize: 16,
                          color: kPrimaryColor,
                          fontFamily: "DinMedium",
                      ),

                      ///Dialog box radius [OPTIONAL PARAMETER]
                      dropdownDialogRadius: 10.0,

                      ///Search bar radius [OPTIONAL PARAMETER]
                      searchBarRadius: 10.0,

                      ///triggers once country selected in dropdown
                      onCountryChanged: (String? value) {
                        setState(() {
                          ///store value in country variable
                          countryValue = value;
                        });
                      },

                      ///triggers once state selected in dropdown
                      onStateChanged: (String?  value) {
                        setState(() {
                          ///store value in state variable
                          stateValue = value;
                        });
                      },

                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        setState(() {
                          ///store value in city variable
                          cityValue = value;
                        });
                      },
                    ),
                  ),*/

                  CustomTextField(
                    read: true,
                    dIcon: Icons.real_estate_agent,
                    label: "الدولة"" *",
                    hint: "الدولة",
                    controller: _countryController,
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
                            _countryController.text = country.nameLocalized!;

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
                    dIcon: Icons.location_on_rounded,
                    label: "المدينة"" *",
                    hint: "المدينة",
                    controller: _city,
                    validator: qValidator([
                      IsRequired(KeysConfig.thisFieldRequired),
                      //   IsOptional(),
                      // MinLength(3),
                      MaxLength(30),
                    ]),
                    type: TextInputType.streetAddress,
                  ),
                  CustomTextField(
                    dIcon: Icons.add_location_alt_outlined,
                    label: "الحي السكني",
                    hint: "الحي السكني",
                    controller: _neighborhood,
                    validator: qValidator([
                      //  IsRequired(KeysConfig.thisFieldRequired),
                      IsOptional(),
                      MinLength(3, "يجب ان ييكون 3 أحرف علي الاقل"),
                      MaxLength(30),
                    ]),
                    type: TextInputType.streetAddress,
                  ),
                  CustomTextField(
                    dIcon: Icons.work,
                    label: KeysConfig.entityWork,
                    hint: KeysConfig.entityWork,
                    controller: _entityWorkController,
                    validator: qValidator(
                      [
                        // IsRequired(KeysConfig.thisFieldRequired),
                        // MinLength(3, "يجب ان ييكون 3 أحرف علي الاقل"),

                        IsOptional(),
                        MaxLength(30),
                      ],
                    ),
                    type: TextInputType.text,
                  ),
                  CustomTextField(
                    read: true,
                    dIcon: Icons.location_city_rounded,
                    label: "الجنسية"" *",
                    hint: "الجنسية",
                    controller: _nationality,
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
                            _nationality.text = country.nameLocalized!;

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
                    dIcon: Icons.person_add_alt_1,
                    label: KeysConfig.entityNumber,
                    hint: KeysConfig.entityNumber,
                    controller: _entityNumberController,
                    validator: qValidator(
                      [
                        // MinLength(3,"يجب ان ييكون 3 أحرف علي الاقل"),

                        IsOptional(),
                        //  IsRequired(KeysConfig.thisFieldRequired),
                        MaxLength(30),
                      ],
                    ),
                    // textInputFormatter: [
                    //   FilteringTextInputFormatter.allow(RegExp('[0-30]')),
                    // ],
                    type: TextInputType.number,
                  ),
                  CustomTextField(
                    hint: KeysConfig.password,
                    icon: Icons.lock_outline,
                    dIcon: Icons.lock_outline,
                    label: KeysConfig.password+" *",
                    controller: _passController,
                    validator: qValidator([
                      IsRequired(KeysConfig.enterPass),
                     //  ContainsAny([r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'],sCharacters),
                     //  RegExpRule(
                     //      RegExp('[a-zA-Z0-9]')
                     //      ,
                     //      sCharacters),

                      RegExpRule(
                          RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])[A-Za-z0-9!@#\$&*~-]*$'),
                          sCharacters),
                      MinLength(6, sCharacters),
                      MaxLength(30),
                    ]),
                    // type: TextInputType.text,

                    // textInputFormatter: [
                    //   FilteringTextInputFormatter.allow(
                    //       RegExp('[a-zA-Z0-9]')),
                    // ],
                  ),
                  CustomTextField(
                    hint: KeysConfig.confirmPass,
                    icon: Icons.lock_outline,
                    dIcon: Icons.lock_outline,
                    label: KeysConfig.confirmPass+" *",
                    controller: _confirmPassController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return KeysConfig.thisFieldRequired;
                      }
                      if (val != _passController.text) {
                        return KeysConfig.notSimilar;
                      }
                      return null;
                    },

                    // textInputFormatter: [
                    //   FilteringTextInputFormatter.allow(
                    //       RegExp('[a-zA-Z0-9]')),
                    // ],
                  ),
                  /* Container(
                    height: context.height * 0.13,
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

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFieldPhoneCode(
                        read: true,
                        dIcon: Icons.key,
                        hint: "مثال : +966",
                        label: "كود الدولة"" *",
                        controller: _countryPhoneCode,
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
                                _countryPhoneCode.text = country.displayName
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
                        label: KeysConfig.phoneNumber+" *",
                        controller: _phoneController,
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

                  /*    CustomTextField(
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
                  ),*/
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
                      onTap: () {
                        Get.to(() => const TerminationConditions());
                      },
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
                          onPressed: () async {
                            /// TODO:: must remove in integrated
                            // MaterialPageRoute(
                            //     builder: (context) => const VCodeScreen());
                            if (value == false) {
                              log("false");
                              await CustomDialog(
                                  context: context,
                                  title: KeysConfig.terms,
                                  accept: "أعي ذالك",
                                  refuse: KeysConfig.no,
                                  subtitle: KeysConfig.youMust);
                            } else {
                              // await Get.to(() => const BasicInfoScreen());
                              // Prefs.getString("mark");
                              log("true");
                            }
                            if (_formKey.currentState!.validate()) {
                              cubit.userRegister(
                                firstName: _firstNameController.text,
                                middleName: _dadNameController.text,
                                lastName: _familyNameControlller.text,
                                firstNameEn: _firstNameENController.text,
                                middleNameEn: _middleNameEnController.text,
                                lastNameEn: _lastNameEnController.text,
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
                  ),

                  GestureDetector(
                    onTap: () {
                      Get.to(() => const PrivacyPolicy());
                    },
                    child: const Text(KeysConfig.policy,
                        style: TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                            fontFamily: "DinMedium",
                            color: kSkyButton,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: context.height*0.03,),
                  
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  bool isPasswordValid(String password) {
    if (password.length < 6) return false;
    if (!password.contains(RegExp(r"[a-z]"))) return false;
    if (!password.contains(RegExp(r"[A-Z]"))) return false;
    if (!password.contains(RegExp(r"[0-9]"))) return false;
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return false;
    return true;
  }
}
