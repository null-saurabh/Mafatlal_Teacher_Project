import 'package:get/get.dart';

class DashboardHeaderController extends GetxController{

  RxList<String> classList = ['8th Class', '9th Class','10th Class'].obs;
  var selectedClass = RxnString("8th Class");

  RxList<String> subjectList = ['Math', 'Science','Biology'].obs;
  var selectedSubject = RxnString("Math");

  RxList<String> languageList = ['English', 'Hindi','Sanskrit'].obs;
  var selectedLanguage = RxnString("English");


}