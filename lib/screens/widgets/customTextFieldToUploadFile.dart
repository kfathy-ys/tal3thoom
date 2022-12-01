// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextFieldUploadFile extends StatefulWidget {
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
  const CustomTextFieldUploadFile({
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
  });
  @override
  _CustomTextFieldUploadFileState createState() =>
      _CustomTextFieldUploadFileState();
}

class _CustomTextFieldUploadFileState extends State<CustomTextFieldUploadFile> {
  final _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(horizontal: 6),
      height: MediaQuery.of(context).size.height / 18,
      width: MediaQuery.of(context).size.width / 1.9,
      child: TextFormField(
        enabled: false,
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
        style: const TextStyle(fontSize: 14, color: kPrimaryColor),
        decoration: InputDecoration(
          hintText: "تسجيل فيديو قمت بتسجيله مسبقا",
          prefixIcon: Icon(
            widget.dIcon,
            color: kPrimaryColor,
          ),
          //labelText: widget.label == true ? "+966" : null,
          labelText: widget.label,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
    );
  }
}
