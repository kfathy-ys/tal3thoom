// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class CustomTextFieldSizer extends StatefulWidget {
  final String? titleTextField;
  final String? hint;
  final String? label;
  final TextInputType? type;
  final ValueChanged<String>? onsave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final IconData? icon;
  final IconData? eIcon;
  final IconData? dIcon;
  final FocusNode? focus;
  final bool read;
  final bool? line;
  final Function? edit;
  final bool? isEdit;
  // ignore: use_key_in_widget_constructors
  const CustomTextFieldSizer({
    this.hint,
    this.onsave,
    this.onTap,
    this.icon,
    this.type,
    this.validator,
    this.controller,
    this.focus,
    this.dIcon,
    this.label,
    this.read = false,
    this.eIcon,
    this.edit,
    this.isEdit,
    this.line,
    this.titleTextField,
  });
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldSizer> {
  bool _isHidden = true;
  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 6),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text(
            //   widget.titleTextField!,
            //   style: const TextStyle(
            //       color: kBlackText, fontSize: 16, fontFamily: 'DinLight'),
            // ),
            Container(
              height: context.height * 0.085,
              width: context.width * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextFormField(
                onTap: widget.onTap,
                validator: widget.validator,
                controller: widget.controller,
                cursorColor: kPrimaryColor,
                focusNode: widget.focus,
                readOnly: widget.read,
                maxLines: widget.line == true ? 7 : 1,
                obscureText:
                    widget.icon == Icons.lock_outline ? _isHidden : false,
                keyboardType: widget.type,
                onChanged: (widget.onsave),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: kPrimaryColor),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  // prefixIcon: Icon(
                  //   widget.dIcon,
                  //   color: kPrimaryColor,
                  // ),
                  //labelText: widget.label == true ? "+966" : null,
                  labelText: widget.label,

                  icon: widget.isEdit == true
                      ? const Icon(
                          Icons.edit,
                        )
                      : null,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontFamily: "DinReguler",
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),

                  hintStyle: const TextStyle(
                      fontSize: 14,
                      color: kTextFieldColor,
                      fontFamily: "DinReguler"),
                  suffixIcon: widget.icon == Icons.lock_outline
                      ? IconButton(
                          onPressed: _visibility,
                          alignment: Alignment.center,
                          icon: _isHidden
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: kTextFieldColor,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: kTextFieldColor,
                                ),
                        )
                      : null,
                  filled: true,
                  //prefixText: widget.hint,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Image.asset("assets/images/arrowleft.png"),
          ],
        ),
      ],
    );
  }
}
