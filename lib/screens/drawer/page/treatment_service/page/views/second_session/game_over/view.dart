import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../home/cubit/home_tabebar_cubit.dart';
import '../../../../../../../home/view.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/customButton.dart';

// ignore: must_be_immutable

class GameOver extends StatefulWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeColor,
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: context.height,
        width: context.width,
        color: kHomeColor,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          children: [
            SizedBox(
              height: context.height * 0.2,
            ),
            customText4(
                title: "لقد اتممت الجلسلات العلاجية بنجاح \n Game Over  ",
                color: kBlackText),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: kSkyLightColor,
              width: context.width * 0.85,
              height: context.height * 0.28,
              child: Center(
                child: Image.asset("assets/images/success.png"),
              ),
            ),
            CustomButton(
              color: kPrimaryColor,
              title: "العودة",
              onPressed: () {
                BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(1);
                Get.offAll(() => const HomeTabScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
