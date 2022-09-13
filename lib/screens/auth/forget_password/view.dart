import 'package:tal3thoom/screens/auth/register/page/back_icon.dart';
import 'package:tal3thoom/screens/auth/vcode/view.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' hide Trans;
import '../../../../../../config/keys.dart';

import '../../widgets/constants.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                hint: KeysConfig.email,
                dIcon: Icons.email,
                label: KeysConfig.email,
                controller: _emailController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              CustomButton(
                color: kPrimaryColor,
                title: KeysConfig.sendCode,
                onPressed: () {
                  navigateTo(context, const VCodeScreen());
                },
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              GestureDetector(
                onTap: () => Get.to(() {
                  navigateTo(context, const VCodeScreen());
                }),
                child: const Text(
                  KeysConfig.resend,
                  style: TextStyle(
                      color: kSkyButton,
                      fontSize: 16,
                      fontFamily: 'DinReguler'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
