import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../home/cubit/home_tabebar_cubit.dart';
import '../../../../../../../home/view.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/better_video_widget.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/mediaButton.dart';
import '../../../../../../view.dart';

// ignore: must_be_immutable
class FirstStageAdditionalTrainingScreen extends StatefulWidget {
  const FirstStageAdditionalTrainingScreen({Key? key}) : super(key: key);

  @override
  State<FirstStageAdditionalTrainingScreen> createState() =>
      _FirstStageAdditionalTrainingScreenState();
}

class _FirstStageAdditionalTrainingScreenState
    extends State<FirstStageAdditionalTrainingScreen> {
  final _firstController = TextEditingController();
  final FijkPlayer player = FijkPlayer();

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

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
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: context.height,
        width: context.width,
        color: kHomeColor,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: context.height * 0.05,
                ),
                CustomTileContainer(
                    widthh: context.width / 1.8,
                    title: "تتدريب إضافي",
                    context: context),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: context.width * 0.8,
                  height: context.height * 0.25,
                  child:


                      const VideoScreen(
                    url:
                        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  ),
                ),
                customText3(
                    title:
                        "بعد المشاهدة لمقطع الفيديو قم بالتتدريب علي هذه الامثلة : \n\n الامثلة : ",
                    color: kBlackText),
                SizedBox(
                  height: context.height * 0.02,
                ),
                SizedBox(
                  height: context.height * 0.3,
                  child: Image.asset("assets/images/t1.jpeg"),
                ),
                SizedBox(
                  height: context.height * 0.25,
                  child: Image.asset("assets/images/t2.jpeg"),
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                MediaButton(
                  onPressed: () {
                    BlocProvider.of<HomeTabeBarCubit>(context).changeIndex(1);
                    Get.offAll(() => const HomeTabScreen());
                  },
                  color: kPrimaryColor,
                  title: "خروج",
                ),
              ]),
        ),
      ),
    );
  }
}
