import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_tab.dart';
import 'screens/assignment_screen.dart';
import 'widgets/dashboard_header.dart';

class TabNavigationController extends ChangeNotifier {
  int _selectedIndex = 0;
  final List<int> _tabHistory = [0];

  int get selectedIndex => _selectedIndex;
  List<int> get tabHistory => List.unmodifiable(_tabHistory);

  void selectTab(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      _tabHistory.add(index);
      notifyListeners();
    }
  }

  bool canPop() => _tabHistory.length > 1;

  void popTab() {
    if (_tabHistory.length > 1) {
      _tabHistory.removeLast();
      _selectedIndex = _tabHistory.last;
      notifyListeners();
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
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

  List<BottomNavigationBarItem> get _bottomNavItems => appTabs
      .map((tab) => BottomNavigationBarItem(
            icon: tab.icon,
            label: tab.label,
          ))
      .toList();

  Widget? _buildTopSection(BuildContext context, int selectedIndex) {
    if (selectedIndex == 0) {
      return const DashboardHeader();
    }
    return null;
  }

  List<Widget> get _widgetOptions => [
        appTabs[0].body!,
        AssignmentScreen(tabController: _assignmentTabController),
        appTabs[2].body!,
        appTabs[3].body!,
      ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabNavigationController>(
      create: (_) => TabNavigationController(),
      child: Consumer<TabNavigationController>(
        builder: (context, tabController, _) {
          final topSection = _buildTopSection(context, tabController.selectedIndex);
          return PopScope(
            canPop: !tabController.canPop(),
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop && tabController.canPop()) {
                tabController.popTab();
              }
            },
            child: Scaffold(
              appBar: null,
              body: Column(
                children: [
                  if (topSection != null) topSection,
                  if (topSection != null) const Divider(height: 1),
                  Expanded(
                    child: _widgetOptions[tabController.selectedIndex],
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: _bottomNavItems,
                currentIndex: tabController.selectedIndex,
                onTap: (index) {
                  tabController.selectTab(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
