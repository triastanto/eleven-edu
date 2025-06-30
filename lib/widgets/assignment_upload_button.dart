import 'package:flutter/material.dart';

class AssignmentUploadButton extends StatelessWidget {
  final bool isOverdue;
  final VoidCallback? onPressed;
  final Color? overdueColor;
  final Color? normalColor;
  const AssignmentUploadButton({super.key, required this.isOverdue, this.onPressed, this.overdueColor, this.normalColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: isOverdue
            ? (overdueColor ?? theme.colorScheme.error)
            : (normalColor ?? theme.colorScheme.primary),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.upload_rounded, size: 18),
      label: const Text('Upload'),
    );
  }
}
