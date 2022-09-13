import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../view.dart';
import 'views/profile_items.dart';

// ignore: must_be_immutable
class SpecializerProfile extends StatelessWidget {
  const SpecializerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTileContainer(
                  widthh: context.width * 0.6,
                  title: "الملف الشخصي للمختص",
                  context: context),
              Container(
                color: kRoundBorderColor,
                height: context.height * 0.12,
                width: context.width * 0.8,
                child: Center(
                  child: Image.asset("assets/images/avater2.png"),
                ),
              ),
              Container(
                  color: kAppBarColor,
                  height: context.height * 0.3,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: context.width * 0.8,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        ProfileItems(
                            title: "الأسم : ", subTitle: "Mohamed Rashad"),
                        ProfileItems(
                            title: "البريد الإلكتروني : ", subTitle: ""),
                        ProfileItems(title: "سنوات الخبرة : ", subTitle: ""),
                        ProfileItems(title: "التعليم : ", subTitle: ""),
                        ProfileItems(title: "الوظيفة : ", subTitle: ""),
                        ProfileItems(title: "تاريخ الميلاد : ", subTitle: ""),
                      ])),
              Container(
                  color: kAppBarColor,
                  height: context.height * 0.4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: context.width * 0.8,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        ProfileItems(title: "العنوان : ", subTitle: ""),
                        ProfileItems(title: "جهة العمل : ", subTitle: ""),
                        ProfileItems(title: "السيرة الذاتية : ", subTitle: ""),
                        ProfileItems(title: "الجنسية : ", subTitle: ""),
                        ProfileItems(title: "الجنس : ", subTitle: ""),
                        ProfileItems(title: "رقم الهوية : ", subTitle: ""),
                        ProfileItems(
                            title: "سعر جلسة مستشارك : ", subTitle: ""),
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
        height: height * 0.05,
      );
}
