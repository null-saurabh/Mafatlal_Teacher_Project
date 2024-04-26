import 'package:get/get.dart';
import 'package:teaching_app/pages/dashboard_content/widgets/open_subject_menu_widget/modal/open_subject_model.dart';

class DashboardOpenedSubjectMenuController extends GetxController {
  SubjectData inProgress = SubjectData(chapters: [
    ChapterData(
      name: 'Chapter 1: Introduction to Flutter',
      topics: [
        TopicData(
          topicName: 'Setting Up Flutter Environment',
          mediaCount: 5,
          eMaterialCount: 3,
          questionsCount: 10,
          quizCount: 1,
          isCompleted: true,
          completedDate: "21/02/2022",
        ),
        TopicData(
          topicName: 'Creating Your First Flutter App',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: true,
          completedDate: "21/02/2022",
        ),
        TopicData(
          topicName: 'Your First Hello World Code',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: false,
        ),
        TopicData(
          topicName: 'Building Your First Apk',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: false,
        ),
      ],
    ),
    ChapterData(
      name: 'Chapter 2: Flutter Widgets',
      topics: [
        TopicData(
          topicName: 'Introduction to Widgets',
          mediaCount: 5,
          eMaterialCount: 3,
          questionsCount: 10,
          quizCount: 1,
          isCompleted: false,
        ),
        TopicData(
          topicName: 'Stateless Widgets',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: true,
          completedDate: "21/02/2022",

        ),
        TopicData(
          topicName: 'Stateful Widgets',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: false,
        ),
      ],
    ),
    ChapterData(
      name: 'Chapter 3: Flutter Layouts',
      topics: [
        TopicData(
          topicName: 'Introduction to Layouts',
          mediaCount: 5,
          eMaterialCount: 3,
          questionsCount: 10,
          quizCount: 1,
          isCompleted: false,
        ),
        TopicData(
          topicName: 'Row and Column',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: false,
        ),
        TopicData(
          topicName: 'Stack and Positioned',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: true,
          completedDate: "21/02/2022",

        ),
      ],
    ),
    ChapterData(
      name: 'Chapter 4: Flutter State Management',
      topics: [
        TopicData(
          topicName: 'Introduction to State Management',
          mediaCount: 5,
          eMaterialCount: 3,
          questionsCount: 10,
          quizCount: 1,
          isCompleted: true,
          completedDate: "21/02/2022",

        ),
        TopicData(
          topicName: 'Provider Package',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: false,
        ),
        TopicData(
          topicName: 'Bloc Pattern',
          mediaCount: 8,
          eMaterialCount: 2,
          questionsCount: 15,
          quizCount: 2,
          isCompleted: false,
        ),
      ],
    ),
  ]);

  SubjectData toDo = SubjectData(chapters: [
    ChapterData(name: 'Chapter 5: Flutter Animations', topics: [
      TopicData(
        topicName: 'Introduction to Animations',
        mediaCount: 5,
        eMaterialCount: 3,
        questionsCount: 10,
        quizCount: 1,
        isCompleted: true,
        completedDate: "21/02/2022",

      ),
      TopicData(
        topicName: 'Tween Animation',
        mediaCount: 8,
        eMaterialCount: 2,
        questionsCount: 15,
        quizCount: 2,
        isCompleted: false,
      ),
      TopicData(
        topicName: 'Hero Animation',
        mediaCount: 8,
        eMaterialCount: 2,
        questionsCount: 15,
        quizCount: 2,
        isCompleted: false,
      ),
    ])
  ]);
}
