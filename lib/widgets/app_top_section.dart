import 'package:flutter/material.dart';

/// A generalized top section for all screens, visually matching the design.
class AppTopSection extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final Widget? bottom;
  final String? subtitle;
  const AppTopSection({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.padding,
    this.bottom,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: theme.colorScheme.surface,
          padding: padding ?? const EdgeInsets.fromLTRB(16, 40, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    subtitle!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.hintColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  if (actions != null) ...actions!,
                ],
              ),
            ],
          ),
        ),
        if (bottom != null) bottom!,
      ],
    );
  }
}
