import 'package:flutter/material.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/pages/add_content_planning/controller/content_planning_controller.dart';
import 'package:teaching_app/widgets/action_button.dart';
import 'package:teaching_app/widgets/text_view.dart';

class VideoMaterialSelectionWidget extends StatelessWidget {
  final ContentPlanningController controller;

  const VideoMaterialSelectionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 40,right: 20,bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading Row
          Row(
            children: [
              _buildHeadingItem('#'),
              _buildHeadingItem('Level'),
              _buildHeadingItem('Language'),
              _buildHeadingItem('Type'),
              _buildHeadingItem('Action'),
            ],
          ),
          SizedBox(height: 15,),
          ListView.separated(
            shrinkWrap: true,
            itemCount: controller.dummyDataList.length, // Number of data rows
            itemBuilder: (context, index) {
              var data = controller.dummyDataList[index];
              return _dataListTile(data, index);
            }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10,); },
          ),
        ],
      ),
    );
  }

  Widget _dataListTile(Map<String, String> data, int index) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: BorderDirectional(top: BorderSide(color: ThemeColor.greyLight), bottom: BorderSide(color: ThemeColor.greyLight),end: BorderSide(color: ThemeColor.greyLight),start: BorderSide(color: ThemeColor.darkBlue4392,width: 10)),
           color: ThemeColor.white),
      child: Row(
        children: [
          Expanded(child: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.circle,
                color: Colors.green,
                size: 16,
              ),
              SizedBox(width: 5,),
              Checkbox(value: false, onChanged: (value) {if(value != null);}),
              SizedBox(width: 5,),
              TextView((index + 1).toString(), fontsize: 14,),
            ],
          ))),
          Expanded(child: Container(height: 50,decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: ThemeColor.greyLight))),child: Center(child: TextView(data["level"]!, fontsize: 14,)))),
          Expanded(child: Center(child: TextView(data["language"]!, fontsize: 14,))),
          Expanded(child: Container(height: 50,decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: ThemeColor.greyLight))),child: Center(child: TextView(data["type"]!, fontsize: 14,)))),
          Expanded(child: Center(
            child: ActionButtons(
              showEdit: true, showDelete: true, showViewButton: true,),
          )),
        ],
      ),

    );
  }


  Widget _buildHeadingItem(String text) {
    return Expanded(
      child: Center(
        child: TextView(
          text,
          fontsize: 14,
          fontweight: FontWeight.bold,
        ),
      ),
    );
  }

}
