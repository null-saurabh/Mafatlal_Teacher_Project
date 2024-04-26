

class SubjectData {
  final List<ChapterData> chapters;

  SubjectData({
    required this.chapters,
  });
}


class ChapterData {
  final String name;
  final List<TopicData> topics;

  ChapterData({
    required this.name,
    required this.topics,
  });
}

class TopicData {
  final String topicName;
  final int mediaCount;
  final int eMaterialCount;
  final int questionsCount;
  final int quizCount;
  final bool isCompleted;
  final String? completedDate;

  TopicData({
    required this.topicName,
    required this.mediaCount,
    required this.eMaterialCount,
    required this.questionsCount,
    required this.quizCount,
    required this.isCompleted,
    this.completedDate,
  });
}
