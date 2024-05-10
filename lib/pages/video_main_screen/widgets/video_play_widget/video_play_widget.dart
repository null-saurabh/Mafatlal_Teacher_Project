import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/video_play_widget/controller/video_play_controller.dart';

class VideoPlayWidget extends StatelessWidget {
  const VideoPlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init:   VideoPlayController(),
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: ThemeColor.greyLight,),
                color: ThemeColor.white,
                borderRadius: BorderRadius.circular(10)
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height *0.75,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      VlcPlayer(
                        controller: _.vlcPlayerController, // Use VlcPlayerController provided by flutter_vlc_player package
                        aspectRatio: 16 / 9,
                        placeholder: const Center(child: CircularProgressIndicator()), // Show loading indicator if video is not yet loaded
                      ),
                      Positioned.fill(
                        child: Signature(
                          color: Colors.black, // Color of the drawing
                          strokeWidth: 2.0, // Thickness of the drawing lines
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          );
        });
  }
}
