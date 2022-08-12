import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/custom_container.dart';
import 'package:tal3thoom/screens/drawer/page/advisors_service/views/Reservation_appointment/page/drop_down_spcialist.dart';
import 'package:tal3thoom/screens/payment/view.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:tal3thoom/screens/widgets/smallButtonSizer.dart';
import '../../../../../widgets/appBar.dart';
import '../../../../../widgets/constants.dart';
import '../../../../../widgets/fast_widget.dart';
import '../../../../view.dart';
import '../advisor_payment/view.dart';
import '../spcializer_profile/view.dart';
import 'page/drop_down_available_date.dart';
import 'page/drop_down_duration.dart';

// ignore: must_be_immutable
class ReservationAppointmentScreen extends StatelessWidget {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  ReservationAppointmentScreen({Key? key}) : super(key: key);

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
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTileContainer(
                  widthh: width * 0.5, title: "حجز المواعيد", context: context),
              headTitles(headTitle: " 1- من فضلك قم بأختيار الأخصائي :"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DropDownSpecialist(),
                  SmallButtonSizer(
                      onPressed: () {
                        navigateTo(context, SpecializerProfile());
                      },
                      title: "الملف الشخصي",
                      color: kPrimaryColor,
                      image: "assets/images/eye1.png"),
                ],
              ),
              headTitles(headTitle: "2- أكثر مدة للجلسة :"),
              const DropDownDurations(),
              headTitles(headTitle: "3- أحتر التاريخ المتاح :"),
              const DropDownAvailableDates(),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 8,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      height: height * 0.33,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          cardItems(title: "المتخصص", subTitle: "المتخصص"),
                          cardItems(
                              title: "تاريخ الجلسة", subTitle: "10-12-2022"),
                          cardItems(title: "وقت البداية", subTitle: "10:00"),
                          cardItems(title: "وقت النهاية", subTitle: "10:16"),
                          MediaButton(
                            onPressed: () {
                              navigateTo(context, PaymentAdvisor());
                            },
                            color: kButtonGreenDark,
                            title: "حجز جلسة",
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headTitles({required String headTitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
          alignment: Alignment.topRight,
          child: customText10(title: headTitle, color: kBlackText)),
    );
  }

  Widget cardItems({required String title, required String subTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText10(title: title, color: kPrimaryColor),
        customText10(title: subTitle, color: kTextFieldColor)
      ],
    );
  }
}
