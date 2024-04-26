import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/widgets/opened_menu_item_controller.dart';
import 'package:teaching_app/utils/contants.dart';
import 'package:teaching_app/widgets/elevated_button.dart';
import 'package:teaching_app/widgets/filled_arrow_icon_widget.dart';
import 'package:teaching_app/widgets/text_view.dart';
import 'package:teaching_app/widgets/text_view.dart';
import 'package:teaching_app/widgets/text_view.dart';
import 'package:teaching_app/widgets/text_view.dart';
import 'package:teaching_app/widgets/text_view.dart';

class DashboardOpenedSubjectMenuItemWidget extends StatelessWidget {
  final SubjectData model;

  const DashboardOpenedSubjectMenuItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardOpenMenuItemController(),
        builder: (_) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 50, bottom: 15, left: 15, right: 15),
            child: ListView.builder(
              itemCount: model.chapters.length,
              itemBuilder: (context, index) {
                final chapter = model.chapters[index];
                return Obx(() => Card(
                      elevation: 5,
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: ThemeColor.greyLight)),
                          child: ExpansionTile(
                            collapsedBackgroundColor: ThemeColor.white,
                            backgroundColor: ThemeColor.lightBlueF5F9,
                            collapsedTextColor: ThemeColor.darkBlue4392,
                            textColor: ThemeColor.darkBlue4392,
                            onExpansionChanged: (isExpanded) {
                              _.isExpanded.value = isExpanded;
                            },
                            trailing: FilledArrowIcon(
                              direction: _.isExpanded.value
                                  ? Direction.up
                                  : Direction.down,
                            ),
                            title: Text(chapter.name),
                            children: [
                              Container(
                                color: ThemeColor
                                    .white, // Set background color for content
                                child: _buildChapterContent(chapter),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          );
        });
  }

  Widget _buildChapterContent(ChapterData chapter) {
    return Column(
      children: [
        Table(
          columnWidths: {
            0: const FlexColumnWidth(9),
            1: const FlexColumnWidth(3.5),
            2: const FlexColumnWidth(5),
            3: const FlexColumnWidth(5),
            4: const FlexColumnWidth(3.5),
          },
          border: TableBorder.all(color: ThemeColor.greyLight),
          children: [
            TableRow(
              children: [
                TableCell(
                    child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2, top: 8, bottom: 8),
                      child: TextView(
                        'Topics',
                        fontsize: 12,
                      )),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2, top: 8, bottom: 8),
                      child: TextView(
                        'Media',
                        fontsize: 12,
                      )),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 2, top: 8, bottom: 8),
                  child: Center(
                    child: TextView(
                      'E-Material',
                      fontsize: 12,
                    ),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2, right: 2, top: 8, bottom: 8),
                      child: TextView(
                        'Questions',
                        fontsize: 12,
                      )),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: 2.0, right: 2, top: 8, bottom: 8),
                  child: Center(
                    child: TextView(
                      'Quiz',
                      fontsize: 12,
                    ),
                  ),
                )),
              ],
            ),
            ...chapter.topics.map((topic) {
              return TableRow(
                children: [
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            topic.isCompleted
                                ? const Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green,
                                    size: 16,
                                  )
                                : const Icon(
                                    Icons.circle,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(topic.topicName,fontsize: 13,),
                                if (topic.completedDate != null)
                                  TextView(
                                    "${topic.completedDate}",
                                    fontsize: 8,
                                    textColor: ThemeColor.darkBlue4392,
                                  )
                              ],
                            )),
                          ]))),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextView('${topic.mediaCount}/6',fontsize: 13)),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextView('${topic.eMaterialCount}/10',fontsize: 13)),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextView('${topic.questionsCount}/100',fontsize: 13)),
                  )),
                  TableCell(
                      child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextView('${topic.quizCount}',fontsize: 13)),
                  )),
                ],
              );
            }),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppElevatedButton(
                title: "Quiz",
                showBorder: true,
                onPressed: (){},
              ),
              AppElevatedButton(
                title: "Assignment",
                showBorder: true,
                onPressed: (){},

              ),
              AppElevatedButton(
                title: "Test",
                showBorder: true,
                onPressed: (){},

              ),
              AppElevatedButton(
                title: "Feedback",
                showBorder: true,
                onPressed: (){},

              ),
            ],
          ),
        )
      ],
    );
  }
}
