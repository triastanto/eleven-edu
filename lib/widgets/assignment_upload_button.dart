import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class AssignmentUploadButton extends StatelessWidget {
  final bool isOverdue;
  final VoidCallback? onPressed;
  final Color? overdueColor;
  final Color? normalColor;
  const AssignmentUploadButton({super.key, required this.isOverdue, this.onPressed, this.overdueColor, this.normalColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 32, // Match badge height (approx)
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isOverdue
              ? (overdueColor ?? theme.colorScheme.error)
              : (normalColor ?? theme.colorScheme.primary),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), // Match badge
          minimumSize: const Size(0, 0), // Remove default min size
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        onPressed: onPressed,
        icon: const Icon(Icons.upload_rounded, size: 14),
        label: const Text(AppStrings.upload),
      ),
    );
  }
}
