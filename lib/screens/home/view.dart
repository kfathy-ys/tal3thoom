import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:tal3thoom/screens/drawer/view.dart';
import 'package:tal3thoom/screens/widgets/appBar.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:queen/core/helpers/prefs.dart';

import 'cubit/home_tabebar_cubit.dart';

// ignore: must_be_immutable
class HomeTabScreen extends StatefulWidget {
  final String? userId;

  const HomeTabScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  // final ItemsBar _itemsBar = ItemsBar();
  final token = Prefs.getString('token');

/* bottomNavigationBar: CurvedNavigationBar(
              //  key: cubit.bottomNavigationKey,
              index: cubit.index,
              height: 50.0,
              items: <Widget>[
                buildImage(image: 'assets/images/Profile 1.png'),
                buildImage(image: 'assets/images/main.png'),
                buildImage(image: 'assets/images/white calendar.png'),
              ],
              color: kDarkPrimaryColor,
              buttonBackgroundColor: kButtonGreenDark,
              backgroundColor: kHomeColor,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: cubit.changeIndex,
              letIndexChange: (index) => true,
            ),*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return onWillPop(context);
      },
      child: BlocConsumer<HomeTabeBarCubit, HomeTabeBarState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<HomeTabeBarCubit>(context);
          return Scaffold(
            backgroundColor: kHomeColor,
            drawer: const MenuItems(),
            appBar: DynamicAppbar(
                context: context,
                press: (context) => Scaffold.of(context).openDrawer()),
            body: cubit.widgetOptions.elementAt(cubit.index),

            //
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: kButtonGreenDark,
            //   child:
            //       buildImage(image: 'assets/images/main.png'),
            //
            //   onPressed: ()=>cubit.changeIndex(cubit.index =1),
            // ),
            // bottomNavigationBar:
            //
            // AnimatedBottomNavigationBar(
            //   backgroundColor: kPrimaryColor,
            //   activeColor: kHomeColor,
            //   icons: iconList,
            //   activeIndex: cubit.index,
            //   gapLocation: GapLocation.center,
            //   notchSmoothness: NotchSmoothness.softEdge,
            //   onTap: cubit.changeIndex,
            //   //other params
            // ),

            bottomNavigationBar: ConvexAppBar(
              // cornerRadius: 12,

              elevation: 20,

              style: TabStyle.reactCircle,
              //  key: cubit.bottomNavigationKey,
              initialActiveIndex: cubit.index,
              height: 50.0,
              items: [
                TabItem(
                  // title: "ملفي",
                  icon: buildImage(image: 'assets/images/Profile 1.png'),
                ),
                TabItem(
                    // title: "الرئيسية",
                    icon: buildImage(image: 'assets/images/main.png')),
                TabItem(
                    //  title:   "الحجوزات",
                    icon:
                        buildImage(image: 'assets/images/white calendar.png')),
                // buildImage(image: 'assets/images/Profile 1.png'),
                //  buildImage(image: 'assets/images/main.png'),
                // buildImage(image: 'assets/images/white calendar.png'),
              ],

              // color: kDarkPrimaryColor,
              activeColor: kButtonGreenDark,
              color: kHomeColor,
              // buttonBackgroundColor: kButtonGreenDark,
              // backgroundColor: kHomeColor,
              backgroundColor: kPrimaryColor,
              // animationCurve: Curves.easeInOut,
              // animationDuration: const Duration(milliseconds: 600),
              onTap: cubit.changeIndex,
              //  letIndexChange: (index) => true,
            ),
          );
        },
      ),
    );
  }

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
  ];
  Image buildImage({required String image}) {
    return Image.asset(
      image,
    );
  }
}
