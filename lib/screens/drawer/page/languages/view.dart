
import 'package:tal3thoom/screens/drawer/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../config/keys.dart';

import 'package:queen/core/helpers/prefs.dart';
import 'package:tal3thoom/screens/widgets/appBar.dart';

import '../../../widgets/constants.dart';

import '../../../widgets/mediaButton.dart';

// ignore: must_be_immutable
class LanguagesScreen extends StatelessWidget {
  LanguagesScreen({Key? key}) : super(key: key);

final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kAppBarColor,
      drawer: const MenuItems(),
      appBar: customssAppbar(
          context: context,
          press: () => _scaffoldKey.currentState!.openDrawer()),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: height,
            width: width * 0.85,
            color: kHomeColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTile(
                      widthh: width * 0.5,
                      title: KeysConfig.languages ,
                      context: context),
                  SizedBox(
                    height: height * 0.4,
                  ),
                  MediaButton(
                    onPressed: () {
                      //navigateTo(context, Payment());
                      buildLanguageDialog(context);
                    },
                    title: KeysConfig.changeLang ,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return CupertinoAlertDialog(
              title: const Text(
                KeysConfig.choosePreferredLanguage ,
                style: TextStyle(
                    fontFamily: 'DinBold', fontSize: 16, color: kPrimaryColor),
              ),
              content: SizedBox(
                  height: 100, // Change as per your requirement
                  width: 300.0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: const Text(
                            "العربية",
                            style: TextStyle(
                                fontFamily: 'DinMedium',
                                fontSize: 14,
                                color: kBlackText),
                          ),
                          onTap: () {
                            context.locale = const Locale('ar', 'EG');
                            Prefs.setString("saveLang", "saveLang");
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: const Text(
                            "English",
                            style: TextStyle(
                                fontFamily: 'DinMedium',
                                fontSize: 14,
                                color: kBlackText),
                          ),
                          onTap: () {
                            context.locale = const Locale('en', 'US');
                            // Prefs.getString("saveLang");
                            Prefs.setString("saveLang", "saveLang");
                          },
                        ),
                      ),
                    ],
                  )));
        });
  }
}
