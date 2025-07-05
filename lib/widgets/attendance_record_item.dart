import 'package:flutter/material.dart';
import 'attendance_status_badge.dart';
import '../constants/app_strings.dart';

typedef OnTap = void Function();

class AttendanceRecordItem extends StatelessWidget {
  final String date;
  final String day;
  final AttendanceStatus status;
  final String? detail;
  final OnTap? onTap;
  const AttendanceRecordItem({
    super.key,
    required this.date,
    required this.day,
    required this.status,
    this.detail,
    this.onTap,
  });

  IconData get _icon {
    switch (status) {
      case AttendanceStatus.present:
        return Icons.check_box_rounded;
      case AttendanceStatus.late:
        return Icons.access_time_rounded;
      case AttendanceStatus.absent:
        return Icons.cancel_rounded;
    }
  }

  Color get _iconColor {
    switch (status) {
      case AttendanceStatus.present:
        return Colors.green;
      case AttendanceStatus.late:
        return Colors.orange;
      case AttendanceStatus.absent:
        return Colors.red;
    }
  }

  String get _statusText {
    switch (status) {
      case AttendanceStatus.present:
        return AppStrings.present;
      case AttendanceStatus.late:
        return AppStrings.late;
      case AttendanceStatus.absent:
        return AppStrings.absent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: AppStrings.defaultSpacing),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.dividerColor.withValues(alpha: 0.2))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(date, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                Text(day, style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
              ],
            ),
            const SizedBox(width: AppStrings.largeSpacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_statusText, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                  if (detail != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(detail!, style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
                    ),
                ],
              ),
            ),
            Icon(_icon, color: _iconColor),
          ],
        ),
      ),
    );
  }
}
