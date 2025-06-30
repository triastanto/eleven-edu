import 'package:flutter/material.dart';

enum AttendanceStatus { present, late, absent }

class AttendanceStatusBadge extends StatelessWidget {
  final AttendanceStatus status;
  const AttendanceStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color bgColor;
    Color textColor;
    switch (status) {
      case AttendanceStatus.present:
        bgColor = const Color(0xFFC6F7D0).withValues(alpha: 1.0);
        textColor = const Color(0xFF1B8C3A);
        break;
      case AttendanceStatus.late:
        bgColor = const Color(0xFFFFF3D6).withValues(alpha: 1.0);
        textColor = const Color(0xFFF2994A);
        break;
      case AttendanceStatus.absent:
        bgColor = const Color(0xFFFFE0E0).withValues(alpha: 1.0);
        textColor = const Color(0xFFD32F2F);
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status == AttendanceStatus.present
            ? 'Present'
            : status == AttendanceStatus.late
                ? 'Late'
                : 'Absent',
        style: theme.textTheme.bodyLarge?.copyWith(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
