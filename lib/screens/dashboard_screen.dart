import 'package:flutter/material.dart';
import '../widgets/student_card.dart';
import '../widgets/announcement_card.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/dashboard_card_item.dart';

/// Dashboard screen
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StudentCard(),
          // Tugas card
          DashboardCard(
            icon: Icons.menu_book_rounded,
            title: 'Tugas',
            items: const [
              DashboardCardItem('PR Matematika', '20 Juni'),
              DashboardCardItem('Penelitian Biologi', '15 Juni'),
              DashboardCardItem('PR Kimia', '21 Juni'),
            ],
            onTap: () {},
          ),
          const SizedBox(height: 12),
          // Nilai card
          DashboardCard(
            icon: Icons.show_chart_rounded,
            title: 'Nilai',
            items: const [
              DashboardCardItem('Matematika', '86'),
              DashboardCardItem('Biologi', '90'),
              DashboardCardItem('Kimia', '80'),
            ],
            onTap: () {},
          ),
          const SizedBox(height: 24),
          // Pengumuman
          Text('Pengumuman', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const AnnouncementCard(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
