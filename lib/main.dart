import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'constants/app_strings.dart';
import 'providers/counter_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/assignment_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/calendar_screen.dart';
import 'widgets/simple_top_section.dart';

/// Entry point of the application.
void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
      child: MaterialApp(
        title: AppStrings.appTitle,
        theme: AppTheme.lightTheme,
        home: const MyHomePage(title: AppStrings.homeTitle),
      ),
    );
  }
}

/// Home page widget.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _assignmentTabController;

  @override
  void initState() {
    super.initState();
    _assignmentTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _assignmentTabController.dispose();
    super.dispose();
  }

  static const _tabData = [
    {
      'icon': Icon(Icons.dashboard),
      'label': AppStrings.dashboard,
      'top': 'dashboard',
      'body': DashboardScreen(),
    },
    {
      'icon': Icon(Icons.assignment),
      'label': AppStrings.assignment,
      'top': 'assignment',
      'body': null, // handled below
    },
    {
      'icon': Icon(Icons.check_circle),
      'label': AppStrings.attendance,
      'top': 'attendance',
      'body': AttendanceScreen(),
    },
    {
      'icon': Icon(Icons.calendar_today),
      'label': AppStrings.calendar,
      'top': 'calendar',
      'body': CalendarScreen(),
    },
  ];

  List<BottomNavigationBarItem> get _bottomNavItems => _tabData
      .map((tab) => BottomNavigationBarItem(
            icon: tab['icon'] as Icon,
            label: tab['label'] as String,
          ))
      .toList();

  List<Widget> _buildTopSections(BuildContext context) => [
        // Dashboard
        SimpleTopSection(
          title: 'Dashboard',
          leading: null,
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_outlined),
                  onPressed: () {},
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_student.png'),
            ),
          ],
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        ),
        // Assignment
        AssignmentHeader(tabController: _assignmentTabController),
        // Attendance
        const SimpleTopSection(title: 'Attendance'),
        // Calendar
        const SimpleTopSection(title: 'Calendar'),
      ];

  List<Widget> get _widgetOptions => [
        const DashboardScreen(),
        AssignmentScreen(tabController: _assignmentTabController),
        const AttendanceScreen(),
        const CalendarScreen(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topSections = _buildTopSections(context);
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          topSections[_selectedIndex],
          const Divider(height: 1),
          Expanded(
            child: _widgetOptions[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
