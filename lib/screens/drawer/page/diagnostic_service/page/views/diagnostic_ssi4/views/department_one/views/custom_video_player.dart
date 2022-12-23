import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String video;

  const VideoPlayerView({super.key, required this.video});

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  @override
  void initState() {
    super.initState();

    print("-=-=-=-=-=-=video link  is  ${widget.video}");
    _controller = VideoPlayerController.network(widget.video)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller!.play();
        });

        setState(() {});
      });
  }

  @override
  void dispose() {
    if (_controller!.value.isPlaying) {
      _controller!.pause();
    }

    super.dispose();
  }

  VideoPlayerController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: appBar(context: context, title: "", leading: true),
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              _controller!.value.isPlaying
                  ? _controller!.pause()
                  : _controller!.play();
            });
          },
          child: _controller == null
              ? const CircularProgressIndicator()
              : Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child:
                      // _youtubePlayer()
                      _controller!.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller!.value.aspectRatio,
                              child: VideoPlayer(
                                _controller!,
                              ),
                            )
                          : const CircularProgressIndicator(),
                ),
        ),
      ),
    ));
  }
}
