import 'package:tal3thoom/screens/auth/forget_password/view.dart';
import 'package:tal3thoom/screens/auth/login/page/recovery_password.dart';
import 'package:tal3thoom/screens/auth/register/view.dart';
import 'package:tal3thoom/screens/home/view.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans;
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Alert.success(state.model.messages.toString());

            Get.offAll(() => HomeTabScreen(
                  userId: state.model.data!.userId!.toString(),
                ));
          } else if (state is LoginError) {
            Alert.error(state.msg.toString());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            backgroundColor: kHomeColor,
            body: SingleChildScrollView(
              child: SizedBox(
                height: height,
                width: width,
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.2,
                      ),
                      SizedBox(
                          height: height * 0.15,
                          child: Image.asset("assets/images/logoregister.png")),
                      const TextTitleSubTitle(),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextField(
                        dIcon: Icons.email,
                        label: "email" ,
                        hint: "email" ,
                        controller: _emailController,
                        validator: qValidator([
                          IsRequired("enterEmail" ),
                          const IsEmail("MustBeEmail" ),
                          MaxLength(30),
                        ]),
                        type: TextInputType.emailAddress,
                      ),
                      CustomTextField(
                        hint: "password" ,
                        icon: Icons.lock_outline,
                        dIcon: Icons.lock_outline,
                        label: "password" ,
                        controller: _passwordController,
                        validator: qValidator([
                          IsRequired("enterPassword" ),
                          MinLength(6, "minPassword" ),
                          MaxLength(30),
                        ]),
                        type: TextInputType.text,
                      ),
                      RecoveryWidget(
                        onTap: () {

                      navigateTo(context, ForgetPassword());
                        },
                      ),
                      state is! LoginLoading
                          ? CustomButton(
                              color: kPrimaryColor,
                              title: KeysConfig.signIn ,
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {
                                //   cubit.userLogin(
                                //       email: _emailController.text,
                                //       password: _passwordController.text);
                                // }
                              },
                            )
                          : const LoadingFadingCircle(),
                      DoNotHave(
                        text: "signUpNow" ,
                        route: () => navigateTo(context, const SignUpScreen()),
                        have: "donHave" ,
                      )
                    ],
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
