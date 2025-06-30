import 'package:flutter/material.dart';

class AssignmentStatusBadge extends StatelessWidget {
  final String status;
  final Color? statusColor;
  const AssignmentStatusBadge({super.key, required this.status, this.statusColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor?.withValues(alpha: 0.1),
        border: Border.all(color: statusColor ?? Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (status == 'Submitted')
            Icon(Icons.check_circle, color: statusColor, size: 16),
          if (status == 'Overdue')
            Icon(Icons.error, color: statusColor, size: 16),
          const SizedBox(width: 4),
          Text(status, style: theme.textTheme.bodySmall?.copyWith(color: statusColor, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
