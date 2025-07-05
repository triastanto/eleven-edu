import 'package:flutter/material.dart';
import '../widgets/attendance_summary_box.dart';
import '../widgets/attendance_status_badge.dart';
import '../widgets/attendance_record_item.dart';
import '../widgets/attendance_range_dropdown.dart';
import '../constants/app_strings.dart';
import '../services/navigation_service.dart';

/// Attendance screen
class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String _selectedRange = AppStrings.attendanceRange;
  final List<String> _rangeItems = [
    AppStrings.attendanceRange,
    AppStrings.thisMonth,
    AppStrings.thisSemester,
  ];

  void _onMorePressed(BuildContext context) {
    NavigationService.showMoreOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: theme.colorScheme.primary, size: 32),
            const SizedBox(width: AppStrings.defaultSpacing),
            Flexible(
              child: Text(
                AppStrings.attendance,
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: theme.iconTheme.color,
            onPressed: () => _onMorePressed(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: AppStrings.defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.today, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    Text('19 Juni 2025', style: theme.textTheme.bodyMedium),
                  ],
                ),
                const AttendanceStatusBadge(status: AttendanceStatus.present),
              ],
            ),
            const SizedBox(height: AppStrings.largeSpacing),
            AttendanceRangeDropdown(
              value: _selectedRange,
              items: _rangeItems,
              onChanged: (val) {
                if (val != null) setState(() => _selectedRange = val);
              },
            ),
            const SizedBox(height: AppStrings.largeSpacing),
            const AttendanceSummarySection(),
            const SizedBox(height: AppStrings.extraLargeSpacing),
            Text('Juni 2025', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: AppStrings.defaultSpacing),
            // Attendance records
            const AttendanceRecordList(),
          ],
        ),
      ),
    );
  }
}

class AttendanceSummarySection extends StatelessWidget {
  const AttendanceSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: AppStrings.defaultSpacing,
      runSpacing: AppStrings.defaultSpacing,
      children: [
        AttendanceSummaryBox(label: AppStrings.totalDays, value: 26),
        AttendanceSummaryBox(label: AppStrings.present, value: 13),
        AttendanceSummaryBox(label: AppStrings.late, value: 1),
        AttendanceSummaryBox(label: AppStrings.absent, value: 2),
      ],
    );
  }
}

class AttendanceRecordList extends StatelessWidget {
  const AttendanceRecordList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AttendanceRecordItem(
          date: '17', day: 'Fri', status: AttendanceStatus.present, detail: AppStrings.arrivedOnTime),
        AttendanceRecordItem(
          date: '16', day: 'Fri', status: AttendanceStatus.absent, detail: '${AppStrings.excused}Family Trip'),
        AttendanceRecordItem(
          date: '15', day: 'Fri', status: AttendanceStatus.late, detail: '${AppStrings.arrivedLate}09:10'),
        AttendanceRecordItem(
          date: '14', day: 'Fri', status: AttendanceStatus.present, detail: AppStrings.arrivedOnTime),
      ],
    );
  }
}
