import 'package:tal3thoom/screens/widgets/loading.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

// ignore: unnecessary_question_mark
Widget profilePicContainer(BuildContext context, dynamic img, String? name,
    String mobile, dynamic onProfilePicTapped, bool loading) {
  return Container(
    width: MediaQuery.of(context).size.width,
//    height: 250,
    decoration: const BoxDecoration(
        //color: kSafeAreasColor,
        //     borderRadius: const BorderRadius.only(
        //
        //         bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        ),
    child: loading
        ? LoadingSmall()
        : InkWell(
            onTap: onProfilePicTapped,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor),
                  shape: BoxShape.circle,
                  image: img is String
                      ? DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(img))
                      : DecorationImage(
                          fit: BoxFit.cover, image: FileImage(img!))),
            ),
          ),
  );
}
