import 'package:flutter/material.dart';

enum AttendanceStatus { present, late, absent }

class AttendanceStatusBadge extends StatelessWidget {
  final AttendanceStatus status;
  const AttendanceStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    switch (status) {
      case AttendanceStatus.present:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFC6F7D0), // soft green background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('Present', style: theme.textTheme.bodyLarge?.copyWith(color: const Color(0xFF1B8C3A), fontWeight: FontWeight.w500)),
        );
      case AttendanceStatus.late:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3D6), // soft orange background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('Late', style: theme.textTheme.bodyLarge?.copyWith(color: const Color(0xFFF2994A), fontWeight: FontWeight.w500)),
        );
      case AttendanceStatus.absent:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE0E0), // soft red background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('Absent', style: theme.textTheme.bodyLarge?.copyWith(color: const Color(0xFFD32F2F), fontWeight: FontWeight.w500)),
        );
    }
  }
}
