import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:teaching_app/pages/video_main_screen/controller/video_main_screen_controller.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/chapter_list_widget/chapter_list_widget.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/dialog_content.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/video_play_widget/video_play_widget.dart';
import 'package:teaching_app/widgets/app_scaffold.dart';
import 'package:teaching_app/widgets/elevated_card.dart';
import 'package:whiteboard/whiteboard.dart';

import '../../app_theme.dart';
import '../../modals/tbl_institute_topic_data.dart';
import '../../widgets/address_header.dart';
import '../../widgets/flag_container.dart';
// import '../add_content_planning/controller/content_planning_controller.dart';

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
                        ? Obx(() => ElevatedCard(
                                child: AddressHeader(
                              address:
                                  "${_.className} / ${_.subjectName} / ${_.chapterName} / ${_.topicName}",
                            )))
                        : Obx(() => ElevatedCard(
                                child: AddressHeader(
                              address:
                                  "${_.className} / ${_.chapterName} / ${_.topicName}",
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        // Wide screen: use Row
                        return Row(
                          children: [
                            // Container(),
                            Expanded(
                              child: Obx(() {
                                final topics = _.topics.value;
                                // print("topics length ${topics.length} : ${topics[0].instituteTopicId}");
                                // print(topics);
                                if (topics.isNotEmpty) {
                                  return ElevatedCard(
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.90,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: ThemeColor.greyLight,
                                          ),
                                          color: ThemeColor.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Obx(() => ElevatedCard(
                                                child: VideoPlayWidget(
                                                  topic:
                                                      _.currentTopicData.value,
                                                  // topic: topics[0],
                                                ),
                                              )),
                                          const SizedBox(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: SpeedDial(
                                                animatedIcon:
                                                    AnimatedIcons.add_event,
                                                backgroundColor: Colors.blue,
                                                overlayColor: Colors.white,
                                                overlayOpacity: 0.5,
                                                spacing: 10,
                                                direction:
                                                    SpeedDialDirection.up,
                                                spaceBetweenChildren: 10,
                                                children: [
                                                  SpeedDialChild(
                                                    child: const Icon(Icons
                                                        .question_answer_outlined),
                                                    backgroundColor:
                                                        Colors.grey,
                                                    label: 'Questions',
                                                    onTap: () async {
                                                      // showDialog(
                                                      // context: context,
                                                      // builder:
                                                      // (BuildContext context) {
                                                      // return showCustomDialog(
                                                      // context,
                                                      // 'eMaterial',
                                                      // _.videotopics.value);
                                                      // },
                                                      // );
                                                    },
                                                  ),
                                                  SpeedDialChild(
                                                    child: const Icon(
                                                        Icons.picture_as_pdf),
                                                    backgroundColor:
                                                        Colors.grey,
                                                    label: 'AI Content',
                                                    onTap: () async {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return showCustomDialog(
                                                              context,
                                                              'AI Content',
                                                              _.aiContentTopics
                                                                  .value);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  SpeedDialChild(
                                                    child: const Icon(
                                                        Icons.picture_as_pdf),
                                                    backgroundColor:
                                                        Colors.grey,
                                                    label: 'eMaterial',
                                                    onTap: () async {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return showCustomDialog(
                                                              context,
                                                              'eMaterial',
                                                              _.ematerialtopics
                                                                  .value);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  SpeedDialChild(
                                                    child: const Icon(Icons
                                                        .video_collection_outlined),
                                                    backgroundColor:
                                                        Colors.grey,
                                                    label: 'Video',
                                                    onTap: () async {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return showCustomDialog(
                                                              context,
                                                              'Video',
                                                              _.videotopics
                                                                  .value);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  // Render a placeholder widget or loading indicator
                                  return const Center(
                                      child:
                                          CircularProgressIndicator()); // Example placeholder
                                }
                              }),
                            ),
                            Obx(() => ElevatedCard(
                                    child: ChapterListWidget(
                                  chapterData: _.chap.value,
                                  selectedChapterId: _.selectedTopic.value
                                      ?.topic.instituteChapterId,
                                  selectedTopicId: _.selectedTopic.value?.topic
                                      .onlineInstituteTopicId,
                                )))
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            // Container(),
                            Obx(() {
                              final topics = _.topics.value;
                              // print("topics length ${topics.length} : ${topics[0].instituteTopicId}");
                              // print(topics);
                              if (topics.isNotEmpty) {
                                return ElevatedCard(
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.90,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ThemeColor.greyLight,
                                        ),
                                        color: ThemeColor.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        _.openWhiteBoard.value == false
                                        ?Obx(() => ElevatedCard(
                                              child: VideoPlayWidget(
                                                topic: _.currentTopicData.value,
                                                // topic: topics[0],
                                              ),
                                            )):
                                         Expanded(child: ElevatedCard(child:
                                        Stack(
                                          children: [
                                            WhiteBoard(
                                              strokeColor: _.selectedColor.value,
                                              isErasing: _.isErasing.value,
                                              controller: _.whiteBoardController,
                                            ),
                              Positioned(
                              top: 10,
                              right: 10,
                              child: Column(
                              children: [
                              IconButton(
                              icon: const Icon(Icons.color_lens),
                              onPressed: () => _selectColor(context, _),
                              ),
                              IconButton(
                              icon: const Icon(Icons.undo),
                              onPressed: () {
                              _.undo();
                              },
                              ),
                              IconButton(
                              icon: const Icon(Icons.redo),
                              onPressed: () {
                              _.redo();
                              },
                              ),
                              IconButton(
                              icon: const Icon(Icons.brush),
                              onPressed: () {
                              _.isErasing.value = false;
                              },
                              ),
                              IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                              _.isErasing.value = true;
                              },
                              ),]
                                         )
                                         ),
                                          ],
                                        )
                                        ),),

                                        const SizedBox(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: SpeedDial(
                                              animatedIcon:
                                                  AnimatedIcons.add_event,
                                              backgroundColor: Colors.blue,
                                              overlayColor: Colors.white,
                                              overlayOpacity: 0.5,
                                              spacing: 10,
                                              direction: SpeedDialDirection.up,
                                              spaceBetweenChildren: 10,
                                              children: [
                                                SpeedDialChild(
                                                  child: const Icon(Icons
                                                      .question_answer_outlined),
                                                  backgroundColor: Colors.grey,
                                                  label: 'Questions',
                                                  onTap: () async {
                                                    // showDialog(
                                                    //   context: context,
                                                    //   builder:
                                                    //       (BuildContext context) {
                                                    //     return showCustomDialog(
                                                    //         context,
                                                    //         'eMaterial',
                                                    //         _.videotopics.value);
                                                    //   },
                                                    // );
                                                  },
                                                ),
                                                SpeedDialChild(
                                                  child: const Icon(
                                                      Icons.picture_as_pdf),
                                                  backgroundColor: Colors.grey,
                                                  label: 'AI Content',
                                                  onTap: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return showCustomDialog(
                                                            context,
                                                            'AI Content',
                                                            _.aiContentTopics
                                                                .value);
                                                      },
                                                    );
                                                  },
                                                ),
                                                SpeedDialChild(
                                                  child: const Icon(
                                                      Icons.picture_as_pdf),
                                                  backgroundColor: Colors.grey,
                                                  label: 'eMaterial',
                                                  onTap: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return showCustomDialog(
                                                            context,
                                                            'eMaterial',
                                                            _.ematerialtopics
                                                                .value);
                                                      },
                                                    );
                                                  },
                                                ),
                                                SpeedDialChild(
                                                  child: const Icon(Icons
                                                      .video_collection_outlined),
                                                  backgroundColor: Colors.grey,
                                                  label: 'Video',
                                                  onTap: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return showCustomDialog(
                                                            context,
                                                            'Video',
                                                            _.videotopics
                                                                .value);
                                                      },
                                                    );
                                                  },
                                                ),
                                                SpeedDialChild(
                                                  child: const Icon(Icons
                                                      .video_collection_outlined),
                                                  backgroundColor: Colors.grey,
                                                  label: 'WhiteBoard',
                                                  onTap: () async {
                                                   _.openWhiteBoard.toggle();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                // Render a placeholder widget or loading indicator
                                return const Center(
                                    child:
                                        CircularProgressIndicator()); // Example placeholder
                              }
                            }),
                            Obx(() => ElevatedCard(
                                    child: ChapterListWidget(
                                  chapterData: _.chap.value,
                                  selectedChapterId: _.selectedTopic.value
                                      ?.topic.instituteChapterId,
                                  selectedTopicId: _.selectedTopic.value?.topic
                                      .onlineInstituteTopicId,
                                )))
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget showCustomDialog(BuildContext context, String flagTitle,
      List<InstituteTopicData> dataList) {
    VideoMainScreenController controller =
        Get.find<VideoMainScreenController>();
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            10), // Adjust this value to decrease/increase rounded corners
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.75,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close)),
                const SizedBox(
                  height: 8,
                ),
                FlagContainer(
                  flagTitle: flagTitle,
                  flagTitleColor: ThemeColor.darkBlue4392,
                  bgColor: ThemeColor.scaffoldBgColor,
                  child: VideoMainScreenTopicDataSelecter(
                    controller: controller,
                    dataList: dataList,
                  ), // Pass the appropriate controller
                ),
              ]),
        ),
      ),
    );
  }



  void _selectColor(BuildContext context, _) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _.selectedColor.value,
              onColorChanged: (color) {
                _.selectedColor.value = color;
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}
