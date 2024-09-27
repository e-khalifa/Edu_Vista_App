import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const YoutubeVideoPlayer({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController vc;
  String? videoId;

  @override
  void initState() {
    super.initState();
    try {
      videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      print('Video ID: $videoId');

      if (videoId == null) {
        throw Exception("Invalid Video URL");
      }

      vc = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
    } catch (e) {
      print('Error initializing YouTube player: $e');
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    vc.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    try {
      vc.dispose();
    } catch (e) {
      print('Error disposing YouTube player: $e');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (videoId == null) {
      return Center(
        child: Text(
          'Invalid Video URL',
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return YoutubePlayer(
      controller: vc,
      onReady: () => debugPrint('Ready'),
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: ProgressBarColors(
              playedColor: ColorUtility.secondary,
              backgroundColor: ColorUtility.grey,
              bufferedColor: Colors.white,
              handleColor: ColorUtility.secondary),
        ),
        const PlaybackSpeedButton(),
        FullScreenButton(controller: vc),
      ],
    );
  }
}
