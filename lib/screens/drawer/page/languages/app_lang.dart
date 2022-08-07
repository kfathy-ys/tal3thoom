import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../config/database.dart';

class AppLanguage extends GetxController {
  var appLocale = 'ar';

  @override
  void onInit() async {
    LocalStorage localStorage = LocalStorage();

    // ignore: unnecessary_null_comparison
    appLocale = await localStorage.languageSelected;
    update();
    Get.updateLocale(Locale(appLocale));
    super.onInit();
  }

  void changeLanguage(String type) async {
    LocalStorage localStorage = LocalStorage();

    if (appLocale == type) {
      return;
    }
    if (type == 'ar') {
      appLocale = 'ar';
      localStorage.saveLanguageToDisk('ar');
    } else {
      appLocale = 'en';
      localStorage.saveLanguageToDisk('en');
    }
    update();
  }
}
