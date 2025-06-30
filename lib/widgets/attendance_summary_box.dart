import 'package:flutter/material.dart';

class AttendanceSummaryBox extends StatelessWidget {
  final String label;
  final int value;
  final Color? color;
  const AttendanceSummaryBox({
    super.key,
    required this.label,
    required this.value,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(
        minWidth: 70,
        maxWidth: 90,
      ),
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(18),
        color: color ?? theme.cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$value', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              label, 
              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
