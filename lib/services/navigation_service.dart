import 'package:flutter/material.dart';
import '../screens/announcement_screen.dart';
import '../screens/profile_student_screen.dart';

class NavigationService {
  static void navigateToAnnouncements(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AnnouncementScreen(),
      ),
    );
  }

  static void navigateToProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ProfileStudentScreen(),
      ),
    );
  }

  static void navigateBack(BuildContext context) {
    Navigator.of(context).maybePop();
  }

  static void showMoreOptions(BuildContext context) {
    // TODO: Implement more options menu
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('More options coming soon')),
    );
  }
} 