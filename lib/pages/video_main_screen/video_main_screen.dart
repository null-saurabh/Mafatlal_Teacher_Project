import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/pages/video_main_screen/controller/video_main_screen_controller.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/chapter_list_widget/chapter_list_widget.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/video_play_widget/video_play_widget.dart';
import 'package:teaching_app/widgets/app_scaffold.dart';
import 'package:teaching_app/widgets/elevated_card.dart';

import '../../app_theme.dart';
import '../../widgets/address_header.dart';

class VideoMainScreen extends StatelessWidget {
  const VideoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: VideoMainScreenController(),
        builder: (_) {
          return const AppScaffold(
            showTopRadius: false,
            showAppbar: false,
            bgColor: ThemeColor.scaffoldBgColor,
            showLeading: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    ElevatedCard(child: AddressHeader(address: "8th / Maths / English / Number System / Perimeter",)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: ElevatedCard(child: VideoPlayWidget())),
                        ElevatedCard(child: ChapterListWidget())
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

