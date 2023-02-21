import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/treatment_service/page/views/first_session/first_stage_ssrs_test/page/card_number.dart';
import 'package:tal3thoom/screens/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../widgets/alerts.dart';
import '../../../../../../../widgets/appBar.dart';
import '../../../../../../../widgets/constants.dart';
import '../../../../../../../widgets/loading.dart';
import '../../../../../../view.dart';
import '../../../../../diagnostic_service/page/views/diagnostci_oases_test/views/alert_message.dart';
import 'cubit/second_stage_ssrs_cubit.dart';

// ignore: must_be_immutable
class SecondStageSSRSTreatmentScreen extends StatefulWidget {
  const SecondStageSSRSTreatmentScreen({Key? key}) : super(key: key);

  @override
  State<SecondStageSSRSTreatmentScreen> createState() =>
      _SecondStageSSRSTreatmentScreenState();
}

class _SecondStageSSRSTreatmentScreenState
    extends State<SecondStageSSRSTreatmentScreen> {
  int? selectedNumber;
  final FijkPlayer player = FijkPlayer();

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        height: context.height,
        width: context.width,
        color: kHomeColor,
        child: BlocConsumer<SecondStageSsrsCubit, SecondStageSsrsState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<SecondStageSsrsCubit>(context);

            if (state is SecondStageSsrsLoading) {
              return const Center(
                child: LoadingFadingCircle(),
              );
            }
            if (state is SecondStageSsrsSuccess) {
              return ListView.builder(
                  itemCount: state.ssrsQuestionModel.length,
                  itemBuilder: (context, index) {
                    //const categoryNumber = 160;
                    // final qList = cubit.questionList
                    //     .where((e) => e.categoryId == categoryNumber)
                    //     .toList();
                    // final currentQuestion = qList[index];
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTileContainer(
                              widthh: context.width / 2,
                              title: "إختبار SSRS",
                              context: context),
                          customText6(
                            title:
                                "الإختبار التالت SSRS (أختبار الرضا الكلامي)",
                            color: kBlackText,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Image.asset("assets/images/255.png"),
                          ),
                          SizedBox(
                            width: context.width * 0.8,
                            height: context.height * 0.25,
                           // child:

                                // BetterVideoItems(video:      BetterPlayer.network(
                                //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                                //
                                //   betterPlayerConfiguration: const BetterPlayerConfiguration(
                                //     aspectRatio: 16 / 9,
                                //   ),
                                // ),
                                //
                                //
                                //
                                //
                                // ),

                            //     const VideoScreen(
                            //   url:
                            //       'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                            // ),
                          ),
                          CustomButton(
                            onPressed: () {},
                            title: state.ssrsQuestionModel[index].description,
                            color: kPrimaryColor,
                          ),
                          const AlertMessage(),
                          Wrap(
                              textDirection: TextDirection.ltr,
                              spacing: 15,
                              runSpacing: 10,
                              children: cubit.questionList[0].answers
                                  .map((e) => CardNumber(
                                      onTap: () {
                                        cubit.answer = {
                                          cubit.questionList[0]: e
                                        };
                                        selectedNumber = e.id;
                                        print("الرقم" +
                                            selectedNumber.toString());
                                        setState(() {});
                                      },
                                      title: e.answerOption,
                                      isSelected: e.id == selectedNumber))
                                  .toList()),
                          CustomButton(
                            color: kPrimaryColor,
                            title: "متابعة",
                            onPressed: () {
                              if (selectedNumber == null) {
                                Alert.error("عملية التقييم مطلوبة ",
                                    desc:
                                        "الرجاء الضغط علي المقياس الموجود بالاسفل");
                              } else {
                                Alert.success(
                                  "عملية التقييم ناجحة ",
                                );
                                cubit.postSecondStageSsrsSSRSAnswers();
                              }
                            },
                          ),
                        ]);
                  });
            }
            if (state is SecondStageSsrsError) {
              return Text(state.msg);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
