import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:flutter/material.dart';

import '../../../../config/keys.dart';

class RecoveryWidget extends StatelessWidget {
  final VoidCallback onTap;

  const RecoveryWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 170),
      child: GestureDetector(
        onTap: onTap,
        child: const Text(
          KeysConfig.passwordRecovery,
          style: TextStyle(
              color: kSkyButton, fontSize: 14, fontFamily: 'DinReguler'),
        ),
      ),
    );
  }
}
