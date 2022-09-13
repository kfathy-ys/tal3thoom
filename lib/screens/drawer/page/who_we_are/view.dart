import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../view.dart';

// ignore: must_be_immutable
class WhoWEAreScreen extends StatelessWidget {
  const WhoWEAreScreen({Key? key}) : super(key: key);

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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: FadeInUp(
              child: Image.asset(
                "assets/images/who we.png",
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
