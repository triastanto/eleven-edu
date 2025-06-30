import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color announcementInfoBox;

  const AppColors({
    required this.announcementInfoBox,
  });

  @override
  AppColors copyWith({Color? announcementInfoBox}) {
    return AppColors(
      announcementInfoBox: announcementInfoBox ?? this.announcementInfoBox,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      announcementInfoBox: Color.lerp(announcementInfoBox, other.announcementInfoBox, t)!,
    );
  }

  static const light = AppColors(
    announcementInfoBox: Color(0x33FF9800), // Example: orange with alpha
  );
}
