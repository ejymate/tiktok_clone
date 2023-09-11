import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video_rohee.mp4");
  final Duration _animatedDuration = const Duration(milliseconds: 400);

  late final AnimationController _animationController;

  bool _isPause = false;
  bool _clickedSeeMore = false;

  List<String> _hashtags = [];

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      duration: _animatedDuration,
      upperBound: 1.5,
      lowerBound: 1.0,
      value: 1.5,
    );

    _hashtags = [
      "cute",
      "pretty",
      "adorable",
      "baby",
      "16Month",
      "cute",
      "pretty",
      "adorable",
      "baby",
      "16Month",
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoFinished);
    setState(() {});
  }

  void _onVideoFinished() {
    return;
    // if (_videoPlayerController.value.isInitialized) {
    //   if (_videoPlayerController.value.duration ==
    //       _videoPlayerController.value.position) {
    //     widget.onVideoFinished();
    //   }
    // }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPause &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }

    setState(() {
      _isPause = !_isPause;
    });
  }

  void _onSeeMoreTap() {
    setState(() {
      _clickedSeeMore = !_clickedSeeMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPause ? 1 : 0,
                    duration: _animatedDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.circlePlay,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "@RoHEE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v10,
                const Text(
                  "Ro hee, Where U at?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: _clickedSeeMore
                            ? Colors.grey.withOpacity(0.5)
                            : Colors.transparent,
                      ),
                      child: Text(
                        _hashtags.map((e) => "#$e").join(" "),
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.white,
                        ),
                        overflow: _clickedSeeMore
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                        onTap: _onSeeMoreTap,
                        child: Text(
                          _clickedSeeMore ? "See less" : "See more",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 30,
            right: 25,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                      "https://phinf.pstatic.net/contact/20220927_290/16642620853501s7ke_PNG/avatar_profile.png?type=s160"),
                  child: Text("RoHee"),
                ),
                Gaps.v16,
                VideoButton(icon: FontAwesomeIcons.solidHeart, text: "2.9M"),
                Gaps.v16,
                VideoButton(icon: FontAwesomeIcons.solidComment, text: "33k"),
                Gaps.v16,
                VideoButton(icon: FontAwesomeIcons.share, text: "Share"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
