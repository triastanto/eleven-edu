import 'package:flutter/material.dart';
import '../widgets/app_top_section.dart';
import '../screens/profile_student_screen.dart';
import '../screens/announcement_screen.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppTopSection(
      title: 'Dashboard',
      subtitle: 'Hi, Nama Murid/Orang Tua',
      leading: null,
      actions: [
        IconButton(
          icon: Stack(
            children: [
              Icon(Icons.notifications_none_outlined, size: 28, color: theme.iconTheme.color),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error,
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.colorScheme.surface, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AnnouncementScreen(),
              ),
            );
          },
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfileStudentScreen(),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/profile_student.jpg'),
          ),
        ),
      ],
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
    );
  }
}
