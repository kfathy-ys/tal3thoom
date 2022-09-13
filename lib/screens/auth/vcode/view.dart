import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../config/keys.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../new_password/view.dart';
import '../register/page/back_icon.dart';

class VCodeScreen extends StatefulWidget {
  const VCodeScreen({Key? key}) : super(key: key);

  @override
  State<VCodeScreen> createState() => _VCodeScreenState();
}

class _VCodeScreenState extends State<VCodeScreen> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  void _handleConfirmCode() {
    final text = _emailController.text;
    if (text.isNotEmpty) {
      // ConfirmCodeCubit.of(context).checkCode(_pinFieldController.text);
    }
  }

  @override
  void dispose() {
    //_pinFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
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
                height: context.height * 0.3,
              ),
              CustomTextField(
                hint: KeysConfig.EnterVcode,
                dIcon: Icons.verified_user_outlined,
                label: KeysConfig.EnterVcode,
                controller: _emailController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "من فضلك أدخل الكود المرسل";
                  }
                  return null;
                },
                type: TextInputType.emailAddress,
              ),
              _buildResendCounter(),
              SizedBox(
                height: context.height * 0.05,
              ),
              CustomButton(
                color: kPrimaryColor,
                title: KeysConfig.confirm,
                onPressed: () {
                  //Get.to(() => NewPasswordScreen());
                  navigateTo(context, NewPasswordScreen());
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

  Widget _buildResendCounter() {
    return Countdown(
      seconds: 75,
      controller: _countdownController,
      onFinished: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('إذا لم ترسل رمز التحقق ، يرجى المحاولة مرة أخرى!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                    fontSize: 12)),
          ),
        );
      },
      build: (context, time) {
        final showResetBottom = time.toInt() == 0;
        final minutes = time >= 60 ? (time / 60).round() : 0;
        final seconds = (time - minutes * 60).round();
        return GestureDetector(
          onTap: () {
            // _handleCodeResend();
            if (showResetBottom) {
              _countdownController.restart();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                KeysConfig.resent,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: showResetBottom ? Colors.black : kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DinReguler',
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$minutes:${seconds < 10 ? 0 : ''}${seconds.toInt()}',
                  style: TextStyle(
                    color: !showResetBottom ? Colors.black : Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
