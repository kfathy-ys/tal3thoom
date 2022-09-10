import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/home/view.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:tal3thoom/screens/widgets/network_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../auth/login/view.dart';
import '../widgets/fast_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loggedIn = true;
  var userId = Prefs.getString("userId");

  @override
  void initState() {
    //goToHomePage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.fill,
        ),
        FadeInUpBig(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: kPrimaryColor,
                child: InkWell(
                  onTap: () => userId.isNotEmpty
                      ? Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeTabScreen()),
                          (route) => false)


                      : Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LoginScreen()),
                          (route) => false),


                  child: Image.asset(
                    'assets/images/arrow splash icon.png',
                    scale: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void goToHomePage(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        Timer(
            const Duration(
              // seconds: 1,
              seconds: 3,
            ), () {
          // _bloc.add(AppStarted());
        });
      }
    } on SocketException catch (_) {
      showNetworkErrorDialog(context, () {
        Navigator.of(context).pop();
        Get.to(() {
          loggedIn ? const HomeTabScreen() : const HomeTabScreen();
        });
      });
    }
  }
}
