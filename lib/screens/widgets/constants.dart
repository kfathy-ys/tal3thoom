// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' hide Trans;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:queen/core/helpers/prefs.dart';
import 'package:text_scroll/text_scroll.dart';

import '../home/cubit/home_tabebar_cubit.dart';
import '../home/view.dart';

const kPrimaryColor = Color(0xFF2471D4);

const kBackGroundCard = Color(0xFFF3F8FF);

const kDarkPrimaryColor = Color(0xFF2E73B2);
const kDarklyColor = Color(0xFF0D4992);
const kButtonGreenDark = Color(0xFF26D696);
const kButtonTreat = Color(0xFF26CBD6);
const kButtonAdviser = Color(0xFFAC6DC2);
const kButtonDashBoard = Color(0xFFF45E5E);
const kButtonHome = Color(0xFFE89B83);

const Color kTextColor = Color(0xFFFFCF52);
const Color kSafeAreaColor = Color(0xFF009660);
const Color kAccentColor = Color(0xFFCBB176);
const Color kAppBarColor = Color(0xFFEDEDED);

const Color kTextTables = Color(0xFFF7F7F7);
const Color kTextFieldColor = Color(0xFF8D8D8D);
const Color kOffColor = Color(0xFFBDE4D6);
const Color kSafeAreasColor = Color(0xFF004926);
const Color kSmallIconColor = Color(0xFF009660);
const kBackgroundCardColor = Color(0xFFF4F4F4);
const kSkyLightColor = Color(0xFFDDEFFF);
const kSkyLightsColor = Color(0xFF2471D4);

const kBackgroundButton = Color(0xFFE5E5E5);
const kSkyButton = Color(0xFF609FFF);
const kSky2Button = Color(0xFFF2F8FF);

const kRose = Color(0xFFFFC5B9);
const kIcon = Color(0xFF74572F);
const kButtonRedDark = Color(0xFFC50B0B);
const Color kHomeColor = Color(0xFFFFFFFF);
const Color kRoundColor = Color(0xFFFEBD2F);
const Color kLightText = Color(0xFF484848);
const Color kBlackText = Color(0xFF262626);
const Color kCardBorder = Color(0xFF2C3E50);
const Color kDrawerBackText = Color(0xFF292929);
const Color kRoundBorderColor = Color.fromRGBO(220, 220, 220, 1);

/*const kGreenColor = Color(0xFF03AB6A);
const kLightGreenColor = Color(0xFF099861);
const kGreyTextColor = Color(0xFF898A8D);
const kWhitecardColor = Color(0xFFF5F5F5);
const kprimaryLightColor = Color(0x5c0090CF);
const kFavouriteColor = Color(0xFFAB0D03);
const kPrimaryFDarkColor = Color(0xFF0A4E75);
const kPrimaryBlueColor = Color(0xFF3080D1);
const khTextColor = Color(0xFF323232);*/
// String parseHtmlString(String htmlString) {
//   final document = parse(htmlString);
//   final String parsedString = parse(document.body!.text).documentElement!.text;
//
//   return parsedString;
// }

Widget customDivider(double height) => Container(
      width: double.infinity,
      height: height,
      color: Colors.grey[300],
    );

Widget customDivider2(double height) => Container(
      width: double.infinity,
      height: height,
      color: Colors.white,
    );

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  fontFamily: 'Contrail',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

Widget ScrollText({required String title}){
  return     Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
    child: TextScroll(
      textDirection: TextDirection.rtl,
      title,
      mode: TextScrollMode.endless,
      velocity:  const Velocity(pixelsPerSecond: Offset(150, 0)),
      delayBefore:  const Duration(seconds: 2),
      numberOfReps: 10,
      pauseBetween:  const Duration(seconds: 2),
      style:  const TextStyle(  fontFamily: 'DinMedium',
          fontSize: 14,
          color: kButtonRedDark),
      textAlign: TextAlign.right,
      selectable: true,
    ),
  );
}


Widget customNormalText({required BuildContext context, String? title}) {
  return Text(
    title!,
    style: Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(color: Colors.black, fontSize: 16, fontFamily: 'Contrail'),
  );
}

Widget CustomTileContainer(
    {required double widthh,
    required String title,
    required BuildContext context}) {
  double height = MediaQuery.of(context).size.height;
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: widthh,
    height: height * 0.06,
    decoration: BoxDecoration(
      color: kHomeColor,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: kRoundBorderColor),
    ),
    child: Center(
      child: customText4(title: title, color: kPrimaryColor),
    ),
  );
}

Widget CustomTile(
    {required double widthh,
    required String title,
    required BuildContext context}) {
  double height = MediaQuery.of(context).size.height;
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: widthh,
    height: height * 0.06,
    decoration: BoxDecoration(
      color: kHomeColor,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: kPrimaryColor),
    ),
    child: Center(
      child: customText4(title: title, color: kPrimaryColor),
    ),
  );
}

