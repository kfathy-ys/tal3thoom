import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:queen/core/helpers/url_luncher.dart';
import 'package:tal3thoom/config/keys.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../view.dart';

// ignore: must_be_immutable
class ContactUsScreen extends StatelessWidget {
  String phone = "966+ (0) 17 266 0007";

  String whatsApp = "+1 055 7266007";
  String email = "info@mcsc.sa";
  String web = "http://stage-lib.cpt-it.com/ar/#";
  String location =
      "https://www.google.com/maps/place/%D9%85%D8%B1%D9%83%D8%B2+%D8%AD%D9%84%D9%88%D9%84+%D8%A7%D9%84%D8%AA%D9%88%D8%A7%D8%B5%D9%84+%D9%84%D8%A3%D9%85%D8%B1%D8%A7%D8%B6+%D8%A7%D9%84%D8%B3%D9%85%D8%B9+%D9%88%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8%E2%80%AD/@18.2112402,42.5631605,16z/data=!4m18!1m12!4m11!1m3!2m2!1d42.5631605!2d18.2115459!1m6!1m2!1s0x15fcabc781a9df8f:0x9197b7c2096022fe!2z2YXYsdmD2LIg2K3ZhNmI2YQg2KfZhNiq2YjYp9i12YQg2YTYo9mF2LHYp9i2INin2YTYs9mF2Lkg2YjYp9mE2KrYrtin2LfYqCA2ODY4IDU0NzMgQWJoYSBTQSBBYmhhIDYyNTI3IFNhdWRpIEFyYWJpYeKArQ!2m2!1d42.5631605!2d18.2112402!3m4!1s0x15fcabc781a9df8f:0x9197b7c2096022fe!8m2!3d18.2112402!4d42.5631605";
  String twitter = "https://twitter.com/GPHLIBRARY";
  String youTube =
      "https://www.youtube.com/channel/UCfocGgF5-ngvNJQ45NqRoCQ/featured";

  ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Container(
        width: context.width,
        height: context.height,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomTileContainer(
                    widthh: context.width * 0.5,
                    title: KeysConfig.contactsUs,
                    context: context),
              ),
              FadeInUp(
                child: SizedBox(
                    height: context.height * 0.15,
                    child: InkWell(
                        onTap: () {
                          Launch.url(web);
                        },
                        child: Image.asset("assets/images/logoHeader.png"))),
              ),
              FadeInLeftBig(
                child: const Divider(
                  color: kBlackText,
                ),
              ),
              FadeInLeft(
                child: InkWell(
                  onTap: () {
                    // Launch.url(email);

                    _launchURL();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset("assets/images/email_new.png"),
                  ),
                ),
              ),
              FadeInLeft(
                child: InkWell(
                    onTap: () {
                      _launchPhoneURL(phone);
                    },
                    child: Image.asset("assets/images/phone_new.png")),
              ),
              FadeInLeft(
                child: InkWell(
                  onTap: () {
                    // Launch.url(phone);

                    _urlWhatApp();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset("assets/images/whatsapp_new.png"),
                  ),
                ),
              ),
              FadeInRightBig(
                child: InkWell(
                  onTap: () {
                    Launch.url(location);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset("assets/images/location_new.png"),
                  ),
                ),
              ),
              FadeInUpBig(
                child: GestureDetector(
                  onTap: () {
                    Launch.url(location);
                  },
                  child: SizedBox(
                      height: context.height * 0.3,
                      width: context.width * 0.8,
                      child: Image.asset("assets/images/map.jpeg")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    final Uri params = Uri(
      // scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    Launch.url(url);
  }

  String _urlWhatApp() {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/$whatsApp/?text=${Uri.parse(whatsApp)}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=$whatsApp=${Uri.parse(whatsApp)}"; // new line
    }
  }
}
