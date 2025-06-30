import 'package:flutter/material.dart';

class SimpleTopSection extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;

  const SimpleTopSection({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.fromLTRB(16, 40, 16, 16),
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
