import 'package:flutter/material.dart';
import '../widgets/attendance_summary_box.dart';
import '../widgets/attendance_status_badge.dart';
import '../widgets/attendance_record_item.dart';
import '../widgets/attendance_range_dropdown.dart';

/// Attendance screen
class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String _selectedRange = 'Jangka Kehadiran';
  final List<String> _rangeItems = [
    'Jangka Kehadiran',
    'Bulan Ini',
    'Semester Ini',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  Text('19 Juni 2025', style: theme.textTheme.bodyMedium),
                ],
              ),
              const AttendanceStatusBadge(status: AttendanceStatus.present),
            ],
          ),
          const SizedBox(height: 16),
          AttendanceRangeDropdown(
            value: _selectedRange,
            items: _rangeItems,
            onChanged: (val) {
              if (val != null) setState(() => _selectedRange = val);
            },
          ),
          const SizedBox(height: 16),
          const AttendanceSummarySection(),
          const SizedBox(height: 24),
          Text('Juni 2025', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          // Attendance records
          const AttendanceRecordList(),
        ],
      ),
    );
  }
}

class AttendanceSummarySection extends StatelessWidget {
  const AttendanceSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        AttendanceSummaryBox(label: 'Total Day', value: 26),
        AttendanceSummaryBox(label: 'Present', value: 13),
        AttendanceSummaryBox(label: 'Late', value: 1),
        AttendanceSummaryBox(label: 'Absent', value: 2),
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
          date: '17', day: 'Fri', status: AttendanceStatus.present, detail: 'Arrived on Time'),
        AttendanceRecordItem(
          date: '16', day: 'Fri', status: AttendanceStatus.absent, detail: 'Excused: Family Trip'),
        AttendanceRecordItem(
          date: '15', day: 'Fri', status: AttendanceStatus.late, detail: 'Arrived 09:10'),
        AttendanceRecordItem(
          date: '14', day: 'Fri', status: AttendanceStatus.present, detail: 'Arrived on Time'),
      ],
    );
  }
}
