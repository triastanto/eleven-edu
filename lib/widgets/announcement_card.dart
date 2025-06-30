import 'package:flutter/material.dart';
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
    this.title = 'Libur Kenaikan Kelas',
    this.date = "Jum'at, 4 Juni 2025",
    this.message = 'Diberitahukan untuk seluruh siswa, bahwa jadwal hari libur akan dimajukan di tanggal dan hari yang sudah ditentukan. Orang tua/ wali murid dimohon untuk memantau',
    this.infoBoxColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    return BaseCardContainer(
      padding: const EdgeInsets.all(12),
      child: BaseInfoBox(
        color: infoBoxColor ?? appColors?.announcementInfoBox ?? theme.colorScheme.secondary.withValues(alpha: 0.2),
        padding: const EdgeInsets.all(12),
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
