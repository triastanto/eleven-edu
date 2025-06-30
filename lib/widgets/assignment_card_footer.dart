import 'package:flutter/material.dart';
import 'assignment_status_badge.dart';
import 'assignment_upload_button.dart';

class AssignmentCardFooter extends StatelessWidget {
  final String due;
  final String status;
  final Color? statusColor;
  final bool showUpload;
  final bool isOverdue;
  final Color? iconColor;
  final Color? textColor;

  const AssignmentCardFooter({
    super.key,
    required this.due,
    required this.status,
    this.statusColor,
    required this.showUpload,
    required this.isOverdue,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(Icons.calendar_today_rounded, size: 18, color: iconColor ?? theme.iconTheme.color),
        const SizedBox(width: 6),
        Text('Batas: $due', style: theme.textTheme.bodyMedium?.copyWith(color: textColor ?? theme.hintColor)),
        const Spacer(),
        if (status.isNotEmpty)
          AssignmentStatusBadge(status: status, statusColor: statusColor),
        if (showUpload)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: AssignmentUploadButton(isOverdue: isOverdue),
          ),
      ],
    );
  }
}
