import 'package:flutter/material.dart';

import '../drawer/view.dart';
import 'appBar.dart';
import 'constants.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kHomeColor,
          drawer: const MenuItems(),
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
