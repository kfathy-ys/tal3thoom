import 'package:tal3thoom/screens/drawer/page/diagnostic_service/page/views/diagnostic_history/models/diagnostic_history_question_model.dart';

import 'package:tal3thoom/screens/widgets/smallestButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../widgets/appBar.dart';
import '../../../../../../widgets/constants.dart';
import '../../../../../../widgets/customButton.dart';
import '../../../../../view.dart';
import 'mixin.dart';
import 'views/department_card.dart';
import 'views/department_counter.dart';

class DiagnosticOasesTest extends StatefulWidget {
  const DiagnosticOasesTest({Key? key}) : super(key: key);

  @override
  State<DiagnosticOasesTest> createState() => _DiagnosticOasesTestState();
}

class _DiagnosticOasesTestState extends State<DiagnosticOasesTest> with QMixer {
  @override
  void initState() {
    selectedSection = sections.first;
    for (final s in sections) {
      questionsBySection[s] = [];
    }
    loadQFromApi();
    super.initState();
  }

  List<Widget> _buildForSections() => sections
      .map(
        (e) => DepartmentCard(title: e.title, isSelected: selectedSection == e),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
  // isSubmiting = false ;
   return Scaffold(
      bottomNavigationBar: canSubmit? SmallButtonOases(
        onPressed:submit,
       // isLoading: isSubmiting,
        title: "التالي",
        color: kButtonGreenDark ,
      ):SizedBox.shrink(),
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

          width: context.width,
          color: kHomeColor,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.asset("assets/images/second_test.png"),
              ),
              ..._buildForSections(),
              if (hasSelectedQuestion) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: DepartmentCounter(head: paginatorTitle),
                ),
                customDepartmentWidget(selectedQuestion!),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget customDepartmentWidget(Question question) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      decoration: BoxDecoration(
          color: kSkyLightColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: context.width * 0.08,
                height: context.height * 0.05,
                decoration: BoxDecoration(
                  color: kTextColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: customText3(title: currentQNumber.toString(), color: kBlackText),
                ),
              ),
              Expanded(
                  child: customText2(
                      title: question.description, color: kBlackText)),
            ],
          ),
          Wrap(
            children:  question.answers.map((a) {
              return RadioListTile(
                value: a,
                title:customText4(
                    title: a.answerOption, color: kBlackText) ,
                groupValue: allAnswers[question],
                onChanged: (_) {
                  setState(() {
                    answerSelectedQ(a);
                  });
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallButtonOases(
                onPressed:enablePreviousButton  ?selectPreviousQuestion: null ,
               title:"السابق",
                color: enablePreviousButton ?   kPrimaryColor : kPrimaryColor.withOpacity(0.4),
              ),
              SmallButtonOases(
                  onPressed: enableNextQButton ? selectNextQuestion : null,
                  title: "التالي",
                  color: enableNextQButton ? kPrimaryColor : kPrimaryColor.withOpacity(0.4),),
            ],
          ),
if(!canSubmit)
  CustomButton(
            onPressed:enableNextSectionButton? selectNextSection: null,
            title: "الانتقال الي القسم التالي",
            color: enableNextSectionButton ? kButtonGreenDark : kPrimaryColor.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
