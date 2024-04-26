import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/continue_watching/dashboard_continue_watching_controller.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/continue_watching/widgets/video_widget.dart';
import 'package:teaching_app/widgets/flag_container.dart';

import '../../../../app_theme.dart';

class DashboardContinueWatchingWidget extends StatelessWidget {
  const DashboardContinueWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardContinueWatchingController(),
    builder: (_) {
    return FlagContainer(
      height: 335,
      flagTitle: "Continue Watching",
      flagTitleColor: ThemeColor.darkBlue4392,
      child: Padding(
        padding: const EdgeInsets.only(top: 35,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                _.scrollToPrevious();
              },
            ),
            Expanded(
              child: ListView.separated(
                controller: _.scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: _.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  final video = _.videos[index];
                  return VideoWidget(
                    video: video,
                  );
                }, separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                _.scrollToNext();
              },
            ),
          ],
        ),
      ),
    );

  });}
}











