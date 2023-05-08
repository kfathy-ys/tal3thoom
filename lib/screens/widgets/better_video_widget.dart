import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

// class BetterVideoItems extends StatefulWidget {
//   final Widget video;
//   const BetterVideoItems({Key? key, required this.video}) : super(key: key);
//
//   @override
//   State<BetterVideoItems> createState() => _BetterVideoItemsState();
// }
//
// class _BetterVideoItemsState extends State<BetterVideoItems> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: widget.video
//       ),
//     );
//   }
// }
//

// import 'package:flutter/services.dart';
//
// class NormalPlayerPage extends StatefulWidget {
//   @override
//   _NormalPlayerPageState createState() => _NormalPlayerPageState();
// }
//
// class _NormalPlayerPageState extends State<NormalPlayerPage> {
//   late BetterPlayerController _betterPlayerController;
//   late BetterPlayerDataSource _betterPlayerDataSource;
//   @override
//   void initState() {
//     BetterPlayerConfiguration betterPlayerConfiguration =
//     const BetterPlayerConfiguration(
//       aspectRatio: 16 / 9,
//       fit: BoxFit.contain,
//       autoPlay: true,
//       looping: true,
//       deviceOrientationsAfterFullScreen: [
//         DeviceOrientation.portraitDown,
//         DeviceOrientation.portraitUp
//       ],
//     );
//
//     _betterPlayerDataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//     );
//     _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
//     _betterPlayerController.setupDataSource(_betterPlayerDataSource);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Column(
//         children: [
//           const SizedBox(height: 8),
//           AspectRatio(
//             aspectRatio: 16 / 9,
//             child: BetterPlayer(controller: _betterPlayerController),
//           ),
//         ],
//       ),
//     );
//   }
// }

class VideoScreen extends StatefulWidget {
  final String url;

  const VideoScreen({super.key, required this.url});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();

  _VideoScreenState();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.url, autoPlay: false);
    player.setOption(FijkOption.hostCategory, "max-resolution", "426x240");
  }

  @override
  Widget build(BuildContext context) {
    return FijkView(
      fit: FijkFit.fill,
      player: player,
      cover: const AssetImage(
        "assets/images/icon 003.png",
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}
