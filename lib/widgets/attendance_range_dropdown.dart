import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class AttendanceRangeDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  const AttendanceRangeDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: theme.textTheme.bodyMedium,
              )))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: AppStrings.largeSpacing, vertical: 12),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppStrings.largeSpacing),
            borderSide: BorderSide(color: theme.dividerColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppStrings.largeSpacing),
            borderSide: BorderSide(color: theme.dividerColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppStrings.largeSpacing),
            borderSide: BorderSide(color: theme.colorScheme.primary)),
        fillColor: theme.inputDecorationTheme.fillColor,
        filled: theme.inputDecorationTheme.filled,
      ),
      dropdownColor: theme.cardColor,
      style: theme.textTheme.bodyMedium,
    );
  }
}
