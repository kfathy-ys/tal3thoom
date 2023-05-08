// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_readable/flutter_readable.dart';

import 'constants.dart';

class DynamicAppbar extends StatelessWidget with PreferredSizeWidget {
  final ValueChanged<BuildContext> press;
  final BuildContext context;

  const DynamicAppbar({Key? key, required this.press, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Stack(
        children: [
          Image.asset("assets/images/RectangleAppBar.png",),
          ListTile(

              leading: InkWell(
                  onTap: () => press(context),
                  child: Image.asset("assets/images/side menu.png")),
              trailing: context.canPop
                  ? InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.asset("assets/images/menu arrow.png"))
                  : null)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final IconData? icon;

  // ignore: use_key_in_widget_constructors
  CustomAppBar({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .12,
      width: double.infinity,
      padding: EdgeInsets.only(top: height * .05),
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title!,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
/*
customAppBar({required BuildContext context, required VoidCallback press} ) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: InkWell(
      onTap: () {
      //  Get.off(()=>const HomeScreen());
      },
      child: Image.asset(
        "assets/image/logo2021-2.png",
        width: 130,
        height: 60,
        fit: BoxFit.contain,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {

           // Get.to(()=> const SearchView());
            //showSearch(context: context, delegate: SubjectOfSearch());
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 35,
          )),
      IconButton(
          onPressed: press,
          icon: const Icon(
            Icons.format_align_justify,
            color: Colors.black,
            size: 30,
          )),
    ],
  );
}
*/

AppBar customAppbar(
    {bool isIcons = false, IconData? icons, String? title, context}) {
  return AppBar(
    backgroundColor: kAppBarColor,
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () => Get.back(), icon: const Icon(Icons.arrow_forward)),
    ],
    elevation: 0,
  );
}

AppBar customssAppbar(
    {bool isIcons = false,
    IconData? icons,
    String? title,
    required VoidCallback press,
    context}) {
  return AppBar(
    backgroundColor: kAppBarColor,
    toolbarHeight: 43,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    leading: InkWell(
        onTap: press, child: Image.asset("assets/images/side menu.png")),
    actions: [
      GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset("assets/images/menu arrow.png"))
    ],
    elevation: 0,
  );
}

Widget dynamicAppbar(
    {required VoidCallback press, required BuildContext context}) {
  return Stack(
    children: [
      Image.asset("assets/images/RectangleAppBar.png"),
      ListTile(
        leading: InkWell(
            onTap: press, child: Image.asset("assets/images/side menu.png")),
        trailing: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset("assets/images/menu arrow.png")),
      )
    ],
  );
}

class Tal3thomAppbar extends StatelessWidget with PreferredSizeWidget {
  const Tal3thomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: kButtonDashBoard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset("assets/images/side menu.png"),
        trailing: Image.asset("assets/images/menu arrow.png"),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
