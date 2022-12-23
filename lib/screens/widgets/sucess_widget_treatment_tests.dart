import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/cubit/home_tabebar_cubit.dart';
import '../home/view.dart';
import 'constants.dart';
import 'fast_widget.dart';

// ignore: must_be_immutable
class SuccessViewJumpTest extends StatelessWidget {
  final String title1;
  final String title2;
  final String? title3;
  final VoidCallback? onTap;
  final VoidCallback? onTap2;
  bool? goNext;

  SuccessViewJumpTest(
      {Key? key,
      required this.title1,
      required this.title2,
      this.onTap,
      this.goNext = false,
      this.title3,
      this.onTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Container(
      height: context.height,
      width: context.width,
      color: kHomeColor,
      child: Column(children: [
        SizedBox(
          height: context.height * 0.3,
        ),
        customText7(
            title: title1,
            //"لقد تم إنتهاء إختبار التاريخ المرضي بنجاح",
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
            onPressed: () {
              if (onTap != null) {
                onTap!();
              } else {
                BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(2);
                navigateTo(context, const HomeTabScreen());
              }
            },
            title: title2),
        goNext == true
            ? CustomButton(
                color: kPrimaryColor,
                onPressed: () {
                  if (onTap2 != null) {
                    onTap2!();
                  }

                  // else {
                  //   BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(2);
                  //   navigateTo(context, const HomeTabScreen());
                  // }
                },
                title: title3)
            : const SizedBox.shrink(),
      ]),
    );
  }
}
