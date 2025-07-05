import 'package:flutter/material.dart';
import 'dashboard_card_item.dart';
import 'base_card_container.dart';
import '../constants/app_strings.dart';

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<DashboardCardItem> items;
  final VoidCallback onTap;

  const DashboardCard({
    required this.icon,
    required this.title,
    required this.items,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseCardContainer(
      margin: const EdgeInsets.only(bottom: AppStrings.defaultSpacing),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppStrings.largeSpacing),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppStrings.largeSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 28, color: theme.colorScheme.primary),
                    const SizedBox(width: AppStrings.defaultSpacing),
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Icon(Icons.chevron_right_rounded, color: theme.iconTheme.color),
                  ],
                ),
                const SizedBox(height: AppStrings.defaultSpacing),
                ...items,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
