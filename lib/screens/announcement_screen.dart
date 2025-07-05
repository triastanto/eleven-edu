import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../constants/app_strings.dart';
import '../services/navigation_service.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  void _onMorePressed(BuildContext context) {
    NavigationService.showMoreOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
          onPressed: () => NavigationService.navigateBack(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.campaign, color: theme.colorScheme.primary, size: 32),
            const SizedBox(width: AppStrings.defaultSpacing),
            Flexible(
              child: Text(
                AppStrings.announcements,
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: theme.iconTheme.color,
            onPressed: () => _onMorePressed(context),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: AppStrings.defaultSpacing),
            child: _SearchBar(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppStrings.defaultSpacing),
            _CategoryTabs(),
            const SizedBox(height: AppStrings.defaultSpacing),
            _MarkAllAsRead(),
            const SizedBox(height: AppStrings.defaultSpacing),
            Expanded(
              child: ListView(
                children: [
                  _AnnouncementCard(
                    icon: Icons.calendar_today_outlined,
                    title: 'Jadwal Ujian Sudah Ada',
                    category: AppStrings.events,
                    categoryColor: appColors?.announcementInfoBox ?? const Color(0xFFFFA76D),
                    content: 'Jadwal ujian akhir semester T.A 2025 sudah ter...',
                    date: 'May 14, 8:15 A.M',
                  ),
                  _AnnouncementCard(
                    icon: Icons.flash_on,
                    title: 'Libur Akhir Pekan di Majukan',
                    category: AppStrings.urgent,
                    categoryColor: theme.colorScheme.error,
                    content: 'Dikarenakan kondisi akhir pekan banyak kegiatan mak...',
                    date: 'May 14, 8:15 A.M',
                  ),
                  _AnnouncementCard(
                    icon: Icons.campaign,
                    title: 'Tentang Bazar Tahunan',
                    category: AppStrings.general,
                    categoryColor: theme.colorScheme.primary.withAlpha(120),
                    content: 'Informasi mengenai bazar tahunan yang akan diseleng...',
                    date: 'May 14, 8:15 A.M',
                  ),
                  _AnnouncementCard(
                    icon: Icons.campaign,
                    title: 'Pengembalian Buku Perpustakaan',
                    category: AppStrings.general,
                    categoryColor: theme.colorScheme.primary.withAlpha(120),
                    content: 'Dimohon seluruh siswa yang meminjam buku perpusta...',
                    date: 'May 14, 8:15 A.M',
                  ),
                  _AnnouncementCard(
                    icon: Icons.flash_on,
                    title: 'Jadwal Ekstrakurikuler Dirubah',
                    category: AppStrings.events,
                    categoryColor: appColors?.announcementInfoBox ?? const Color(0xFFFFA76D),
                    content: 'Seluruh jadwal ekstrakurikuler akan dirubah karena penyes...',
                    date: 'May 14, 8:15 A.M',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppStrings.largeSpacing),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: 4),
      child: Row(
        children: [
          Icon(Icons.search, color: theme.hintColor),
          const SizedBox(width: AppStrings.defaultSpacing),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: AppStrings.searchNotifications,
                border: InputBorder.none,
                isDense: true,
              ),
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _TabButton(label: 'All', icon: Icons.menu, selected: true, color: theme.colorScheme.primary),
        _TabButton(label: AppStrings.urgent, icon: Icons.flash_on, selected: false, color: theme.colorScheme.primary),
        _TabButton(label: AppStrings.events, icon: Icons.calendar_today_outlined, selected: false, color: theme.colorScheme.primary),
        _TabButton(label: AppStrings.general, icon: Icons.campaign, selected: false, color: theme.colorScheme.primary),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final Color color;
  const _TabButton({required this.label, required this.icon, required this.selected, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? color.withAlpha(40) : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: selected ? color : Colors.black26, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: AppStrings.defaultSpacing),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _MarkAllAsRead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(Icons.mark_email_read_outlined, color: theme.hintColor, size: 20),
        const SizedBox(width: AppStrings.defaultSpacing),
        Text(AppStrings.markAllAsRead, style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
      ],
    );
  }
}

class _AnnouncementCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String category;
  final Color categoryColor;
  final String content;
  final String date;
  const _AnnouncementCard({
    required this.icon,
    required this.title,
    required this.category,
    required this.categoryColor,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: AppStrings.largeSpacing),
      padding: const EdgeInsets.all(AppStrings.largeSpacing),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: theme.colorScheme.primary),
          const SizedBox(width: AppStrings.defaultSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: categoryColor.withAlpha(60),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: categoryColor.darken(0.2),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.cancel, color: Colors.orange, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: theme.textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppStrings.defaultSpacing),
                Text(
                  date,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension ColorUtils on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
