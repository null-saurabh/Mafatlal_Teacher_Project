import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardContinueWatchingController extends GetxController{

  final ScrollController scrollController = ScrollController();

  void scrollToNext() {
    scrollController.animateTo(
      scrollController.offset + 2 * 150, // Assuming each VideoWidget is 160 pixels wide
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToPrevious() {
    scrollController.animateTo(
      scrollController.offset - 2 * 160, // Assuming each VideoWidget is 160 pixels wide
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  List<Map<String, String>> videos = [
  {
  'image': 'https://getwallpapers.com/wallpaper/full/a/b/4/891455-wallpaper-of-study-2560x1440-for-hd-1080p.jpg',
  'title': 'Mathematics Lecture 1',
  'class': 'Class 10',
  'subject': 'Mathematics',
  'chapter': 'Algebra',
  'topic': 'Introduction to Algebra',
  },
  {
  'image': 'https://www.homeworkhelpglobal.com/wp-content/uploads/2019/03/studying-student-on-desk.jpg',
  'title': 'Physics Lecture 1',
  'class': 'Class 12',
  'subject': 'Physics',
  'chapter': 'Mechanics',
  'topic': 'Newton\'s Laws of Motion',
  },
  {
  'image': 'https://getwallpapers.com/wallpaper/full/a/b/4/891455-wallpaper-of-study-2560x1440-for-hd-1080p.jpg',
  'title': 'Biology Lecture 1',
  'class': 'Class 9',
  'subject': 'Biology',
  'chapter': 'Cell Biology',
  'topic': 'Cell Structure and Function',
  },
  {
  'image': 'https://wallpaperaccess.com/full/2785188.jpg',
  'title': 'Chemistry Lecture 1',
  'class': 'Class 11',
  'subject': 'Chemistry',
  'chapter': 'Inorganic Chemistry',
  'topic': 'Periodic Table',
  },
  {
  'image': 'https://getwallpapers.com/wallpaper/full/a/b/4/891455-wallpaper-of-study-2560x1440-for-hd-1080p.jpg',
  'title': 'History Lecture 1',
  'class': 'Class 8',
  'subject': 'History',
  'chapter': 'Medieval History',
  'topic': 'Mughal Empire',
  },
  {
  'image': 'https://getwallpapers.com/wallpaper/full/a/b/4/891455-wallpaper-of-study-2560x1440-for-hd-1080p.jpg',
  'title': 'Geography Lecture 1',
  'class': 'Class 7',
  'subject': 'Geography',
  'chapter': 'Physical Geography',
  'topic': 'Landforms',
  },
  {
  'image': 'https://wallpaperaccess.com/full/2785188.jpg',
  'title': 'Computer Science Lecture 1',
  'class': 'Class 11',
  'subject': 'Computer Science',
  'chapter': 'Programming Fundamentals',
  'topic': 'Introduction to Programming',
  },
  {
  'image': 'https://wallpaperaccess.com/full/2785236.jpg',
  'title': 'English Lecture 1',
  'class': 'Class 10',
  'subject': 'English',
  'chapter': 'Grammar',
  'topic': 'Parts of Speech',
  },
  {
  'image': 'https://getwallpapers.com/wallpaper/full/a/b/4/891455-wallpaper-of-study-2560x1440-for-hd-1080p.jpg',
  'title': 'Economics Lecture 1',
  'class': 'Class 12',
  'subject': 'Economics',
  'chapter': 'Microeconomics',
  'topic': 'Supply and Demand',
  },
  {
  'image': 'https://wallpaperaccess.com/full/1175473.jpg',
  'title': 'Political Science Lecture 1',
  'class': 'Class 11',
  'subject': 'Political Science',
  'chapter': 'Indian Constitution',
  'topic': 'Fundamental Rights',
  },
  {
  'image': 'https://wallpaperaccess.com/full/2785236.jpg',
  'title': 'Art Lecture 1',
  'class': 'Class 9',
  'subject': 'Art',
  'chapter': 'Art History',
  'topic': 'Renaissance Art',
  },
  {
  'image': 'https://wallpaperaccess.com/full/2785188.jpg',
  'title': 'Music Lecture 1',
  'class': 'Class 8',
  'subject': 'Music',
  'chapter': 'Music Theory',
  'topic': 'Major and Minor Scales',
  },
  {
  'image': 'https://wallpaperaccess.com/full/2785236.jpg',
  'title': 'Physical Education Lecture 1',
  'class': 'Class 12',
  'subject': 'Physical Education',
  'chapter': 'Sports Science',
  'topic': 'Biomechanics',
  },
  {
  'image': 'https://wallpaperaccess.com/full/2785188.jpg',
  'title': 'Psychology Lecture 1',
  'class': 'Class 11',
  'subject': 'Psychology',
  'chapter': 'Developmental Psychology',
  'topic': 'Piaget\'s Theory of Cognitive Development',
  },
  {
  'image': 'https://wallpaperaccess.com/full/2785236.jpg',
  'title': 'Sociology Lecture 1',
  'class': 'Class 10',
  'subject': 'Sociology',
  'chapter': 'Social Institutions',
  'topic': 'Family',
  },
  ];


}