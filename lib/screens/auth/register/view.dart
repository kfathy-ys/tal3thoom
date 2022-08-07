import 'package:tal3thoom/screens/auth/register/page/title_subtitle.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/validation.dart';
import '../../widgets/alerts.dart';
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
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
                  height: height*0.15,
                    child: Image.asset("assets/images/logoregister.png")),
                const TextTitleSubTitle(),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  dIcon: Icons.person,
                  label: KeysConfig.firstName ,
                  hint: KeysConfig.firstName ,
                  controller: _firstNameController,
                  validator: qValidator([
                    IsRequired(KeysConfig.enterFullName ),


                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  dIcon: Icons.person,
                  label:KeysConfig.dadName ,
                  hint:KeysConfig.dadName ,
                  controller: _dadNameController,
                  validator: qValidator([
                    IsRequired(KeysConfig.thisFieldRequired ),
                   // IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  dIcon: Icons.person,
                  label: KeysConfig.familyName ,
                  hint:  KeysConfig.familyName ,
                  controller: _familyNameControlller,
                  validator: qValidator([
                    IsRequired(KeysConfig.dadName ),
                   // IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.name,
                ),
                CustomTextField(
                  hint: KeysConfig.email ,
                  dIcon: Icons.email,
                  label: KeysConfig.email ,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired" ),
                  //  IsOptional(),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  dIcon: Icons.date_range,
                  label: KeysConfig.date ,
                  hint:  KeysConfig.date ,
                  controller: _emailController,
                  validator: qValidator([
                    IsRequired(KeysConfig.date ),
                    const IsEmail("MustBeEmail" ),

                  ]),
                  type: TextInputType.emailAddress,
                ),
                CustomTextField(
                  dIcon: Icons.male_outlined,
                  label: KeysConfig.sex ,
                  hint: KeysConfig.sex ,
                  controller: _sexController,
                  validator: qValidator(
                    [
                      IsRequired(KeysConfig.sex ),

                      MaxLength(30),
                    ],
                  ),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  dIcon: Icons.real_estate_agent,
                  label: KeysConfig.countryResidence ,
                  hint: KeysConfig.countryResidence ,
                  controller: _countryController,
                  validator: qValidator(
                    [
                      IsRequired(KeysConfig.countryResidence ),

                      MaxLength(30),
                    ],
                  ),
                  type: TextInputType.streetAddress,
                ),
                CustomTextField(
                  dIcon: Icons.edit,
                  label: KeysConfig.entityWork ,
                  hint: KeysConfig.entityWork ,
                  controller: _entityWorkController,
                  validator: qValidator(
                    [
                      IsRequired(KeysConfig.entityWork ),

                      MaxLength(30),
                    ],
                  ),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  dIcon: Icons.location_on_outlined,
                  label: KeysConfig.city ,
                  hint: KeysConfig.city ,
                  controller: _cityController,
                  validator: qValidator(
                    [
                      IsRequired(KeysConfig.city ),

                      MaxLength(30),
                    ],
                  ),
                  type: TextInputType.streetAddress,
                ),
                CustomTextField(
                  dIcon: Icons.person_add_alt_1,
                  label: KeysConfig.entityNumber ,
                  hint: KeysConfig.entityNumber ,
                  controller: _entityNumberController,
                  validator: qValidator(
                    [
                      IsRequired(KeysConfig.entityNumber ),

                      MaxLength(30),
                    ],
                  ),
                  type: TextInputType.number,
                ),
                CustomTextField(
                  hint: KeysConfig.password ,
                  icon: Icons.lock_outline,
                  dIcon: Icons.lock_outline,
                  label: KeysConfig.password ,
                  controller: _passController,
                  validator: qValidator([
                    IsRequired(KeysConfig.enterPass ),

                    MinLength(6, "minPassword" ),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  hint: KeysConfig.confirmPass ,
                  icon: Icons.lock_outline,
                  dIcon: Icons.lock_outline,
                  label: KeysConfig.confirmPass ,
                  controller: _confirmPassController,
                  validator: qValidator([
                    IsRequired(KeysConfig.confirmPass ),

                    MinLength(6, "minPassword" ),
                    MaxLength(30),
                  ]),
                  type: TextInputType.text,
                ),
                CustomTextField(
                  hint: KeysConfig.phoneNumber ,
                  dIcon: Icons.phone,
                  label: KeysConfig.phoneNumber ,
                  controller: _phoneController,
                  validator: qValidator([
                    IsRequired("thisFieldRequired" ),

                    MinLength(6),
                    MaxLength(30),
                  ]),
                  type: TextInputType.phone,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                 // horizontalTitleGap: 10,
                  title: const Text(KeysConfig.accept ,
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
                  trailing:    GestureDetector(
                    onTap: (){},
                    child: const Text(KeysConfig.conditions ,
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
                        title: KeysConfig.createAccount ,
                        onPressed: () {

                          /// TODO:: must remove in integrated
                          MaterialPageRoute(builder: (context) => const VCodeScreen());


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
                DoNotHave(
                  text: KeysConfig.login ,
                  route: () => navigateTo(context, LoginScreen()),
                  have: KeysConfig.donHave ,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
