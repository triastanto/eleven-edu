import 'package:flutter/material.dart';
import '../widgets/student_card.dart';
import '../widgets/announcement_card.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/dashboard_card_item.dart';
import '../constants/app_strings.dart';

/// Dashboard screen
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: AppStrings.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StudentCard(),
          // Tugas card
          DashboardCard(
            icon: Icons.menu_book_rounded,
            title: AppStrings.tasks,
            items: const [
              DashboardCardItem('PR Matematika', '20 Juni'),
              DashboardCardItem('Penelitian Biologi', '15 Juni'),
              DashboardCardItem('PR Kimia', '21 Juni'),
            ],
            onTap: () {},
          ),
          const SizedBox(height: AppStrings.defaultSpacing),
          // Nilai card
          DashboardCard(
            icon: Icons.show_chart_rounded,
            title: AppStrings.grades,
            items: const [
              DashboardCardItem('Matematika', '86'),
              DashboardCardItem('Biologi', '90'),
              DashboardCardItem('Kimia', '80'),
            ],
            onTap: () {},
          ),
          const SizedBox(height: AppStrings.extraLargeSpacing),
          // Pengumuman
          Text(AppStrings.announcementsSection, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: AppStrings.defaultSpacing),
          const AnnouncementCard(),
          const SizedBox(height: AppStrings.defaultSpacing),
        ],
      ),
    );
  }
} 