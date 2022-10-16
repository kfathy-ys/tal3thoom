import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

enum Opinion { yes, no }

enum AvailableType { accept, refuse }

enum MultiChoose { one, two, three, four }

class SelectorOpenion extends StatefulWidget {
  final ValueChanged<String> onChange;
  const SelectorOpenion({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  _SelectorOpenionState createState() => _SelectorOpenionState();
}

class _SelectorOpenionState extends State<SelectorOpenion> {
  Opinion? _opinion;

  AvailableType accept = AvailableType.accept;
  MultiChoose multiChoose = MultiChoose.one;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("depositScientificThesis",
                style: TextStyle(
                    color: kPrimaryColor, fontSize: 16, fontFamily: 'DinBold')),
            SizedBox(
              width: context.width * 0.2,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Radio<Opinion>(
                  value: Opinion.yes,
                  activeColor: kAccentColor,
                  groupValue: _opinion,
                  onChanged: (_) {
                    _opinion = Opinion.yes;
                    widget.onChange("firstAvailabilitySelected");
                    setState(() {});
                  },
                ),
                const Text('yes',
                    style: TextStyle(
                        color: kBlackText,
                        fontSize: 14,
                        fontFamily: 'DinBold')),
              ]),
            ),
            SizedBox(
              width: context.width * 0.2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<Opinion>(
                    value: Opinion.no,
                    activeColor: kAccentColor,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => kAccentColor),
                    groupValue: _opinion,
                    onChanged: (_) {
                      setState(() {
                        widget.onChange("noOption");
                        _opinion = Opinion.no;
                        accept = AvailableType.accept;
                      });
                    },
                  ),
                  const Text('no',
                      style: TextStyle(
                          color: kBlackText,
                          fontSize: 14,
                          fontFamily: 'DinBold')),
                ],
              ),
            ),
          ],
        ),
        // Image.asset("assets/image/bigLine.png"),

        if (_opinion == Opinion.no)
          const ListTile(
            horizontalTitleGap: 1,
            title: Text('noOpen',
                style: TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
          ),

        if (_opinion == Opinion.yes) ...[
          const Text("availabilityType",
              style: TextStyle(
                  color: kPrimaryColor, fontSize: 16, fontFamily: 'DinBold')),
          ListTile(
            horizontalTitleGap: 1,
            title: const Text('oneOk',
                style: TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<AvailableType>(
              value: AvailableType.accept,
              activeColor: kAccentColor,
              groupValue: accept,
              onChanged: (_) {
                setState(() {
                  widget.onChange("firstAvailabilitySelected");
                  accept = AvailableType.accept;
                });
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 1,
            title: const Text('twoOk',
                style: TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<AvailableType>(
              value: AvailableType.refuse,
              activeColor: kAccentColor,
              groupValue: accept,
              onChanged: (_) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithFirstOption");
                  accept = AvailableType.refuse;
                });
              },
            ),
          ),
        ],

        if (accept == AvailableType.refuse) ...[
          ListTile(
            horizontalTitleGap: 1,
            title: const Text('ableAddressPlus',
                style: TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<MultiChoose>(
              value: MultiChoose.one,
              activeColor: kAccentColor,
              groupValue: multiChoose,
              onChanged: (MultiChoose? value) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithFirstOption");
                  multiChoose = MultiChoose.one;
                });
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 1,
            title: const Text('ableFour',
                style: TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<MultiChoose>(
              value: MultiChoose.two,
              activeColor: kAccentColor,
              groupValue: multiChoose,
              onChanged: (MultiChoose? value) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithSecondOption");

                  multiChoose = MultiChoose.two;
                });
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 1,
            title: const Text('ableFive',
                style: TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<MultiChoose>(
              value: MultiChoose.three,
              activeColor: kAccentColor,
              groupValue: multiChoose,
              onChanged: (MultiChoose? value) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithThirdOption");

                  multiChoose = MultiChoose.three;
                });
              },
            ),
          ),
          ListTile(
            horizontalTitleGap: 1,
            title: const Text('ableSix',
                style: TextStyle(
                    color: kBlackText, fontSize: 14, fontFamily: 'DinReguler')),
            leading: Radio<MultiChoose>(
              value: MultiChoose.four,
              activeColor: kAccentColor,
              groupValue: multiChoose,
              onChanged: (MultiChoose? value) {
                setState(() {
                  widget.onChange("secondAvailabilitySelectedWithFourthOption");

                  multiChoose = MultiChoose.four;
                });
              },
            ),
          ),
        ],
        SizedBox(
          height: context.height * 0.02,
        ),
      ],
    );
  }
}
