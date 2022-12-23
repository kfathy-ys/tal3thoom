import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/queen.dart';
import 'package:tal3thoom/screens/auth/register/page/back_icon.dart';
import 'package:tal3thoom/screens/auth/vcode/view.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide ContextExtensionss;
import '../../../../../../config/keys.dart';

import '../../widgets/alerts.dart';
import '../../widgets/constants.dart';
import '../../widgets/loading.dart';
import 'cubit/forget_password_cubit.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ForgetPasswordCubit>(context);

    return Scaffold(
      backgroundColor: kHomeColor,
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            Alert.success(
              "الرجاء متابعه البريد الالكتروني ",
              desc: "تم ارسال كود التفعيل .. ارفقه هنا ",
            );

            Get.to(() => VCodeScreen(
                vCode: state.forgetPasswordModel.data!.code!,
                email: cubit.emailController.text));
          } else if (state is ForgetPasswordError) {
            // Alert.error(state.msg.toString());
            Alert.error(
              "عزيزي العميل",
              desc: "الرجاء التاكد من البريد الإلكتروني",
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ForgetPasswordCubit>(context);
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
                      height: context.height * 0.2,
                    ),
                    CustomTextField(
                      dIcon: Icons.email,
                      label: "البريد الإلكتروني",
                      hint: "البريد الإلكتروني",
                      controller: cubit.emailController,
                      validator: qValidator([
                        IsRequired(KeysConfig.enterEmail),
                        const IsEmail("يجب أن يكون بريد الكتروني"),
                        MaxLength(30),
                      ]),
                      type: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: context.height * 0.05,
                    ),
                    state is! ForgetPasswordLoading
                        ? CustomButton(
                            color: kPrimaryColor,
                            title: KeysConfig.sendCode,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.forgetPassword(
                                  email: cubit.emailController.text,
                                );
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
    );
  }
}
