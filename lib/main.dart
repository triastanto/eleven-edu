import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'constants/app_strings.dart';
import 'providers/counter_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/assignment_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/calendar_screen.dart';
import 'widgets/app_top_section.dart';
import 'screens/profile_student_screen.dart';

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

  List<Widget> _buildTopSections(BuildContext context) {
    final theme = Theme.of(context);
    return [
      // Dashboard
      AppTopSection(
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
            onPressed: () {},
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
              backgroundImage: AssetImage('assets/profile_student.png'),
            ),
          ),
        ],
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      ),
      // Assignment
      AppTopSection(
        title: 'Daftar Tugas',
        leading: Icon(Icons.menu_book_rounded, color: theme.colorScheme.primary, size: 32),
        bottom: Container(
          color: theme.colorScheme.surface,
          child: TabBar(
            controller: _assignmentTabController,
            labelColor: theme.colorScheme.primary,
            unselectedLabelColor: theme.hintColor,
            indicatorColor: theme.colorScheme.primary,
            indicatorWeight: 2.5,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Submitted'),
              Tab(text: 'Overdue'),
            ],
          ),
        ),
      ),
      // Attendance
      AppTopSection(
        title: 'Kehadiran',
        leading: Icon(Icons.person, color: theme.colorScheme.primary),
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      ),
      // Calendar
      AppTopSection(
        title: 'Calendar',
        leading: Icon(Icons.calendar_month, color: theme.colorScheme.primary, size: 32),
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
      ),
    ];
  }

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
