import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:teaching_app/pages/video_main_screen/controller/video_main_screen_controller.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/chapter_list_widget/chapter_list_widget.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/dialog_content.dart';
import 'package:teaching_app/pages/video_main_screen/widgets/video_play_widget/video_play_widget.dart';
import 'package:teaching_app/widgets/app_scaffold.dart';
import 'package:teaching_app/widgets/elevated_card.dart';

import '../../app_theme.dart';
import '../../modals/tbl_institute_topic_data.dart';
import '../../widgets/address_header.dart';
import '../../widgets/flag_container.dart';
import '../add_content_planning/controller/content_planning_controller.dart';
import '../add_content_planning/widgets/video_material_selection_widget.dart';


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
                            // print("topics length ${topics.length} : ${topics[0].instituteTopicId}");
                            // print(topics);
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ElevatedCard(
                                        child: VideoPlayWidget(
                                          topic: topics[0],
                                        ),
                                      ),
                                      const SizedBox(),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 40,
                                            width: 40,
                                          child: SpeedDial(
                                            animatedIcon: AnimatedIcons.add_event,
                                            backgroundColor: Colors.blue,
                                            overlayColor: Colors.white,
                                            overlayOpacity: 0.5,
                                            spacing: 10,
                                            direction: SpeedDialDirection.up,
                                            spaceBetweenChildren: 10,
                                            children: [
                                              SpeedDialChild(
                                                child: Icon(Icons.question_answer_outlined),
                                                backgroundColor: Colors.grey,
                                                label: 'Questions',
                                                onTap: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return showCustomDialog(context, 'eMaterial',_.videotopics.value);
                                                    },
                                                  );
                                                },                                              ),
                                              SpeedDialChild(
                                                child: Icon(Icons.picture_as_pdf),
                                                backgroundColor: Colors.grey,
                                                label: 'AI Content',
                                                onTap: () async {
                                      showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                      return showCustomDialog(context, 'AI Content',_.videotopics.value);
                                      },
                                      );
                                      },
                                              ),
                                              SpeedDialChild(
                                                child: Icon(Icons.picture_as_pdf),
                                                backgroundColor: Colors.grey,
                                                label: 'eMaterial',
                                                onTap: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return showCustomDialog(context, 'eMaterial',_.ematerialtopics.value);
                                                    },
                                                  );
                                                },                                              ),
                                              SpeedDialChild(
                                                child: Icon(Icons.video_collection_outlined),
                                                backgroundColor: Colors.grey,
                                                label: 'Video',
                                                onTap: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return showCustomDialog(context, 'Video',_.videotopics.value);
                                                    },
                                                  );
                                                },                                              ),



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

  Widget showCustomDialog(BuildContext context, String flagTitle, List<InstituteTopicData> dataList) {
    ContentPlanningController controller = Get.put(ContentPlanningController());
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),  // Adjust this value to decrease/increase rounded corners
      ),
        content: SizedBox(
          width:  MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){
                Get.back();
              }, icon: Icon(Icons.close)),
              SizedBox(height: 8,),
              FlagContainer(
                height: 280,
                flagTitle: flagTitle,
                flagTitleColor: ThemeColor.darkBlue4392,
                bgColor: ThemeColor.scaffoldBgColor,
                child: VideoMainScreenTopicDataSelecter(controller: controller,dataList: dataList,), // Pass the appropriate controller
              ),
            ]
          ),
        ),
    );
  }

}

