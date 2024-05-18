import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/add_content_planning/widgets/video_material_selection_widget.dart';
import 'package:teaching_app/widgets/address_header.dart';
import 'package:teaching_app/widgets/app_scaffold.dart';
import 'package:teaching_app/widgets/flag_container.dart';

import '../../widgets/elevated_button.dart';
import 'controller/content_planning_controller.dart';
import 'widgets/language_type_selection_widget.dart';

class ContentPlanningScreen extends StatelessWidget {
  const ContentPlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContentPlanningController(),
        builder: (_) {
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
                      const Card(
                          color: Colors.white,
                          elevation: 10,
                          child: AddressHeader(address: "2020 - 2021 / 8th / Maths / Term 1 / Number System / Topic 2",)),
                      const SizedBox(height: 20,),
                      Card(
                          color: Colors.white,
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ThemeColor.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  FlagContainer(height: 135,  flagTitle: "Type / Language", flagTitleColor: ThemeColor.darkBlue4392,bgColor: ThemeColor.scaffoldBgColor,
                                    child: buildLanguageTypeSelectionWidget(_),
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FlagContainer(height: 280,  flagTitle: "Video", flagTitleColor: ThemeColor.darkBlue4392,bgColor: ThemeColor.scaffoldBgColor,
                                          child: VideoMaterialSelectionWidget(controller: _,),
                                        ),
                                      ),
                                      const SizedBox(width: 20,),
                                      Expanded(
                                        child: FlagContainer(height: 280,  flagTitle: "e-Material", flagTitleColor: ThemeColor.darkBlue4392,bgColor: ThemeColor.scaffoldBgColor,
                                          child: VideoMaterialSelectionWidget(controller: _,),
                                        ),
                                      ),

                                    ],

                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Card(elevation:5,child: AppElevatedButton(title: "SUBMIT",backgroundColor:ThemeColor.darkBlue4392,titleTextColor: ThemeColor.white,onPressed: (){},)),
                                      const SizedBox(width: 10,),
                                      Card(elevation:5,child: AppElevatedButton(title: "RESET",backgroundColor:ThemeColor.white,showBorder:true,borderColor: ThemeColor.darkBlue4392,onPressed: (){},)),
                                    ],),
                                  const SizedBox(height: 20,),

                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
          );
        });
  }
}
