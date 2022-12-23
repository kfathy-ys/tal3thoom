import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/queen.dart';
import 'package:tal3thoom/screens/auth/login/view.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide ContextExtensionss;
import '../../../../../../config/keys.dart';

import '../../widgets/alerts.dart';
import '../../widgets/loading.dart';
import '../register/page/back_icon.dart';
import 'cubit/new_password_cubit.dart';

class NewPasswordScreen extends StatefulWidget {
  final String vCode;

  final String email;

  const NewPasswordScreen({Key? key, required this.vCode, required this.email})
      : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _newPassController = TextEditingController();

  final _confirmPssController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      body: BlocProvider(
        create: (context) => NewPasswordCubit(),
        child: BlocConsumer<NewPasswordCubit, NewPasswordState>(
          listener: (context, state) {
            if (state is NewPasswordSuccess) {
              Alert.success(
                "مرحبا بكم في تطبيق كلامي",
                desc: "تم تسجيل الدخول بنجاح",
              );
              Get.offAll(LoginScreen());
            } else if (state is NewPasswordError) {
              Alert.error(
                "عزيزي العميل",
                desc: "الرجاء التاكد من كلمة المرور",
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<NewPasswordCubit>(context);
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: FadeInLeftBig(
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      const IconBack(),
                      SizedBox(
                        height: context.height * 0.3,
                      ),
                      CustomTextField(
                        hint: KeysConfig.password,
                        icon: Icons.lock_outline,
                        dIcon: Icons.lock_outline,
                        label: KeysConfig.password,
                        controller: _newPassController,
                        validator: qValidator([
                          IsRequired(KeysConfig.enterPass),
                          MinLength(6,
                              "يجب أن تحتوي كلمة المرور على 6 حروف على الأقل منها حروف كبيرة وحروف صغيرة وأرقام وعلامات خاصة"),
                          MaxLength(30),
                        ]),
                        type: TextInputType.text,
                      ),
                      CustomTextField(
                        hint: KeysConfig.confirmPass,
                        icon: Icons.lock_outline,
                        dIcon: Icons.lock_outline,
                        label: KeysConfig.confirmPass,
                        controller: _confirmPssController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return KeysConfig.thisFieldRequired;
                          }
                          if (val != _newPassController.text) {
                            return KeysConfig.notSimilar;
                          }
                          return null;
                        },
                        type: TextInputType.text,
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      state is! NewPasswordLoading
                          ? CustomButton(
                              color: kPrimaryColor,
                              title: KeysConfig.save,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.createNewPassword(
                                      email: widget.email,
                                      code: widget.vCode,
                                      password: _newPassController.text);
                                }
                              },
                            )
                          : const LoadingFadingCircle(),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
