

import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
class VideoUploadRecordScreen extends StatefulWidget {
  final String url;

  const VideoUploadRecordScreen({super.key, required this.url});

  @override
  _VideoUploadRecordScreenState createState() => _VideoUploadRecordScreenState();
}

class _VideoUploadRecordScreenState extends State<VideoUploadRecordScreen> {
  final FijkPlayer player = FijkPlayer();

  _VideoUploadRecordScreenState();

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