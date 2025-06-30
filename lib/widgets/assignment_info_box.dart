import 'package:flutter/material.dart';
import 'base_info_box.dart';

class AssignmentInfoBox extends StatelessWidget {
  final String message;
  final Color? iconColor;
  final Color? infoBoxColor;
  const AssignmentInfoBox({super.key, required this.message, this.iconColor, this.infoBoxColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseInfoBox(
      margin: const EdgeInsets.only(bottom: 16),
      color: infoBoxColor ?? theme.colorScheme.secondary.withValues(alpha: 0x1A),
      child: Row(
        children: [
          Icon(Icons.info, color: iconColor ?? theme.colorScheme.secondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