Widget CustomCurvedContainer({required String title}) {
  // double height = MediaQuery.of(context).size.height;
  // double width = MediaQuery.of(context).size.width;
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    width: Get.width / 1.8,
    height: Get.height * 0.075,
    decoration: const BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20)),
      // border: Border.all(color: kRoundBorderColor),
    ),
    child: Center(
      child: customText4(title: title, color: kHomeColor),
    ),
  );
}

Widget customMeduimBoldText(String? title) {
  return Text(title!,
      style: const TextStyle(
          color: kRoundBorderColor, fontSize: 18, fontFamily: 'NeoSansBold'));
}

Widget custom12Text({required String title, required Color color}) {
  return Text(title,
      textDirection: TextDirection.ltr,
      style: TextStyle(color: color, fontSize: 10, fontFamily: 'DinBold'));
}

Widget customBoldText({required String title, required Color color}) {
  return Text(title,
      style: TextStyle(color: color, fontSize: 18, fontFamily: 'DinBold'));
}

Widget customText2({required String title, required Color color}) {
  return Text(title,
      style: TextStyle(color: color, fontSize: 18, fontFamily: 'DinBold'));
}Widget customText16({required String title, required Color color}) {
  return Text(title,
      style: TextStyle(color: color, fontSize: 22, fontFamily: 'DinBold'));
}

Widget customText3({required String title, required Color color}) {
  return Text(title,
      style: TextStyle(color: color, fontSize: 14, fontFamily: 'DinLight'));
}
Widget customTextWatchVideo({required String title, required Color color ,required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Text(title,
        style: TextStyle(color: color, decoration: TextDecoration.underline, fontSize: 16, fontFamily: 'DinMedium')),
  );
}

Widget customText4({required String title, required Color color}) {
  return Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 16, fontFamily: 'DinMedium'));
}

Widget customText10({required String title, required Color color}) {
  return Text(title,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(color: color, fontSize: 14, fontFamily: 'DinMedium'));
}

Widget customText5({required String title, required Color color}) {
  return Text(title,
      style: TextStyle(color: color, fontSize: 30, fontFamily: 'DinBold'));
}

Widget customText6({required String title, required Color color}) {
  return Text(title,textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 18, fontFamily: 'DinBold'));
}

Widget customText7({required String title, required Color color}) {
  return Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 14, fontFamily: 'DinBold'));
}

Widget customText8({required String title, required Color color}) {
  return Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 17, fontFamily: 'DinReguler'));
}Widget customText18({required String title, required Color color}) {
  return Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 22, fontFamily: 'DinReguler'));
}

Widget customText9({required String title, required Color color}) {
  return Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: 15, fontFamily: 'DinReguler'));
}

void showAlertDialog(BuildContext context, VoidCallback onTap) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("الأرشيف"),
            content: const Text("تاكد إضافة الطلب إلي الارشيف"),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    onTap();
                    Get.back();
                  },
                  child: const Text("yes")),
              CupertinoDialogAction(
                  textStyle: const TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);
                    // SharedPreferences prefs = await SharedPreferences.getInstance();
                    //prefs.remove('isLogin');
                    Navigator.pop(context);
                  },
                  child: const Text("no")),
            ],
          ));
}

void showAlertDialogDeleteAccount(BuildContext context, VoidCallback onTap) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text("حذف الحساب"),
            content: const Text("هل تريد حذف الحساب نهائيا ؟"),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    onTap();
                  },
                  child: const Text("أوافق")),
              CupertinoDialogAction(
                  textStyle: const TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(1);
                    Get.offAll(() => const HomeTabScreen());
                  },
                  child: const Text("لا")),
            ],
          ));
}

void showAlertDialogVideo(BuildContext context, Widget video) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
          content: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: context.width * 0.8,
              height: context.height * 0.25,
              child: video)));
}

Widget customSliderText({required String title, required Color color}) {
  return Text(title,
      style: TextStyle(color: color, fontSize: 18, fontFamily: 'DinBold'));
}

