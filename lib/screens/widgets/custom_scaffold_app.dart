import 'package:flutter/material.dart';


import '../drawer/view.dart';
import 'appBar.dart';
import 'constants.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({Key? key, required this.body}) : super(key: key);
final _scaffoldKey = GlobalKey<ScaffoldState>();

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: const MenuItems(),
          key: _scaffoldKey,
          appBar: customAppbar(
              icons: Icons.arrow_forward_outlined,
              isIcons: true,
              //press: () => __scaffoldKey.currentState!.openDrawer(),
              context: context),
          body: body,
        ),
      ),
    );
  }
}
