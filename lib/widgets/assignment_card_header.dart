import 'package:flutter/material.dart';

class AssignmentCardHeader extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String subject;
  final String desc;
  final String type;
  final Color? descColor;
  final Color? typeBgColor;
  final Color? typeBorderColor;
  final Color? typeTextColor;

  const AssignmentCardHeader({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.subject,
    required this.desc,
    required this.type,
    this.descColor,
    this.typeBgColor,
    this.typeBorderColor,
    this.typeTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subject, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              Text(desc, style: theme.textTheme.bodyMedium?.copyWith(color: descColor ?? theme.hintColor)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(color: typeBorderColor ?? theme.dividerColor),
            borderRadius: BorderRadius.circular(8),
            color: typeBgColor ?? theme.cardColor,
          ),
          child: Text(type, style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: typeTextColor ?? theme.textTheme.bodySmall?.color)),
        ),
      ],
    );
  }
}
