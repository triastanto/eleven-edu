import 'package:flutter/material.dart';

class DashboardCardItem extends StatelessWidget {
  final String left;
  final String right;
  const DashboardCardItem(this.left, this.right, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
          ),
          Text(
            right,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}
