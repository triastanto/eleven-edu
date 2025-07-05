import 'package:flutter/material.dart';
import 'constants/app_strings.dart';
import 'screens/dashboard_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/calendar_screen.dart';

class AppTab {
  final Icon icon;
  final String label;
  final Widget? body;
  const AppTab({required this.icon, required this.label, this.body});
}

final List<AppTab> appTabs = [
  const AppTab(
    icon: Icon(Icons.dashboard),
    label: AppStrings.dashboard,
    body: DashboardScreen(),
  ),
  const AppTab(
    icon: Icon(Icons.assignment),
    label: AppStrings.assignment,
    body: null, // handled in home_page.dart
  ),
  const AppTab(
    icon: Icon(Icons.check_circle),
    label: AppStrings.attendance,
    body: AttendanceScreen(),
  ),
  const AppTab(
    icon: Icon(Icons.calendar_today),
    label: AppStrings.calendar,
    body: CalendarScreen(),
  ),
];
