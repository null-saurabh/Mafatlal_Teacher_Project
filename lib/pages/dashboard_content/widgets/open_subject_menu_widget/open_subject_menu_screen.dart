import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/widgets/opened_menu_item_widget.dart';
import 'package:teaching_app/widgets/flag_container.dart';

import 'open_subject_controller.dart';

class DashboardOpenedSubjectMenuScreen extends StatelessWidget {
  const DashboardOpenedSubjectMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardOpenedSubjectMenuController(),
        builder: (_) {
          return Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 5,
                  child: FlagContainer(
                    flagTitleColor: ThemeColor.darkBlue4392,
                    flagTitle: "In Progress",
                    height: 400,
                    child: DashboardOpenedSubjectMenuItemWidget(
                        model: _.inProgress),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Card(
                  elevation: 5,
                  child: FlagContainer(
                    flagTitleColor: ThemeColor.darkRed0000,
                    flagTitle: "To Do",
                    height: 400,
                    child: DashboardOpenedSubjectMenuItemWidget(
                      model: _.toDo,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Card(
                  elevation: 5,
                  child: FlagContainer(
                    flagTitleColor: ThemeColor.darkGreen8326,
                    flagTitle: "Completed",
                    height: 400,
                    child: DashboardOpenedSubjectMenuItemWidget(
                        model: _.inProgress),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
