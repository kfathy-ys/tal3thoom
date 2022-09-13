import 'package:animate_do/animate_do.dart';
import 'package:tal3thoom/screens/auth/login/page/recovery_password.dart';
import 'package:tal3thoom/screens/auth/register/view.dart';
import 'package:tal3thoom/screens/home/view.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/validation.dart';
import '../../../../../../config/keys.dart';

import '../../widgets/alerts.dart';
import '../../widgets/constants.dart';
import '../../widgets/customButton.dart';
import '../../widgets/donotHave.dart';
import '../../widgets/loading.dart';
import '../register/page/title_subtitle.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            //Alert.success(state.model.messages.toString());
            Alert.success(
              "مرحبا بكم في تطبيق كلامي",
              desc: "تم تسجيل الدخول بنجاح",
            );

            // navigateAndFinish(
            //     context,
            //     HomeTabScreen(
            //       userId: state.model.data!.userId!,
            //     ));

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => HomeTabScreen(
                          userId: state.model.data!.userId!,
                        )),
                (Route<dynamic> route) => false);
          } else if (state is LoginError) {
            // Alert.error(state.msg.toString());
            Alert.error(
              "عزيزي العميل",
              desc: "الرجاء التاكد من البريد الإلكتروني وكلمة المرور",
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            backgroundColor: kHomeColor,
            body: SingleChildScrollView(
              child: SizedBox(
                height: context.height,
                width: context.width,
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: context.height * 0.2,
                        ),
                        FadeInDownBig(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: context.height * 0.15,
                                  child: Image.asset(
                                      "assets/images/logoregister.png")),
                              const TextTitleSubTitle(
                                HeadTitle: KeysConfig.signIn,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        FadeInLeftBig(
                          child: CustomTextField(
                            dIcon: Icons.email,
                            label: "البريد الإلكتروني",
                            hint: "البريد الإلكتروني",
                            controller: _emailController,
                            validator: qValidator([
                              IsRequired(KeysConfig.enterEmail),
                              const IsEmail("يجب أن يكون بريد الكتروني"),
                              MaxLength(30),
                            ]),
                            type: TextInputType.emailAddress,
                          ),
                        ),
                        FadeInRightBig(
                          child: CustomTextField(
                            hint: KeysConfig.password,
                            icon: Icons.lock_outline,
                            dIcon: Icons.lock_outline,
                            label: KeysConfig.password,
                            controller: _passwordController,
                            validator: qValidator([
                              IsRequired(KeysConfig.enterPassword),
                              MinLength(6, KeysConfig.minPassword),
                              MaxLength(30),
                            ]),
                            type: TextInputType.text,
                          ),
                        ),
                        RecoveryWidget(
                          onTap: () {
                            //  navigateTo(context, ForgetPassword());
                          },
                        ),
                        state is! LoginLoading
                            ? FadeInUpBig(
                                child: CustomButton(
                                  color: kPrimaryColor,
                                  title: KeysConfig.signIn,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.userLogin(
                                          email: _emailController.text,
                                          password: _passwordController.text);
                                    }
                                  },
                                ),
                              )
                            : const LoadingFadingCircle(),
                        DoNotHave(
                          text: KeysConfig.signUpNow,
                          route: () =>
                              navigateTo(context, const SignUpScreen()),
                          have: KeysConfig.donHave,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
