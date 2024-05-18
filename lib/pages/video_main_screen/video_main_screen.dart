import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
          // print(_.chapterData);
          // print(_.subjectId);
          // print("aaaaaaaaaaa");
          return AppScaffold(
            showTopRadius: false,
            showAppbar: true,
            bgColor: ThemeColor.scaffoldBgColor,
            showLeading: true,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    _.isContinueWatching.value == true
                     ?Obx(() => ElevatedCard(child: AddressHeader(address: "${_.className} / ${_.subjectName} / ${_.chapterName} / ${_.topicName}",)))
                     :Obx(() => ElevatedCard(child: AddressHeader(address: "${_.className} / ${_.chapterName} / ${_.topicName}",))),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(),

                        Expanded(
                          child: Obx(() {
                            final topics = _.topics.value;
                            print("topics length ${topics.length} : ${topics[0].instituteTopicId}");
                            print(topics);
                            if (topics.isNotEmpty) {
                              return ElevatedCard(
                                child: Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height * 0.80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ThemeColor.greyLight,
                                      ),
                                      color: ThemeColor.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      ElevatedCard(
                                        child: VideoPlayWidget(
                                          topic: topics[0],
                                        ),
                                      ),
                                      const SizedBox(),


                                      // floatingActionButton: SpeedDial(
                                      //   animatedIcon: AnimatedIcons.menu_close,
                                      //   backgroundColor: Colors.blue,
                                      //   overlayColor: Colors.black,
                                      //   overlayOpacity: 0.5,
                                      //   spacing: 10,
                                      //   spaceBetweenChildren: 10,
                                      //   children: [
                                      //     SpeedDialChild(
                                      //       child: Icon(Icons.border_color),
                                      //       backgroundColor: Colors.grey,
                                      //       label: 'Whiteboard',
                                      //       onTap: () => print('Whiteboard'),
                                      //     ),
                                      //     SpeedDialChild(
                                      //       child: Icon(Icons.picture_as_pdf),
                                      //       backgroundColor: Colors.grey,
                                      //       label: 'Upload PDF',
                                      //       onTap: () => print('Upload PDF'),
                                      //     ),
                                      //   ],
                                      // ),

                                    ],
                                  ),
                                ),
                              );
                            } else {
                              // Render a placeholder widget or loading indicator
                              return const Center(child: CircularProgressIndicator()); // Example placeholder
                            }
                          }),
                        ),

                        Obx(() => ElevatedCard(child: ChapterListWidget(chapterData: _.chap.value,selectedChapterId: _.selectedTopic.value?.topic.instituteChapterId ,selectedTopicId: _.selectedTopic.value?.topic.onlineInstituteTopicId,)))
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

