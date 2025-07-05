import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../services/navigation_service.dart';
import '../theme/app_colors.dart';

/// Calendar screen
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  void _onMorePressed(BuildContext context) {
    NavigationService.showMoreOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, color: theme.colorScheme.primary, size: 32),
            const SizedBox(width: AppStrings.defaultSpacing),
            Flexible(
              child: Text(
                AppStrings.calendar,
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
      ),
      body: const Column(
        children: [
          Expanded(child: _CalendarBody()),
        ],
      ),
    );
  }
}

class _CalendarBody extends StatelessWidget {
  const _CalendarBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppStrings.defaultSpacing, vertical: AppStrings.defaultSpacing),
        child: Column(
          children: [
            _CalendarMonthSelector(),
            SizedBox(height: AppStrings.defaultSpacing),
            _CalendarGrid(),
            SizedBox(height: AppStrings.largeSpacing),
            _EventList(),
          ],
        ),
      ),
    );
  }
}

class _CalendarMonthSelector extends StatelessWidget {
  const _CalendarMonthSelector();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {},
        ),
        const SizedBox(width: AppStrings.defaultSpacing),
        Text(
          'Juli 2025',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: AppStrings.defaultSpacing),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  const _CalendarGrid();

  Color _yellow(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();
    return appColors?.calendarBackground ?? Theme.of(context).colorScheme.primary.withAlpha(40);
  }
  
  Color _dotBlue(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();
    return appColors?.eventDotBlue ?? const Color(0xFF00B4D8);
  }
  
  Color _dotOrange(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>();
    return appColors?.eventDotOrange ?? const Color(0xFFFFA500);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    // Example: July 2025 starts on Tuesday, so offset = 2
    final List<List<_CalendarDayData>> weeks = [
      [
        _CalendarDayData.empty(),
        _CalendarDayData.empty(),
        const _CalendarDayData(day: 1),
        _CalendarDayData(day: 2, dots: [_dotBlue(context)]),
        _CalendarDayData(day: 3, dots: [_dotBlue(context), _dotOrange(context)], isSelected: true),
        const _CalendarDayData(day: 4),
        const _CalendarDayData(day: 5),
      ],
      [
        const _CalendarDayData(day: 6),
        const _CalendarDayData(day: 7),
        const _CalendarDayData(day: 8),
        const _CalendarDayData(day: 9),
        _CalendarDayData(day: 10, dots: [_dotBlue(context), _dotOrange(context)]),
        const _CalendarDayData(day: 11),
        const _CalendarDayData(day: 12),
      ],
      [
        const _CalendarDayData(day: 13),
        _CalendarDayData(day: 14, dots: [_dotBlue(context)]),
        _CalendarDayData(day: 15, dots: [_dotBlue(context)]),
        const _CalendarDayData(day: 16),
        const _CalendarDayData(day: 17),
        const _CalendarDayData(day: 18),
        const _CalendarDayData(day: 19),
      ],
      [
        const _CalendarDayData(day: 20),
        const _CalendarDayData(day: 21),
        const _CalendarDayData(day: 22),
        const _CalendarDayData(day: 23),
        const _CalendarDayData(day: 24),
        const _CalendarDayData(day: 25),
        const _CalendarDayData(day: 26),
      ],
      [
        const _CalendarDayData(day: 27),
        const _CalendarDayData(day: 28),
        const _CalendarDayData(day: 29),
        const _CalendarDayData(day: 30),
        const _CalendarDayData(day: 31),
        _CalendarDayData.empty(),
        _CalendarDayData.empty(),
      ],
    ];
    return Container(
      decoration: BoxDecoration(
        color: _yellow(context),
        borderRadius: BorderRadius.circular(AppStrings.extraLargeSpacing),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: AppStrings.defaultSpacing),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: days
                .map((d) => Expanded(
                      child: Center(
                        child: Text(
                          d,
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: AppStrings.defaultSpacing),
          ...weeks.map((week) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: week
                      .map((day) => Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: _CalendarDay(day: day),
                            ),
                          ))
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }
}

class _CalendarDayData {
  final int? day;
  final List<Color> dots;
  final bool isSelected;
  const _CalendarDayData({this.day, this.dots = const [], this.isSelected = false});
  factory _CalendarDayData.empty() => const _CalendarDayData();
}

class _CalendarDay extends StatelessWidget {
  final _CalendarDayData day;
  const _CalendarDay({required this.day});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (day.day == null) return const SizedBox();
    final isSelected = day.isSelected;
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: isSelected
          ? BoxDecoration(
              border: Border.all(color: theme.colorScheme.primary, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day.day?.toString() ?? '',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected ? theme.colorScheme.primary : null,
            ),
          ),
          if (day.dots.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: day.dots
                    .map((color) => Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class _EventList extends StatelessWidget {
  const _EventList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: AppStrings.defaultSpacing),
      padding: const EdgeInsets.all(AppStrings.defaultSpacing),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppStrings.largeSpacing),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, size: 20, color: theme.colorScheme.primary),
              const SizedBox(width: AppStrings.defaultSpacing),
              Text(
                'Events tanggal 3 Juni 2025',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: AppStrings.defaultSpacing),
          const _EventCard(
            icon: Icons.science,
            iconColor: Color(0xFFB68900),
            title: 'Ujian Praktek - Biologi',
            time: '07:30 AM - 09:00 AM',
            location: 'Laboratorium Biologi',
          ),
          const SizedBox(height: AppStrings.defaultSpacing),
          const _EventCard(
            icon: Icons.science_outlined,
            iconColor: Color(0xFF009688),
            title: 'Ujian Praktek - Kimia',
            time: '10:00 AM - 12:00 AM',
            location: 'Laboratorium Kimia',
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String time;
  final String location;
  const _EventCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withAlpha(40),
        borderRadius: BorderRadius.circular(AppStrings.largeSpacing),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: AppStrings.defaultSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  location,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppStrings.defaultSpacing),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: theme.colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: AppStrings.defaultSpacing),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppStrings.defaultSpacing)),
              elevation: 0,
              textStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            onPressed: () {},
            child: const Text(AppStrings.details),
          ),
        ],
      ),
    );
  }
}