Widget customLightText(String? title) {
  return Text(title!,
      style: const TextStyle(
          color: kBlackText, fontSize: 18, fontFamily: 'DinLight'));
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

const subheadingStyle = TextStyle(
  fontFamily: 'Contrail',
  fontWeight: FontWeight.w400,
  color: Colors.grey,
);

spaceH(double height) {
  return SizedBox(height: height);
}

spaceW(double width) {
  return SizedBox(width: width);
}

void archiveClientsActions(
  BuildContext context, {
  required double height,
  required double width,
  required VoidCallback onTapToArchive,
  required VoidCallback onTapConnectedDone,
  required VoidCallback onTapNotRespond,
}) {
  showModalBottomSheet(
    backgroundColor: kHomeColor,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    ),
    context: context,
    builder: (_) {
      return SizedBox(
        height: context.height * 0.2,
        width: context.width,
        child: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              // ignore: prefer_const_constructors
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  classificationContainer(context.height, context.width,
                      onTap: onTapToArchive, classificationName: 'إلي الأرشيف'),
                  classificationContainer(height, width,
                      onTap: onTapConnectedDone,
                      classificationName: 'تم التواصل'),
                  classificationContainer(context.height, context.width,
                      onTap: onTapNotRespond, classificationName: 'لم يرد'),
                ],
              );
            }),
      );
    },
  );
}

InkWell classificationContainer(double height, double width,
    {required String classificationName, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: height * 0.049,
      width: width,
      color: Colors.white,
      child: Text(
        classificationName,
        style: const TextStyle(
            fontFamily: 'Contrail',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: kBlackText),
      ),
    ),
  );
}

Future<void> showConfirmationDialog(BuildContext context,
    {required String image,
    required String title,
    required Widget done,
    required Widget cancelled}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Image.asset(
        image,
        width: context.width * 2,
        height: context.height * 0.15,
        fit: BoxFit.contain,
      ),
      content: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.height * 0.02,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Contrail',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: kBlackText),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  done,
                  cancelled,
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<bool> onWillPop(BuildContext context) async {
  final shouldPop = await showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text(
        ' إغلاق التطبيق؟',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      content: const Text(
        'هل أنت متأكد إنك  تريد إغلاق التطبيق ؟',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 12,
            // fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "إلغاء",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        CupertinoDialogAction(
            textStyle: const TextStyle(color: Colors.red),
            isDefaultAction: true,
            onPressed: () => exit(0),
            child: const Text(
              "تسجيل خروج",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    ),
  );

  return shouldPop ?? false;
}

Future<bool> onWillPopSignIn(BuildContext context) async {
  final shouldPop = await showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text(
        ' تسجيل الدخول؟',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      content: const Text(
        'هل أنت متأكد إنك  تريد  تسجيل الدخول ؟',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 12,
            // fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "إلغاء",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        CupertinoDialogAction(
            textStyle: const TextStyle(color: Colors.red),
            isDefaultAction: true,
            onPressed: () {
              // Get.offAll(() => LoginScreen());
            },
            child: const Text(
              "تسجيل الدخول",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    ),
  );

  return shouldPop ?? false;
}

Future<bool> onWillPopWebEmpty(BuildContext context) async {
  final shouldPop = await showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text(
        'عزيزي العميل الرجاء الإنتظار!',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      content: const Text(
        'هذا الاجتماع مؤجل لحين مراجعة البيانات',
        style: TextStyle(
            fontFamily: 'Contrail',
            fontSize: 12,
            // fontWeight: FontWeight.bold,
            color: kBlackText),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "إلغاء",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
        CupertinoDialogAction(
            textStyle: const TextStyle(color: Colors.red),
            isDefaultAction: true,
            onPressed: () {
              // Get.offAll(() => LoginScreen());
            },
            child: const Text(
              "التالي",
              style: TextStyle(
                fontFamily: 'Contrail',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    ),
  );

  return shouldPop ?? false;
}

Future<bool> CustomDialog(
    {required BuildContext context,
    String? title,
    String? subtitle,
    String? accept,
    String? refuse}) async {
  final shouldPop = await showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(title!,
                style: const TextStyle(
                    color: kBlackText, fontSize: 18, fontFamily: 'DinBold')),
            content: Text(subtitle!,
                style: const TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            actions: [
              CupertinoDialogAction(
                  child: Text(refuse!,
                      style: const TextStyle(
                          color: kButtonRedDark,
                          fontSize: 14,
                          fontFamily: 'DinReguler')),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              CupertinoDialogAction(
                  child: Text(accept!),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Prefs.getString("mark");
                    //  Get.to(() => const BasicInfoScreen());
                  }),
            ],
          ));
  return shouldPop ?? false;
}

//constant functions
double sizeFromheight(BuildContext context, double fraction,
    {bool removeAppBarSize = true}) {
  double deviceheight = MediaQuery.of(context).size.height;
  fraction = (removeAppBarSize
          ? (deviceheight - AppBar().preferredSize.height)
          : deviceheight) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(BuildContext context, double fraction) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}

class SizeConfig {
  static double screenheight = 0.0;
  static double screenWidth = 0.0;

  void init(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenheight = _mediaQueryData.size.height;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenheight(double inputheight) {
  double screenheight = SizeConfig.screenheight;
  // 812 is the layout height that designer use
  return (inputheight / 812.0) * screenheight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
