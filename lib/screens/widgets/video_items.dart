import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';




class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
   const VideoItems({Key? key, required this.videoPlayerController,}) : super(key: key);



  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
     aspectRatio: 16/9,

      showControls: true,


      // Prepare the video to be played and display the first frame
      autoInitialize: true,

      looping: true,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        //color: kPrimaryColor,
       // borderRadius: BorderRadius.circular(8)
      ),
      child: Chewie(

          controller: _chewieController!,

      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    _chewieController!.dispose();
  }
}