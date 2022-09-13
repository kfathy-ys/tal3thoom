import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/smallestButton.dart';
import '../../question.dart';
import '../cubit/oases_test_cubit.dart';

class CustomWidgetDepartment extends StatefulWidget {
  final OasesTestCubit cubit;
  final List<CheckBoxItem> itemsList;
  const CustomWidgetDepartment(
      {Key? key, required this.cubit, required this.itemsList})
      : super(key: key);

  @override
  State<CustomWidgetDepartment> createState() => _CustomWidgetDepartmentState();
}

class _CustomWidgetDepartmentState extends State<CustomWidgetDepartment> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
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
                itemCount: widget.itemsList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return FormBuilder(
                    onChanged: () {
                      // _formKey.currentState!.save();
                      // debugPrint(_formKey.currentState!.value.toString());
                    },
                    autovalidateMode: AutovalidateMode.disabled,
                    child: i != widget.cubit.index
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
                                              title:
                                                  "${widget.cubit.totalCounter}",
                                              color: kBlackText),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Expanded(
                                        child: customText2(
                                            title:
                                                "${widget.itemsList[widget.cubit.index].name}",
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
                                widget.cubit.totalCounter++;
                                widget.itemsList[widget.cubit.index]
                                    .selectedValue = value;
                              });
                              List<String> selectedValues = [];
                              for (var element in widget.itemsList) {
                                selectedValues.add(element.selectedValue!);
                              }
                              if (!selectedValues.contains("")) {
                                widget.cubit.isFinishedAnswered = true;
                              }
                              print(value);

                              if (widget.cubit.index <
                                  widget.itemsList.length - 1) {
                                setState(() {
                                  widget.cubit.index++;
                                });
                              }
                            },
                            // validator: qValidator([
                            //   IsRequired(""),
                            // ]),
                            options: widget
                                .itemsList[widget.cubit.index].answersList!
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
                  if (widget.cubit.index > 0) {
                    setState(() {
                      widget.cubit.index--;
                    });
                  }
                },
                title: "السابق",
                color: widget.cubit.index == 0
                    ? kPrimaryColor.withOpacity(0.4)
                    : kPrimaryColor,
              ),
              SmallButtonOases(
                  onPressed: () {
                    if (widget.cubit.index < widget.itemsList.length - 1) {
                      setState(() {
                        widget.cubit.index++;

                        print(widget.cubit.totalCounter);
                      });
                    }
                  },
                  title: "التالي",
                  color: widget.cubit.index == widget.itemsList.length - 1
                      ? kPrimaryColor.withOpacity(0.1)
                      : kPrimaryColor),
            ],
          ),
        ],
      ),
    );
  }
}
