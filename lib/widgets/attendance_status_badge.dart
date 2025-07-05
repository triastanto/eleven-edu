import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';

enum AttendanceStatus { present, late, absent }

class AttendanceStatusBadge extends StatelessWidget {
  final AttendanceStatus status;
  const AttendanceStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    
    Color bgColor;
    Color textColor;
    String statusText;
    
    switch (status) {
      case AttendanceStatus.present:
        bgColor = const Color(0xFFC6F7D0).withValues(alpha: 1.0);
        textColor = appColors?.presentStatus ?? const Color(0xFF1B8C3A);
        statusText = AppStrings.present;
        break;
      case AttendanceStatus.late:
        bgColor = const Color(0xFFFFF3D6).withValues(alpha: 1.0);
        textColor = appColors?.lateStatus ?? const Color(0xFFF2994A);
        statusText = AppStrings.late;
        break;
      case AttendanceStatus.absent:
        bgColor = const Color(0xFFFFE0E0).withValues(alpha: 1.0);
        textColor = appColors?.absentStatus ?? const Color(0xFFD32F2F);
        statusText = AppStrings.absent;
        break;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: AppStrings.defaultSpacing),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusText,
        style: theme.textTheme.bodyLarge?.copyWith(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
