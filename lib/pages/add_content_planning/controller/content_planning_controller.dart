import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ContentPlanningController extends GetxController{


  RxBool videoSelected = false.obs;
  RxBool eMaterialSelected = false.obs;
  RxBool eBookSelected = false.obs;
  RxBool questionSelected = false.obs;
  RxBool hindiSelected = false.obs;
  RxBool englishSelected = false.obs;
  RxBool odiaSelected = false.obs;


  List<Map<String, String>> dummyDataList = [
    {
      'number': '1',
      'level': 'Basic',
      'language': 'English',
      'type': 'Explore',
      'title' : 'Punishment in School'
    },
    {
      'number': '2',
      'level': 'Advanced',
      'language': 'Hindi',
      'type': 'Concept',
      'title' : 'In the Woods'

    },
    {
      'number': '3',
      'level': 'Intermediate',
      'language': 'English',
      'type': 'Concept',
      'title' : 'Printing Paper'

    },
  ];

}