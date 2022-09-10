import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

customCachedNetworkImage({
  required String? url,
  required BuildContext context,
  required BoxFit fit,
  required String title,
}) {
  double width = MediaQuery.of(context).size.width;
  if (url == null || url.isEmpty) {
    return SizedBox(
      child: Image.asset(
        'assets/image/logo2021.jpg',
        height: 100,
        width: context.width,
        fit: BoxFit.contain,
      ),
    );
  } else {
    return Container(
        color: Colors.pinkAccent,
        width: context.width,
        child: CachedNetworkImage(
            imageUrl: url,
            fit: fit,
            placeholder: (_, __) => const Center(
                  child: SpinKitChasingDots(
                    color: kPrimaryColor,
                    size: 20,
                  ),
                ),
            errorWidget: (context, url, error) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  Image.asset(
                    'assets/image/logo2021.jpg',
                    height: 100,
                    width: context.width,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    title,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: headingStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#323232")),
                  )
                ],
              );
            }));
  }
}

customCachedNetworkImageWitoutTitle({
  required String? url,
  required BuildContext context,
  required BoxFit fit,
}) {
  if (url == null || url.isEmpty) {
    return SizedBox(
      child: Image.asset(
        'assets/image/logo2021.jpg',
        height: 100,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.contain,
      ),
    );
  } else {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: (Uri.parse(url).isAbsolute)
          ? CachedNetworkImage(
              imageUrl: url,
              fit: fit,
              placeholder: (_, __) => const Center(
                      child: SpinKitChasingDots(
                    color: kPrimaryColor,
                    size: 15,
                  )),
              errorWidget: (context, url, error) {
                return Image.asset(
                  'assets/image/logo2021.jpg',
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                );
              })
          : Image.asset(
              'assets/image/logo2021.jpg',
              height: 100,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
    );
  }
}
