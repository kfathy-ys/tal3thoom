import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:shimmer/shimmer.dart';

import 'constants.dart';

// ignore: use_key_in_widget_constructors
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitChasingDots(
        size: 40,
        color: kPrimaryColor,
      ),
    );
  }
}
// class LoadingShimmer extends StatelessWidget {
//   final Widget? child;
//
//   const LoadingShimmer({Key? key,  this.child}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         baseColor: Colors.grey[300]!,
//         highlightColor: Colors.grey[100]!,
//         enabled: true, child: child!,);
//   }
// }


// ignore: use_key_in_widget_constructors
class LoadingSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitChasingDots(
        size: 20,
        color: kPrimaryColor,
      ),
    );
  }
}

class LoadingFadingCircle extends StatelessWidget {
  const LoadingFadingCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCircle(
        size: 40,
        color: kPrimaryColor,
      ),
    );
  }
}

class LoadingFadingCircleSmall extends StatelessWidget {
  const LoadingFadingCircleSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCircle(
        size: 20,
        color: kPrimaryColor,
      ),
    );
  }
}
