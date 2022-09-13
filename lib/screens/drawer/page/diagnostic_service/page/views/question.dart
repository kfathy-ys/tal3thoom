import 'package:flutter/cupertino.dart';
import '../../../../../../config/keys.dart';

import '../../../../../../config/text_to_speech.dart';

class CheckBoxItem {
  bool? isAvailableTextField;
  String? textFieldValue;
  String? name, selectedValue;
  List<dynamic>? answersList;
  VoidCallback? onTap;

  CheckBoxItem(
      {this.name,
      this.selectedValue,
      this.onTap,
      this.answersList,
      this.isAvailableTextField = false,
      this.textFieldValue});
}

Speech speech = Speech();

List<CheckBoxItem> evaluateNumber = [
  CheckBoxItem(selectedValue: "", answersList: [
    {"name": "1", "value": "1"},
    {"name": "2", "value": "2"},
    {"name": "3", "value": "3"},
    {"name": "4", "value": "4"},
    {"name": "5", "value": "5"},
    {"name": "6", "value": "6"},
    {"name": "7", "value": "7"},
    {"name": "8", "value": "8"},
    {"name": "9", "value": "9"},
  ]),
];
List<CheckBoxItem> firstQuestionsList = [
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: KeysConfig.studyingPrivatePublicSchool,
      selectedValue: "",
      answersList: [
        {"name": KeysConfig.government, "value": "1"},
        {"name": KeysConfig.eligibility, "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: KeysConfig.averageGrade,
      selectedValue: "",
      answersList: [
        {"name": KeysConfig.acceptable, "value": "1"},
        {"name": KeysConfig.good, "value": "2"},
        {"name": KeysConfig.veryGood, "value": "3"},
        {"name": KeysConfig.excellent, "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: KeysConfig.stutteringSchool,
      selectedValue: "",
      isAvailableTextField: false,
      answersList: [
        {"name": KeysConfig.readingOutLoud, "value": "1"},
        {"name": KeysConfig.teacherQuestions, "value": "2"},
        {"name": KeysConfig.talkFriends, "value": "3"},
        {
          "name": KeysConfig.another,
          "value": "other",
        },
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: KeysConfig.InWhatEducationalLevel,
      selectedValue: "",
      answersList: [
        {"name": KeysConfig.primary, "value": "1"},
        {"name": KeysConfig.JuniorHigh, "value": "2"},
        {"name": KeysConfig.highSchool, "value": "3"},
        {"name": KeysConfig.undergraduate, "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: KeysConfig.inWhichClassStudy,
      selectedValue: "",
      answersList: [
        {"name": KeysConfig.theFirst, "value": "1"},
        {"name": KeysConfig.Second, "value": "2"},
        {"name": KeysConfig.Third, "value": "3"},
        {"name": KeysConfig.fourth, "value": "4"},
        {"name": KeysConfig.Fifth, "value": "5"},
        {"name": KeysConfig.VI, "value": "6"},
      ]),
];
List<CheckBoxItem> secondQuestionsList = [
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "حدِّدْ إذا كانت أي من الأمراض التالية لديك في الماضي",
      selectedValue: "",
      isAvailableTextField: false,
      answersList: [
        {"name": "تشًنُج ", "value": "1"},
        {"name": "مشاكلُ في السمعْ  ", "value": "2"},
        {"name": " مشاكل عصبيةْ ", "value": "3"},
        {"name": " إصابة بالرأسْ   ", "value": "4"},
        {"name": " مشاكل نفسيةْ  ", "value": "5"},
        {"name": "أخري  ", "value": "other"},
      ]),
];
List<CheckBoxItem> thirdQuestionsList = [
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name:
          "هل كانت هناك أعراض مشابهة في العائلة في الوقت الحالي أو في الماضي؟ لو نعم من فضلك حدِّدْ",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "متى تمت ملاحظة التلعثم في أول مرَّهْ؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "مَنْ أولُ من لاحظ التلعثمُ لديكْ؟ْ",
      selectedValue: "",
      isAvailableTextField: false,
      answersList: [
        {"name": "انا", "value": "1"},
        {"name": "الأم", "value": "2"},
        {"name": "الاب", "value": "3"},
        {"name": "المعلم", "value": "4"},
        {"name": "آخرون", "value": "other"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "منذ بدايةِ التلعثمِ هل هو في زيادةٍ أم نقصانْ؟",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name:
          "صِفْ نتيجةَ العلاجِ ومتى كان ذلك وما هو اسم الطبيب المعالج ومكان العيادة وسبب انقطاع العلاجْ",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name:
          "في رأيك هل للتلعثم علاقة بسببٍ معينْ أو بحدثٍ حصل في الماضي؟ لو للتلعثم علاقة بسببٍ معينٍ أو حدثْ, أِذْكُرْهُْ",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
];

List<CheckBoxItem> forthQuestionsList = [
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "أشخاص معينينْ , مثالْ : ( الغرباء أو الأهلْ )؟",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان ", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "من فضلك حدد أو اذكر بعض الأسماءْ",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "مواقف معينةٌ , مِثلْ : ( التحدث في الهاتف - مع الأصدقاء )",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان ", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "من فضلك حدِدْ أو اذكر بعض المواقف",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "حالة معينة , مِثلْ : ( متعبْ - غاضبْ - سعيدْ )",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "من فضلك صِفْ أو حدِدْ ما له علاقة بذلكْ",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(name: "أصوات معينة :", selectedValue: "", answersList: [
    {"name": "زيادة", "value": "1"},
    {"name": "نقصان", "value": "2"},
    {"name": "متقلب", "value": "3"},
    {"name": "ثابت", "value": "4"},
  ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "من فضلك حدِّدْ بعض الأصواتْ",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "كلمات معينة, مِثلْ : ( أسماءْ - أفعالْ - صفاتْ )",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "من فضلك حدِّدْ بعض الكلماتْ :",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "أثناء القراءةْ",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "من فضلك حدِّدْ :",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "خلالِ الحديثِ التلقائيْ",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "من فضلك حدد",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "في الوقتِ الحالي هل الحالة في؟",
      selectedValue: "",
      answersList: [
        {"name": "زيادة", "value": "1"},
        {"name": "نقصان", "value": "2"},
        {"name": "متقلب", "value": "3"},
        {"name": "ثابت", "value": "4"},
      ]),
];
List<CheckBoxItem> fifthQuestionsList = [
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name:
          "صِفْ إن كانت هناك كلماتٌ معينةْ صعبةُ النطقْ فيتم استخدام كلمات بديلة مِثلْ : طريقْ بدلاً مِنْ شارعْ و هكذا",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name:
          "هل تتجنب مواقف معينة مثل عدم حضور عشاءٍ كبير فيه الكثير من الحضورْ؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "هل تتجنب التحدث لأشخاص معينين كالمدرس أو شخص غريبْ؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
];

List<CheckBoxItem> sixQuestionsList = [
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "اذكر اسمك الرباعي كاملا بصوت عالي. كم عدد مرات التلعثم في نطقه؟",
      selectedValue: "",
      answersList: [
        {"name": "نعم", "value": "1"},
        {"name": "لا", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "اذكر بصوت عال الأرقام من 1 - 10 , كم عدد مرات التلعثم؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "اذكر بصوت عال الأرقام من 10 - 1 , كم عدد مرات التلعثم؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "اقرأ بصوت عال سورة الفاتحة , كم عدد مرات التلعثم؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name:
          "هل التلعثم لديك مطول أو متقطع أو يوجد إضطرابٌ داخل الصوت أو يضيف كلماتٍ إضافيةٍ في بداية الجملة؟",
      selectedValue: "",
      answersList: [
        {"name": " متكرر", "value": "1"},
        {"name": "مطول", "value": "2"},
        {"name": "إظهار اضطرابات داخل الصوت", "value": "3"},
        {"name": "يضيف كلماتٍ إضافيةٍ في بداية الجملةْ", "value": "4"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "هل تستمر في الجزءِ المتلعثَمِ فيهْ إلى النهاية؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "هل تحاول في الكلمة المتلعثم فيها مرة أخرى؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "هل تستسلم في الجزء المتلعثم فيه وتحاول نطْق كلمة بديلةْ؟",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "هل هناك حركات مبالغ فيها مرتبطة بالتلعثم؟ لو هناك من فضلك حدِّدْ",
      selectedValue: "",
      answersList: [
        {"name": "لا", "value": "1"},
        {"name": "نعم ", "value": "2"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      name: "هل هناك أي تغيير في التنفس عند التلعثمْ؟",
      selectedValue: "",
      answersList: [
        {"name": "لا يوجد تغيير", "value": "1"},
        {"name": "تغيير طفيفْ", "value": "2"},
        {"name": "تغيير كبير", "value": "3"},
      ]),
  CheckBoxItem(
      onTap: () => speech.speak(KeysConfig.studyingPrivatePublicSchool),
      isAvailableTextField: false,
      name: "كيف يمكن وصف التواصلُ البصري؟",
      selectedValue: "",
      answersList: [
        {"name": "جيد", "value": "1"},
        {"name": "مقبول", "value": "2"},
        {"name": "ضعيف", "value": "3"},
        {"name": "أخري", "value": "other"},
      ]),
];
