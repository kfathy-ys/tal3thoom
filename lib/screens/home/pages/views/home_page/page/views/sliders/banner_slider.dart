import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    //  double width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (context, index, pageViewIndex) {
          return InkWell(
              onTap: () {},
              child: Container(
                width: context.width * 0.42,
                decoration: BoxDecoration(
                    color: kSmallIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customSliderText(
                        title: "عدد التحميلات ", color: kHomeColor),
                    customSliderText(title: "358,589 ", color: kAccentColor),
                  ],
                ),
              ));
        },
        options: CarouselOptions(
          height: context.height * 0.14,

          //aspectRatio: 16 / 2,
          viewportFraction: 0.45,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
