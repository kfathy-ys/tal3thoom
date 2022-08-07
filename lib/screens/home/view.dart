import 'package:tal3thoom/screens/drawer/view.dart';
import 'package:tal3thoom/screens/widgets/appBar.dart';
import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:queen/core/helpers/prefs.dart';

import 'cubit/home_tabebar_cubit.dart';

// ignore: must_be_immutable
class HomeTabScreen extends StatelessWidget {
  final String? userId;

  HomeTabScreen({Key? key, this.userId}) : super(key: key);

  // final ItemsBar _itemsBar = ItemsBar();
  final token = Prefs.getString('token');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return onWillPop(context);
      },
      child: BlocProvider(
        create: (context) => HomeTabeBarCubit(),
        child: BlocConsumer<HomeTabeBarCubit, HomeTabeBarState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<HomeTabeBarCubit>(context);
            return Scaffold(
              key: cubit.scaffoldKey,
              backgroundColor: kHomeColor,
              drawer: MenuItems(),
              appBar: DynamicAppbar(
                  context: context,
                  press: () => cubit.scaffoldKey.currentState!.openDrawer()),
              body: cubit.widgetOptions.elementAt(cubit.index),
              bottomNavigationBar: CurvedNavigationBar(
                key: cubit.bottomNavigationKey,
                index: cubit.index,
                height: 50.0,
                items: <Widget>[
                  Image.asset(
                    "assets/images/Profile 1.png",
                  ),
                  Image.asset("assets/images/main.png"),
                  Image.asset("assets/images/white calendar.png"),
                ],
                color: kDarkPrimaryColor,
                buttonBackgroundColor: kButtonGreenDark,
                backgroundColor: kHomeColor,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 600),
                onTap: cubit.changeIndex,
                letIndexChange: (index) => true,
              ),
            );
          },
        ),
      ),
    );
  }
}
