import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostci_oases_test/cubit/oases_test_cubit.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/question.dart';
import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/success_page.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';
import 'package:tal3thoom/screens/widgets/smallestButton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../view.dart';
import '../ssrs_test/view.dart';

class DiagnosticOasesTest extends StatefulWidget {
  const DiagnosticOasesTest({Key? key}) : super(key: key);

  @override
  State<DiagnosticOasesTest> createState() => _DiagnosticOasesTestState();
}

class _DiagnosticOasesTestState extends State<DiagnosticOasesTest> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<OasesTestCubit, OasesTestState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<OasesTestCubit>(context);
        return Scaffold(
          key: cubit.scaffoldKey,
          backgroundColor: kHomeColor,
          drawer: MenuItems(),
          appBar: DynamicAppbar(
              context: context,
              press: () => cubit.scaffoldKey.currentState!.openDrawer()),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              height: height,
              width: width,
              color: kHomeColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTileContainer(
                      widthh: width / 2,
                      title: "إختبار OASES",
                      context: context),
                  customText6(
                    title: "الإختبار التاني OASES (قياس التجارب الكامله)",
                    color: kBlackText,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image.asset("assets/images/second_test.png"),
                  ),
                  departmentCard(height,
                      title: "1- قباس المعلومات العامة في حياتك",
                      isSelected: cubit.selectedGroupIndex == 0),
                  departmentCard(height,
                      title: "2- قباس رد فعلك بالنسبة لاضطراب التلعثم",
                      isSelected: cubit.selectedGroupIndex == 1),
                  departmentCard(height,
                      title: "3- قباس التواصل مع المواقف اليومية",
                      isSelected: cubit.selectedGroupIndex == 2),
                  departmentCard(height,
                      title: "4- قباس جودة الحياة",
                      isSelected: cubit.selectedGroupIndex == 3),
                  /// TODO ::: DEPARTMENT 1
                  cubit.selectedGroupIndex != 0
                      ? const SizedBox.shrink()
                      : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: counterDepartment(width, height,
                            head:
                                "  معلومات عامة  (  ${cubit.index + 1}  من ${sixQuestionsList.length} ) "),
                      ),
                  cubit.selectedGroupIndex != 0
                      ? const SizedBox.shrink()
                      : customDepartmentWidget(width, height, cubit,itemsList: sixQuestionsList),
                  cubit.isFinishedAnswered && cubit.selectedGroupIndex == 0
                      ? Expanded(
                          child: CustomButton(
                              onPressed: () {
                                setState(() {
                                  cubit.index = 0;
                                  cubit.selectedGroupIndex++;
                                  cubit.isFinishedAnswered = false;
                                });
                              },
                              title: "الانتقال الي القسم التالي",
                              color: kButtonGreenDark),
                        )
                      : const SizedBox.shrink(),


                  /// TODO ::: DEPARTMENT 2

                  cubit.selectedGroupIndex != 1
                      ? const SizedBox.shrink()
                      : counterDepartment(width, height,
                          head:
                              "  معلومات عامة  (  ${cubit.index + 1}  من ${fifthQuestionsList.length} ) "),
                  cubit.selectedGroupIndex != 1
                      ? const SizedBox.shrink()
                      : customDepartmentWidget(width, height, cubit,itemsList: fifthQuestionsList),
                  cubit.isFinishedAnswered && cubit.selectedGroupIndex == 1
                      ? Expanded(
                          child: CustomButton(
                              onPressed: () {
                                setState(() {
                                  cubit.index = 0;
                                  cubit.selectedGroupIndex++;
                                  cubit.isFinishedAnswered = false;
                                });
                              },
                              title: "الانتقال الي القسم التالي",
                              color: kButtonGreenDark),
                        )
                      : const SizedBox.shrink(),

                  /// TODO ::: DEPARTMENT 3
                  cubit.selectedGroupIndex != 2
                      ? const SizedBox.shrink()
                      : counterDepartment(width, height,
                      head:
                      "  معلومات عامة  (  ${cubit.index + 1}  من ${forthQuestionsList.length} ) "),
                  cubit.selectedGroupIndex != 2
                      ? const SizedBox.shrink()
                      : customDepartmentWidget(width, height, cubit,itemsList: forthQuestionsList),
                  cubit.isFinishedAnswered && cubit.selectedGroupIndex == 2
                      ? Expanded(
                    child: CustomButton(
                        onPressed: () {
                          setState(() {
                            cubit.index = 0;
                            cubit.selectedGroupIndex++;
                            cubit.isFinishedAnswered = false;
                          });
                        },
                        title: "الانتقال الي القسم التالي",
                        color: kButtonGreenDark),
                  )
                      : const SizedBox.shrink(),



                  /// TODO ::: DEPARTMENT 4
                  cubit.selectedGroupIndex != 3
                      ? const SizedBox.shrink()
                      : counterDepartment(width, height,
                      head:
                      "  معلومات عامة  (  ${cubit.index + 1}  من ${thirdQuestionsList.length} ) "),
                  cubit.selectedGroupIndex != 3
                      ? const SizedBox.shrink()
                      : customDepartmentWidget(width, height, cubit,itemsList: thirdQuestionsList),
                  cubit.isFinishedAnswered && cubit.selectedGroupIndex == 3
                      ? Expanded(
                    child: CustomButton(
                        onPressed: () {
                          navigateTo(context, SuccessView(title1: "لقد تم إنتهاء إختبار OASES بنجاح",title2: "إنتقال إلي إختبار SSRS",
                            onTap: ()=>navigateTo(context, SSRSDiagnosticsScreen()),));                        },
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

  Widget customDepartmentWidget(double width, double height, OasesTestCubit cubit ,{required List<CheckBoxItem> itemsList}) {
    return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: width * 0.9,
                        height: height * 0.2,
                        decoration: BoxDecoration(
                            color: kSkyLightColor,
                            borderRadius: BorderRadius.circular(8)),
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
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
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
                                  width: width*0.08,
                                  height: height*0.05,
                                  decoration: BoxDecoration(color: kTextColor,

                                     borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: customText3(title: "${cubit.totalCounter}", color: kBlackText),
                                  ),
                                ),
                                                          const SizedBox(width: 6,),
                                                          Expanded(
                                                            child: customText2(title: "${ itemsList[
                                                            cubit.index].name}"
                                                               , color: kBlackText),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(height: 12,),

                                                    ],
                                                  ) ,
                                              ),
                                              initialValue: "",
                                              name: 'best_language',
                                              onChanged: (value) {
                                                setState(() {
                                                  cubit.totalCounter ++;
                                                  itemsList[
                                                          cubit.index]
                                                      .selectedValue = value;
                                                });
                                                List<String> selectedValues =
                                                    [];
                                                for (var element in itemsList) {
                                                  selectedValues.add(
                                                      element.selectedValue!);
                                                }
                                                if (!selectedValues
                                                    .contains("")) {
                                                  cubit.isFinishedAnswered =
                                                      true;
                                                }
                                                print(value);

                                                if (cubit.index <
                                                    itemsList.length -
                                                        1) {
                                                  setState(() {
                                                    cubit.index++;
                                                  });
                                                }
                                              },
                                              // validator: qValidator([
                                              //   IsRequired(""),
                                              // ]),
                                              options: itemsList[
                                                      cubit.index]
                                                  .answersList!
                                                  .map((lang) =>
                                                      FormBuilderFieldOption(
                                                        value: lang["value"],
                                                        child: customText3(
                                                            title:
                                                                lang["name"],
                                                            color:
                                                                kBlackText),
                                                      ))
                                                  .toList(growable: false),
                                              controlAffinity:
                                                  ControlAffinity.trailing,
                                            ),
                                    );
                                  }),
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
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
                                      if (cubit.index <
                                          itemsList.length - 1) {
                                        setState(() {
                                          cubit.index++;

                                          print(cubit.totalCounter);

                                        });
                                      }
                                    },
                                    title: "التالي",
                                    color: cubit.index ==
                                            itemsList.length - 1
                                        ? kPrimaryColor.withOpacity(0.1)
                                        : kPrimaryColor),
                              ],
                            ),
                          ],
                        ),
                      );
  }

  Widget counterDepartment(
    double width,
    double height, {
    required String head,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            customText9(title: "القسم: \t ", color: kPrimaryColor),
            customText9(title: head, color: kBlackText),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          color: kBlackText,
          width: width * 0.6,
          height: height * 0.002,
        ),
      ],
    );
  }

  Widget departmentCard(double height,
      {required String title, bool? isSelected}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: height * 0.079,
      decoration: BoxDecoration(
        color: isSelected! ? kPrimaryColor : kPrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: customText8(title: title, color: kHomeColor),
      ),
    );
  }
}
