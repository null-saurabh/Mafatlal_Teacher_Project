import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/dashboard_content/controller/dashboard_controller.dart';
import 'package:teaching_app/widgets/address_header.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/continue_watching/dashboard_continue_watching.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/header/header_dashboard.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/open_subject_menu_screen.dart';
import 'package:teaching_app/widgets/app_scaffold.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardController(),
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
                    DashboardHeaderWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 5,
                      child: DashboardContinueWatchingWidget(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      child: AddressHeader(topicNumber: "8",topicTitle: "Mathematics",isMenuHeader: true,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DashboardOpenedSubjectMenuScreen(),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      child: AddressHeader(topicNumber: "9",topicTitle: "Mathematics",isMenuHeader: true,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DashboardOpenedSubjectMenuScreen(),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
