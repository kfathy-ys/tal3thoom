import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/smallestButton.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/diagnostci_oases_test/views/department_card.dart';
import '../../../../../diagnostic_service/page/views/diagnostci_oases_test/views/department_counter.dart';
import '../second_stage_ssrs_test/view.dart';
import 'cubit/second_stage_oases_test_cubit.dart';

class SecondStageOasesTest extends StatefulWidget {
  const SecondStageOasesTest({Key? key}) : super(key: key);

  @override
  State<SecondStageOasesTest> createState() => _SecondStageOasesTestState();
}

class _SecondStageOasesTestState extends State<SecondStageOasesTest> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return BlocConsumer<SecondStageOasesTestCubit, SecondStageOasesTestState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<SecondStageOasesTestCubit>(context);
        return Scaffold(
          backgroundColor: kHomeColor,
          drawer: const MenuItems(),
          appBar: DynamicAppbar(
              context: context,
              press: (context) => Scaffold.of(context).openDrawer()),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            height: context.height,
            width: context.width,
            color: kHomeColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTileContainer(
                      widthh: context.width / 2,
                      title: "إختبار OASES",
                      context: context),
                  customText6(
                    title: "الإختبار التاني OASES (قياس التجارب الكامله)",
                    color: kBlackText,
                  ),
                  Image.asset("assets/images/second_test.png"),
                  DepartmentCard(
                      title: "1- قباس المعلومات العامة في حياتك",
                      isSelected: cubit.selectedGroupIndex == 0),
                  DepartmentCard(
                      title: "2- قباس رد فعلك بالنسبة لاضطراب التلعثم",
                      isSelected: cubit.selectedGroupIndex == 1),
                  DepartmentCard(
                      title: "3- قباس التواصل مع المواقف اليومية",
                      isSelected: cubit.selectedGroupIndex == 2),
                  DepartmentCard(
                      title: "4- قباس جودة الحياة",
                      isSelected: cubit.selectedGroupIndex == 3),

                  /// TODO ::: DEPARTMENT 1
                  cubit.selectedGroupIndex != 0
                      ? const SizedBox.shrink()
                      : DepartmentCounter(
                          head:
                              "  معلومات عامة  (  ${cubit.index + 1}  من ${sixQuestionsList.length} ) "),
                  cubit.selectedGroupIndex != 0
                      ? const SizedBox.shrink()
                      : customDepartmentWidget(
                          context.width, context.height, cubit,
                          itemsList: sixQuestionsList),
                  cubit.isFinishedAnswered && cubit.selectedGroupIndex == 0
                      ? Expanded(
                          child: CustomButton(
                              onPressed: () => cubit.nextQuestionsOne(),
                              title: "الانتقال الي القسم التالي",
                              color: kButtonGreenDark),
                        )
                      : const SizedBox.shrink(),

                  /// TODO ::: DEPARTMENT 2

                  cubit.selectedGroupIndex != 1
                      ? const SizedBox.shrink()
                      : DepartmentCounter(
                          head:
                              "  معلومات عامة  (  ${cubit.index + 1}  من ${fifthQuestionsList.length} ) "),
                  cubit.selectedGroupIndex != 1
                      ? const SizedBox.shrink()
                      : customDepartmentWidget(
                          context.width, context.height, cubit,
                          itemsList: fifthQuestionsList),
                  cubit.isFinishedAnswered && cubit.selectedGroupIndex == 1
                      ? Expanded(
                          child: CustomButton(
                              onPressed: () => cubit.nextQuestionsOne(),
                              title: "الانتقال الي القسم التالي",
                              color: kButtonGreenDark),
                        )
                      : const SizedBox.shrink(),

                  /// TODO ::: DEPARTMENT 3
                  cubit.selectedGroupIndex != 2
                      ? const SizedBox.shrink()
                      : DepartmentCounter(
                          head:
                              "  معلومات عامة  (  ${cubit.index + 1}  من ${forthQuestionsList.length} ) "),
                  cubit.selectedGroupIndex != 2
                      ? const SizedBox.shrink()
                      : customDepartmentWidget(
                          context.width, context.height, cubit,
                          itemsList: forthQuestionsList),
                  cubit.isFinishedAnswered && cubit.selectedGroupIndex == 2
                      ? Expanded(
                          child: CustomButton(
                              onPressed: () => cubit.nextQuestionsOne(),
                              title: "الانتقال الي القسم التالي",
                              color: kButtonGreenDark),
                        )
                      : const SizedBox.shrink(),

                  /// TODO ::: DEPARTMENT 4
                  cubit.selectedGroupIndex != 3
                      ? const SizedBox.shrink()
                      : DepartmentCounter(
                          head:
                              "  معلومات عامة  (  ${cubit.index + 1}  من ${thirdQuestionsList.length} ) "),
                  cubit.selectedGroupIndex != 3
                      ? const SizedBox.shrink()
                      : customDepartmentWidget(
                          context.width, context.height, cubit,
                          itemsList: thirdQuestionsList),
                  cubit.isFinishedAnswered && cubit.selectedGroupIndex == 3
                      ? Expanded(
                          child: CustomButton(
                              onPressed: () {
                                navigateTo(
                                    context,
                                    SuccessView(
                                      title1:
                                          "لقد تم إنتهاء إختبار OASES بنجاح",
                                      title2: "إنتقال إلي إختبار SSRS",
                                      onTap: () {
                                        navigateTo(context,
                                            const SecondStageSSRSTreatmentScreen());
                                      },
                                    ));
                              },
                              title: " التالي",
                              color: kButtonGreenDark),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget customDepartmentWidget(
      double width, double height, SecondStageOasesTestCubit cubit,
      {required List<CheckBoxItem> itemsList}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: context.width * 0.9,
      height: context.height * 0.2,
      decoration: BoxDecoration(
          color: kSkyLightColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: itemsList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return FormBuilder(
                    onChanged: () {
                      // _formKey.currentState!.save();
                      // debugPrint(_formKey.currentState!.value.toString());
                    },
                    autovalidateMode: AutovalidateMode.disabled,
                    child: i != cubit.index
                        ? const SizedBox.shrink()
                        : FormBuilderRadioGroup<dynamic>(
                            wrapAlignment: WrapAlignment.spaceEvenly,

                            decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                  color: kBlackText,
                                  fontSize: 18,
                                  fontFamily: 'DinBold'),
                              // labelText: itemsList[
                              //         cubit.index]
                              //     .name,
                              label: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: context.width * 0.08,
                                        height: context.height * 0.05,
                                        decoration: BoxDecoration(
                                          color: kTextColor,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: customText3(
                                              title: "${cubit.totalCounter}",
                                              color: kBlackText),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Expanded(
                                        child: customText2(
                                            title:
                                                "${itemsList[cubit.index].name}",
                                            color: kBlackText),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                            initialValue: "",
                            name: 'best_language',
                            onChanged: (value) {
                              setState(() {
                                cubit.totalCounter++;
                                itemsList[cubit.index].selectedValue = value;
                              });
                              List<String> selectedValues = [];
                              for (var element in itemsList) {
                                selectedValues.add(element.selectedValue!);
                              }
                              if (!selectedValues.contains("")) {
                                cubit.isFinishedAnswered = true;
                              }
                              print(value);

                              if (cubit.index < itemsList.length - 1) {
                                setState(() {
                                  cubit.index++;
                                });
                              }
                            },
                            // validator: qValidator([
                            //   IsRequired(""),
                            // ]),
                            options: itemsList[cubit.index]
                                .answersList!
                                .map((lang) => FormBuilderFieldOption(
                                      value: lang["value"],
                                      child: customText3(
                                          title: lang["name"],
                                          color: kBlackText),
                                    ))
                                .toList(growable: false),
                            controlAffinity: ControlAffinity.trailing,
                          ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallButtonOases(
                onPressed: () {
                  if (cubit.index > 0) {
                    setState(() {
                      cubit.index--;
                    });
                  }
                },
                title: "السابق",
                color: cubit.index == 0
                    ? kPrimaryColor.withOpacity(0.4)
                    : kPrimaryColor,
              ),
              SmallButtonOases(
                  onPressed: () {
                    if (cubit.index < itemsList.length - 1) {
                      setState(() {
                        cubit.index++;

                        print(cubit.totalCounter);
                      });
                    }
                  },
                  title: "التالي",
                  color: cubit.index == itemsList.length - 1
                      ? kPrimaryColor.withOpacity(0.1)
                      : kPrimaryColor),
            ],
          ),
        ],
      ),
    );
  }
}
