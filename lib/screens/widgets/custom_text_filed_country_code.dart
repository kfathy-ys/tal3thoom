// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class CustomTextFieldPhoneCode extends StatefulWidget {
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
  const CustomTextFieldPhoneCode({
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
  _CustomTextFieldPhoneCodeState createState() =>
      _CustomTextFieldPhoneCodeState();
}

class _CustomTextFieldPhoneCodeState extends State<CustomTextFieldPhoneCode> {
  bool _isHidden = true;
  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        // height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width / 3,
        child: TextFormField(
          onTap: widget.onTap,
          validator: widget.validator,
          controller: widget.controller,
          cursorColor: kPrimaryColor,
          focusNode: widget.focus,
          readOnly: widget.read,
          maxLines: widget.line == true ? 7 : 1,
          obscureText: widget.icon == Icons.lock_outline ? _isHidden : false,
          keyboardType: widget.type,
          onChanged: (widget.onsave),
          inputFormatters: widget.textInputFormatter,
          style: const TextStyle(fontSize: 14, color: kPrimaryColor),
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: Icon(
              widget.dIcon,
              color: kPrimaryColor,
            ),
            //labelText: widget.label == true ? "+966" : null,
            labelText: widget.label,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            // icon: widget.isEdit == true
            //     ? const Icon(
            //   Icons.edit,
            //   color: kPrimaryColor,
            // )
            //     : null,

            labelStyle: const TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
              fontFamily: "DinReguler",
            ),
            hintStyle: const TextStyle(
                fontSize: 14, color: kTextFieldColor, fontFamily: "DinReguler"),
            suffixIcon: widget.icon == Icons.lock_outline
                ? IconButton(
                    onPressed: _visibility,
                    alignment: Alignment.center,
                    icon: _isHidden
                        ? const Icon(
                            Icons.visibility_off,
                            color: kBlackText,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: kBlackText,
                          ),
                  )
                : widget.isEdit == true
                    ? const Icon(
                        Icons.edit,
                        color: kPrimaryColor,
                      )
                    : null,
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
