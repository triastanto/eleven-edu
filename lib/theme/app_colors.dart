import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color announcementInfoBox;
  final Color presentStatus;
  final Color lateStatus;
  final Color absentStatus;
  final Color calendarBackground;
  final Color eventDotBlue;
  final Color eventDotOrange;

  const AppColors({
    required this.announcementInfoBox,
    required this.presentStatus,
    required this.lateStatus,
    required this.absentStatus,
    required this.calendarBackground,
    required this.eventDotBlue,
    required this.eventDotOrange,
  });

  @override
  AppColors copyWith({
    Color? announcementInfoBox,
    Color? presentStatus,
    Color? lateStatus,
    Color? absentStatus,
    Color? calendarBackground,
    Color? eventDotBlue,
    Color? eventDotOrange,
  }) {
    return AppColors(
      announcementInfoBox: announcementInfoBox ?? this.announcementInfoBox,
      presentStatus: presentStatus ?? this.presentStatus,
      lateStatus: lateStatus ?? this.lateStatus,
      absentStatus: absentStatus ?? this.absentStatus,
      calendarBackground: calendarBackground ?? this.calendarBackground,
      eventDotBlue: eventDotBlue ?? this.eventDotBlue,
      eventDotOrange: eventDotOrange ?? this.eventDotOrange,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      announcementInfoBox: Color.lerp(announcementInfoBox, other.announcementInfoBox, t)!,
      presentStatus: Color.lerp(presentStatus, other.presentStatus, t)!,
      lateStatus: Color.lerp(lateStatus, other.lateStatus, t)!,
      absentStatus: Color.lerp(absentStatus, other.absentStatus, t)!,
      calendarBackground: Color.lerp(calendarBackground, other.calendarBackground, t)!,
      eventDotBlue: Color.lerp(eventDotBlue, other.eventDotBlue, t)!,
      eventDotOrange: Color.lerp(eventDotOrange, other.eventDotOrange, t)!,
    );
  }

  static const light = AppColors(
    announcementInfoBox: Color(0x33FF9800), // Orange with alpha
    presentStatus: Color(0xFF1B8C3A), // Green
    lateStatus: Color(0xFFF2994A), // Orange
    absentStatus: Color(0xFFD32F2F), // Red
    calendarBackground: Color(0x66FF9800), // Light orange
    eventDotBlue: Color(0xFF00B4D8), // Blue
    eventDotOrange: Color(0xFFFFA500), // Orange
  );
}
