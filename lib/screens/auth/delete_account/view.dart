import 'package:animate_do/animate_do.dart';
import 'package:tal3thoom/screens/widgets/mediaButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen/validation.dart';
import 'package:tal3thoom/config/keys.dart';

import '../../drawer/view.dart';
import '../../widgets/appBar.dart';
import '../../widgets/constants.dart';
import '../../widgets/customTextFeild.dart';
import '../../widgets/loading.dart';
import 'cubit/delete_account_cubit.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  final formKey = GlobalKey<FormState>();

  bool value = false;
  dynamic image =
      "https://i.pinimg.com/originals/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final cubit = BlocProvider.of<DeleteAccountCubit>(context);

    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: const MenuItems(),
      appBar: DynamicAppbar(
          context: context,
          press: (context) => Scaffold.of(context).openDrawer()),
      body: Container(
        height: context.height,
        color: kHomeColor,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: FadeInLeftBig(
              child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(
                        height: context.height * 0.04,
                      ),
                      CustomTileContainer(
                          widthh: width * 0.5,
                          title: "المعلومات الشخصية",
                          context: context),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(
                            'https://www.vitaalbank.nl/wp-content/uploads/2021/09/man-1.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      //_profilePic(userName: Prefs.getString('fullName')),
                      CustomTextField(
                        dIcon: Icons.password,
                        label: KeysConfig.password,
                        hint: KeysConfig.password,
                        controller: cubit.passwordController,
                        validator: qValidator([
                          IsRequired("هذا الحقل مطلوب !"),
                        ]),
                        type: TextInputType.visiblePassword,
                      ),

                      state is! DeleteAccountSuccess
                          ? MediaButton(
                              color: kPrimaryColor,
                              title: "حذف الحساب",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  showAlertDialogDeleteAccount(context, () {
                                    cubit.deleteAccount(
                                        password:
                                            cubit.passwordController.text);
                                  });
                                }
                              })
                          : const LoadingFadingCircleSmall(),
                    ],
                  );
                },
              ),
            ),

            // BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
            //   listener: (context, state) {},
            //   builder: (context, state) {
            //     final cubit = BlocProvider.of<DeleteAccountCubit>(context);
            //     if (state is DeleteAccountLoading) {
            //       return const Center(child: LoadingFadingCircle());
            //     }
            //     if (state is DeleteAccountSuccess) {
            //       return
            //     }
            //     if (state is DeleteAccountError) {
            //       return Text(state.msg);
            //     }
            //     return const SizedBox();
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
