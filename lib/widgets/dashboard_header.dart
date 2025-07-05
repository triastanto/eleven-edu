import 'package:flutter/material.dart';
import '../widgets/app_top_section.dart';
import '../constants/app_strings.dart';
import '../services/navigation_service.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  void _onNotificationPressed(BuildContext context) {
    NavigationService.navigateToAnnouncements(context);
  }

  void _onProfilePressed(BuildContext context) {
    NavigationService.navigateToProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppTopSection(
      title: AppStrings.dashboard,
      subtitle: AppStrings.greeting,
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
          onPressed: () => _onNotificationPressed(context),
        ),
        const SizedBox(width: AppStrings.defaultSpacing),
        GestureDetector(
          onTap: () => _onProfilePressed(context),
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/profile_student.jpg'),
          ),
        ),
      ],
      padding: const EdgeInsets.fromLTRB(AppStrings.largeSpacing, 40, AppStrings.largeSpacing, AppStrings.defaultSpacing),
    );
  }
}
