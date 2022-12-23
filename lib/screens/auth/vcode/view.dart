import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:queen/queen.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import '../../../../../../config/keys.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:get/get.dart' hide Trans hide ContextExtensionss;

import '../../widgets/alerts.dart';
import '../new_password/view.dart';
import '../register/page/back_icon.dart';

class VCodeScreen extends StatefulWidget {
  final String vCode;
  final String email;

  const VCodeScreen({Key? key, required this.vCode, required this.email})
      : super(key: key);

  @override
  State<VCodeScreen> createState() => _VCodeScreenState();
}

class _VCodeScreenState extends State<VCodeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _pinController = TextEditingController();
  final CountdownController _countdownController =
      CountdownController(autoStart: true);

  void _handleConfirmCode() {
    final text = _pinController.text;
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
    return Scaffold(
      backgroundColor: kHomeColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: FadeInRightBig(
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
                  hint: KeysConfig.enterVcode,
                  dIcon: Icons.verified_user_outlined,
                  label: KeysConfig.enterVcode,
                  controller: _pinController,
                  validator: qValidator([
                    IsRequired("الكود المرسل مطلوب "),
                    MinLength(6, KeysConfig.minPassword),
                    MaxLength(30),
                  ]),
                  textInputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  type: TextInputType.number,
                ),
                _buildResendCounter(),
                SizedBox(
                  height: context.height * 0.05,
                ),
                CustomButton(
                  color: kPrimaryColor,
                  title: KeysConfig.confirm,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.vCode == _pinController.text) {
                        Alert.success("تم تفعيل الحساب بنجاح ",
                            desc: "الرجاء تاكيد كلمة المرور ");

                        Get.to(() => NewPasswordScreen(
                              vCode: widget.vCode,
                              email: widget.email,
                            ));
                      } else {
                        Alert.error(
                          "عزيزي العميل",
                          desc: "الرجاء التاكد من الكود المرسل",
                        );
                      }
                    }
                  },
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
              ],
            ),
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
