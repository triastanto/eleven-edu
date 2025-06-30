import 'package:flutter/material.dart';
import 'base_card_container.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseCardContainer(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Libur Kenaikan Kelas', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text("Jum'at, 4 Juni 2025", style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
            const SizedBox(height: 8),
            Text(
              'Diberitahukan untuk seluruh siswa, bahwa jadwal hari libur akan dimajukan di tanggal dan hari yang sudah ditentukan. Orang tua/ wali murid dimohon untuk memantau',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
