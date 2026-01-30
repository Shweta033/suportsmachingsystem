import 'package:flutter/material.dart';

class Responsive {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static double widthOf(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double horizontalPadding(BuildContext context) {
    final w = widthOf(context);
    if (w < mobileBreakpoint) return 20;
    if (w < tabletBreakpoint) return 40;
    return 80;
  }

  static double sectionSpacing(BuildContext context) {
    final w = widthOf(context);
    if (w < mobileBreakpoint) return 40;
    if (w < tabletBreakpoint) return 56;
    return 80;
  }

  static int gridCrossAxisCount(BuildContext context) {
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }
}
