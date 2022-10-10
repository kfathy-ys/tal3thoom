import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/cubit/medical_reports_cubit.dart';
import 'package:tal3thoom/screens/drawer/page/medical_reports/views/card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tal3thoom/screens/widgets/fast_widget.dart';

import '../../../widgets/appBar.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/date_convertors.dart';
import '../../../widgets/loading.dart';
import '../../view.dart';
import 'medical_report_details/view.dart';

// ignore: must_be_immutable
class MedicalReports extends StatelessWidget {
  const MedicalReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            children: [
              CustomTileContainer(
                  widthh: context.width * 0.5,
                  title: "التقارير الطبية",
                  context: context),
              BlocConsumer<MedicalReportsCubit, MedicalsState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  final cubit = BlocProvider.of<MedicalReportsCubit>(context);
                  if (state is MedicalsLoading) {
                    return const LoadingFadingCubeGrid();
                  }
                  if (state is MedicalsSuccess) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          cubit.getReports();
                          return Future<void>.delayed(const Duration(seconds: 3));
                        },
                        backgroundColor: kAccentColor,
                        color: Colors.white,
                        child: state.allReports.isEmpty
                            ? Center(
                            child:
                            customBoldText(title: "لا توجد طلبات الاّن", color: kBlackText))
                            :ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: state.allReports.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CardItems(
                                onPressed: () {
                                  navigateTo(
                                      context,  MedicalReportsDetails( allReportsDetails: state.allReports[index]));
                                },
                                subTitleReportName: state.allReports[index].reportName!.toString(),
                                subTitleSpecialistName: state.allReports[index].specialistName!.toString(),
                                subTitleDate:     DateConverter.dateConverterMonth(
                                    state.allReports[index].generatedAt!),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  if (state is MedicalsError) {
                    return Center(child: Text(state.msg));
                  }

                  return const SizedBox();



                },
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) =>
      SizedBox(
        height: height * 0.05,
      );
}
