import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import 'base_card_container.dart';
import 'base_info_box.dart';
import '../theme/app_colors.dart';

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String date;
  final String message;
  final Color? infoBoxColor;

  const AnnouncementCard({
    super.key,
    this.title = AppStrings.announcementDefaultTitle,
    this.date = AppStrings.announcementDefaultDate,
    this.message = AppStrings.announcementDefaultMessage,
    this.infoBoxColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    return BaseCardContainer(
      padding: const EdgeInsets.all(AppStrings.cardPadding),
      child: BaseInfoBox(
        color: infoBoxColor ?? appColors?.announcementInfoBox ?? theme.colorScheme.secondary.withValues(alpha: 0.2),
        padding: const EdgeInsets.all(AppStrings.infoBoxPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(date, style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
            const SizedBox(height: 8),
            Text(
              message,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
