// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../constants/color.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.asset("assets/video/onboarding.mp4")
          ..initialize().then((value) {
            _videoPlayerController.play();
            _videoPlayerController.setLooping(true);
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        children: [
          OnboardingBGVideo(videoPlayerController: _videoPlayerController),
          Center(
              child: Text(
            "The Best \nGrocery App",
            textAlign: TextAlign.center,
            style: textTheme.displayLarge!
                .copyWith(color: textColorP, fontWeight: FontWeight.bold),
          )),
          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: Column(
              children: [
                FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: Size.fromHeight(48),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Login or Register",
                      style: textTheme.titleMedium!.copyWith(
                          color: textColorP, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size.fromHeight(48),
                        side: BorderSide(color: textColorP, width: 2)),
                    onPressed: () {},
                    child: Text(
                      "Continue as Guest",
                      style: textTheme.titleMedium!.copyWith(
                          color: textColorP, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingBGVideo extends StatelessWidget {
  const OnboardingBGVideo({
    super.key,
    required VideoPlayerController videoPlayerController,
  }) : _videoPlayerController = videoPlayerController;

  final VideoPlayerController _videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _videoPlayerController.value.size.width,
          height: _videoPlayerController.value.size.height,
          child: VideoPlayer(_videoPlayerController),
        ),
      ),
    );
  }
}
