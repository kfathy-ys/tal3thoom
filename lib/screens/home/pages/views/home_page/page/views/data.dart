import 'package:tal3thoom/screens/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'list_model.dart';

enum Pages { one, two, three, four, five }

class OurServicesContent {
  List<OurServicesModel> ourServices = [
/*
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigBook.png"),
        color: kSmallIconColor,
      ),
    ),
*/
    OurServicesModel(
      pages: Pages.one,
      routeName: "/MyOrdersScientificMessage",
      title: "requestdepositScientificThesis".tr,
      subTitle: "titleMessage".tr,
      icon: const ImageIcon(
        AssetImage("assets/image/bigMessage.png"),
        color: kSmallIconColor,
      ),
    ),
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "selectiveBroadcastingInformation".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigcamera.png"),
        color: kSmallIconColor,
      ),
    ),*/
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "manuscriptRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigpincel.png"),
        color: kSmallIconColor,
      ),
    ),*/
    OurServicesModel(
      pages: Pages.two,
      routeName: "/MyOrderReserveArticleResearch",
      title: "requestreserveArticleOrResearchRetreat".tr,
      subTitle: "headReserve".tr,
      icon: const ImageIcon(
          AssetImage("assets/image/bigRquestSubjectSientific.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      pages: Pages.three,
      routeName: "/MyOrderAskLibrarian",
      title: "askStaff".tr,
      subTitle: "head".tr,
      icon: const ImageIcon(AssetImage("assets/image/BigEmptyQuestion.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      pages: Pages.four,
      routeName: "/MyOrdersSuggestBuyBookScreen",
      title: "suggestionBuyBook".tr,
      subTitle: "headBuyBook".tr,
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
      pages: Pages.five,
      routeName: "/MyOrderrequestVisitScreen",
      title: "requestVisit".tr,
      subTitle: "titleHead".tr,
      icon: const ImageIcon(AssetImage("assets/image/bigarrowRight.png"),
          color: kSmallIconColor),
    ),
    /* OurServicesModel(
      routeName: "/AskLibrarian",

      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigFillQuestion.png"),
          color: kSmallIconColor),
    ),*/

    /*OurServicesModel(
      routeName: "/AskLibrarian",
      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigSevrices.png"),
          color: kSmallIconColor),
    ),*/
    /*  OurServicesModel(
      routeName: "/AskLibrarian",
      title: "suggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),*/
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "bookGiftRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/giftright.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",


      title: "requestGiftBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/giftleft.png"),
        color: kSmallIconColor,
      ),
    ),*/
  ];
}

class OurServicesGridCard {
  List<OurServicesModel> ourServicesGrid = [
/*
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "Inter-LibraryExchangeAndLending".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigBook.png"),
        color: kSmallIconColor,
      ),
    ),
*/
    OurServicesModel(
      pages: Pages.one,
      routeName: "/MyOrdersScientificMessage",
      title: "requestdepositScientificThesis".tr,
      subTitle: "titleMessage".tr,
      icon: const ImageIcon(
        AssetImage("assets/image/bigMessage.png"),
        color: kSmallIconColor,
      ),
    ),
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "selectiveBroadcastingInformation".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigcamera.png"),
        color: kSmallIconColor,
      ),
    ),*/
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",
      title: "manuscriptRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/bigpincel.png"),
        color: kSmallIconColor,
      ),
    ),*/
    OurServicesModel(
      pages: Pages.two,
      routeName: "/MyOrderReserveArticleResearch",
      title: "requestreserveArticleOrResearchRetreat".tr,
      subTitle: "headReserve".tr,
      icon: const ImageIcon(
          AssetImage("assets/image/bigRquestSubjectSientific.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      pages: Pages.three,
      routeName: "/MyOrderAskLibrarian",
      title: "askStaff".tr,
      subTitle: "head".tr,
      icon: const ImageIcon(AssetImage("assets/image/BigEmptyQuestion.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      pages: Pages.four,
      routeName: "/MyOrdersSuggestBuyBookScreen",
      title: "suggestionBuyBook".tr,
      subTitle: "headBuyBook".tr,
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),
    OurServicesModel(
      pages: Pages.five,
      routeName: "/MyOrderrequestVisitScreen",
      title: "requestVisit".tr,
      subTitle: "titleHead".tr,
      icon: const ImageIcon(AssetImage("assets/image/bigarrowRight.png"),
          color: kSmallIconColor),
    ),
    /* OurServicesModel(
      routeName: "/AskLibrarian",

      title: "askRelationLibrary".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigFillQuestion.png"),
          color: kSmallIconColor),
    ),*/

    /*OurServicesModel(
      routeName: "/AskLibrarian",
      title: "libraryExternalServices".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/BigSevrices.png"),
          color: kSmallIconColor),
    ),*/
    /*  OurServicesModel(
      routeName: "/AskLibrarian",
      title: "suggestionBuyBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage(
          "assets/image/bigBuyBook.png",
        ),
        color: kSmallIconColor,
      ),
    ),*/
    /*  OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",

      title: "bookGiftRequest".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(AssetImage("assets/image/giftright.png"),
          color: kSmallIconColor),
    ),
    OurServicesModel(
      routeName: "/FollowAnsweringLibrarian",


      title: "requestGiftBook".tr,
      subTitle: "هده الخدمة ستوفر العديد من المزايا الممكنه",
      icon: const ImageIcon(
        AssetImage("assets/image/giftleft.png"),
        color: kSmallIconColor,
      ),
    ),*/
  ];
}
