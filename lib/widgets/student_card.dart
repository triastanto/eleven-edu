import 'package:flutter/material.dart';
import 'base_card_container.dart';
import '../constants/app_strings.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseCardContainer(
      margin: const EdgeInsets.only(bottom: AppStrings.largeSpacing),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/profile_student.jpg'),
          ),
          const SizedBox(width: AppStrings.defaultSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Siswa', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text('Kelas Siswa', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
              ],
            ),
          ),
          Row(
            children: [
              Text('Switch', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
              Icon(Icons.keyboard_arrow_down_rounded, color: theme.iconTheme.color),
            ],
          ),
        ],
      ),
    );
  }
}
