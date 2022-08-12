import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:queen/queen.dart' show Launch;
import 'package:tal3thoom/config/keys.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../view.dart';

// ignore: must_be_immutable
class ContactUsScreen extends StatelessWidget {
  String phone = "+1 055 7266007";
  String email = "info@mcsc.sa";
  String web = "http://stage-lib.cpt-it.com/ar/#";
  String location =
      "https://www.google.com/maps/place/%D9%85%D8%B1%D9%83%D8%B2+%D8%AD%D9%84%D9%88%D9%84+%D8%A7%D9%84%D8%AA%D9%88%D8%A7%D8%B5%D9%84+%D9%84%D8%A3%D9%85%D8%B1%D8%A7%D8%B6+%D8%A7%D9%84%D8%B3%D9%85%D8%B9+%D9%88%D8%A7%D9%84%D8%AA%D8%AE%D8%A7%D8%B7%D8%A8%E2%80%AD/@18.2112402,42.5631605,16z/data=!4m18!1m12!4m11!1m3!2m2!1d42.5631605!2d18.2115459!1m6!1m2!1s0x15fcabc781a9df8f:0x9197b7c2096022fe!2z2YXYsdmD2LIg2K3ZhNmI2YQg2KfZhNiq2YjYp9i12YQg2YTYo9mF2LHYp9i2INin2YTYs9mF2Lkg2YjYp9mE2KrYrtin2LfYqCA2ODY4IDU0NzMgQWJoYSBTQSBBYmhhIDYyNTI3IFNhdWRpIEFyYWJpYeKArQ!2m2!1d42.5631605!2d18.2112402!3m4!1s0x15fcabc781a9df8f:0x9197b7c2096022fe!8m2!3d18.2112402!4d42.5631605";
  String twitter = "https://twitter.com/GPHLIBRARY";
  String youTube =
      "https://www.youtube.com/channel/UCfocGgF5-ngvNJQ45NqRoCQ/featured";
  ContactUsScreen({Key? key}) : super(key: key);
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: () => _scaffoldKey.currentState!.openDrawer()),
       body: Container(
         width: width,
         height: height,
         margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 18),

         child: Column(
          children: [

            CustomTileContainer(
                widthh: width * 0.5, title: KeysConfig.contactsUs, context: context),

      FadeInUp(
              child: SizedBox(
                height: height*0.3,
                  child: Image.asset("assets/images/logoHeader.png")),
            ),

            FadeInUp(
              child: GestureDetector(
                onTap: (){
                  Launch.url(location);
                },
                child: SizedBox(
                  height: height*0.3,
                    width: width*0.8,
                    child: Image.asset("assets/images/map.jpeg")),
              ),
            ),
      /*          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  InkWell(
                    onTap: () {
                      _launchPhoneURL(phone);
                    },
                    child: const Directionality(
                      textDirection:TextDirection.ltr ,
                      child: Text("966 + (0) 17 266 0007",
                          style: TextStyle(
                              color: kBlackText,
                              fontSize: 16,
                              fontFamily: 'DinLight')),
                    ),
                  ),
                  Image.asset("assets/images/TelephoneFill.png"),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [


                  InkWell(
                    onTap: () {
                      Launch.url(email);
                    },
                    child: const Text("info@mcsc.sa",
                        style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                            fontFamily: 'DinLight')),
                  ),
                  Image.asset("assets/images/TelephoneFill.png"),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Launch.url(web);
                    },
                    child: const Text("http://stage-lib.cpt-it.com",
                        style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                            fontFamily: 'DinLight')),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Image.asset("assets/images/TelephoneFill.png"),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Launch.url(location);
              },
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("6868, طريق أبو هريرة , حى المروج , 5473 , الرمز البريديى 62527 مدينة أبها.",
                      style: TextStyle(
                          color: kBlackText,
                          fontSize: 16,
                          fontFamily: 'DinLight')),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Image.asset("assets/images/TelephoneFill.png"),
                ],
              ),
            ),
            FadeInUpBig(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(KeysConfig.YouCanFollowUsSocialMedia,
                    style: const TextStyle(
                        color: kSmallIconColor,
                        fontSize: 16,
                        fontFamily: 'DinReguler')),
              ),
            ),
            Image.asset("assets/images/TelephoneFill.png"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Launch.url(youTube);
                    },
                    child: Image.asset("assets/images/TelephoneFill.png"),
                  ),

                  InkWell(
                    onTap: () {
                      Launch.url(twitter);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset("assets/images/TelephoneFill.png"),
                    ),
                  ),
                  // Image.asset("assets/image/Linkedin.png")
                ],
              ),
            )*/
          ],
      ),
       ),
    );
  }

  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    Launch.url(url);
  }
}