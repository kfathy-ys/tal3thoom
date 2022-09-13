import 'package:tal3thoom/screens/home/view.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../config/keys.dart';

import '../register/page/back_icon.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _newPassController = TextEditingController();
  final _confirmPssController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                hint: KeysConfig.newPassword,
                icon: Icons.lock_outline,
                dIcon: Icons.lock_outline,
                label: KeysConfig.newPassword,
                controller: _newPassController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter a new password";
                  }
                  return null;
                },
                type: TextInputType.phone,
              ),
              CustomTextField(
                hint: KeysConfig.confirmPass,
                icon: Icons.lock_outline,
                dIcon: Icons.lock_outline,
                label: KeysConfig.confirmPass,
                controller: _confirmPssController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter confirm password";
                  }
                  return null;
                },
                type: TextInputType.phone,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              CustomButton(
                color: kPrimaryColor,
                title: KeysConfig.save,
                onPressed: () {
                  navigateAndFinish(context, const HomeTabScreen());
                },
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
