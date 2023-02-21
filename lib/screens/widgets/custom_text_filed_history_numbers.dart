// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class CustomTextFieldHistory extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextInputType? type;
  final List<TextInputFormatter>? textInputFormatter;
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
  const CustomTextFieldHistory({
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
    this.textInputFormatter,
  });
  @override
  _CustomTextFieldHistoryState createState() => _CustomTextFieldHistoryState();
}

class _CustomTextFieldHistoryState extends State<CustomTextFieldHistory> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(


      width: MediaQuery.of(context).size.width/2.2,
      child: FocusScope(
        child: TextFormField(
          onTap: widget.onTap,
          validator: widget.validator,
          controller: widget.controller,
          cursorColor: kPrimaryColor,
          focusNode: widget.focus,
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
            // Jump to another field here
          },
          readOnly: widget.read,
          maxLines: widget.line == true ? 7 : 1,
          keyboardType: widget.type,
          onChanged: (widget.onsave),
          inputFormatters: widget.textInputFormatter,
          style: const TextStyle(fontSize: 14, color: kPrimaryColor),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            hintText: widget.hint,

            labelText: widget.label,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),


            labelStyle: const TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
              fontFamily: "DinReguler",
            ),
            hintStyle: const TextStyle(
                fontSize: 14, color: kTextFieldColor, fontFamily: "DinReguler"),

            filled: true,

            //prefixText: widget.hint,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
