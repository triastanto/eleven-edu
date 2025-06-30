import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'constants/app_strings.dart';
import 'providers/counter_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/assignment_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/calendar_screen.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  /// Returns the list of widgets for each tab.
  List<Widget> get _widgetOptions => const <Widget>[
        DashboardScreen(),
        AssignmentScreen(),
        AttendanceScreen(),
        CalendarScreen(),
      ];

  /// Returns the list of BottomNavigationBarItems.
  List<BottomNavigationBarItem> get _bottomNavItems => const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: AppStrings.dashboard,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: AppStrings.assignment,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle),
          label: AppStrings.attendance,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: AppStrings.calendar,
        ),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove default AppBar
      body: Column(
        children: [
          // Custom top section
          Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Nama Murid/Orang Tua',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Dashboard',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
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
            ),
          ),
          const Divider(height: 1),
          // Expanded area for tab content
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
