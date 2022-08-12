import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/drop_down_spcialist.dart';
import 'package:tal3thoom/screens/payment/view.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:tal3thoom/screens/widgets/smallButtonSizer.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/fast_widget.dart';
import '../../../../view.dart';



// ignore: must_be_immutable
class SpecializerProfile extends StatelessWidget {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  SpecializerProfile({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width ,

          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTileContainer(
                  widthh: width * 0.6,
                  title:"الملف الشخصي للمختص" ,
                  context: context),


              Container(
                color: kRoundBorderColor,
                height: height*0.12,
                width: width*0.8,
                child: Center(
                  child:
                  Image.asset("assets/images/avater2.png"),
                ),
              ),

              Container(
                color: kAppBarColor,
                height: height*0.3,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: width*0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildProfileItem(title:  "الأسم : " ,subtitle: "Mohamed Rashad"),
                    buildProfileItem(title:  "البريد الإلكتروني : " ,subtitle: ""),
                    buildProfileItem(title:  "سنوات الخبرة : " ,subtitle: ""),
                    buildProfileItem(title:  "التعليم : " ,subtitle: ""),
                    buildProfileItem(title:  "الوظيفة : " ,subtitle: ""),
                    buildProfileItem(title:  "تاريخ الميلاد : " ,subtitle: ""),
                  ]

                )
              ),
              Container(
                color: kAppBarColor,
                height: height*0.4,
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: width*0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildProfileItem(title:  "العنوان : " ,subtitle: ""),
                    buildProfileItem(title:  "جهة العمل : " ,subtitle: ""),
                    buildProfileItem(title:  "السيرة الذاتية : " ,subtitle: ""),
                    buildProfileItem(title:  "الجنسية : " ,subtitle: ""),
                    buildProfileItem(title:  "الجنس : " ,subtitle: ""),
                    buildProfileItem(title:  "رقم الهوية : " ,subtitle: ""),
                    buildProfileItem(title:  "سعر جلسة مستشارك : " ,subtitle: ""),
                  ]

                )
              ),





            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileItem({required String title , required String subtitle}) {
    return Row(

                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText10(title:title, color: kTextFieldColor),
                      customText10(title: subtitle, color: kPrimaryColor)
                    ],

                  );
  }

  SizedBox buildSizedBox(double height) => SizedBox(
    height: height * 0.05,
  );
}
