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
    // Only used in DashboardScreen, but kept here for demonstration
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _widgetOptions[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () => context.read<CounterProvider>().increment(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
