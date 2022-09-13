import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

TextStyle _textStyle = const TextStyle(
    color: kPrimaryColor,
    fontFamily: "DinMedium",
    fontSize: 15,
    fontWeight: FontWeight.w800);
dynamic openImagePicker(
    {BuildContext? context, dynamic onGalleryTapped, dynamic onCameraTapped}) {
  showCupertinoModalPopup(
      context: context!,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoButton(
            child: Text(
              "cancel",
              style: _textStyle,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            CupertinoButton(
                child: Row(
                  children: <Widget>[
                    const Icon(
                      CupertinoIcons.photo_camera_solid,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "camera",
                      style: _textStyle,
                    ),
                  ],
                ),
                onPressed: onCameraTapped),
            CupertinoButton(
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.insert_photo,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "gallery",
                      style: _textStyle,
                    ),
                  ],
                ),
                onPressed: onGalleryTapped),
          ],
        );
      });
}
