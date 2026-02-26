import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Extension for responsive sizing
extension ResponsiveSize on num {
  /// Adaptive width
  double get w => ScreenUtil().setWidth(this);

  /// Adaptive height
  double get h => ScreenUtil().setHeight(this);

  /// Adaptive font size
  double get sp => ScreenUtil().setSp(this);

  /// Adaptive radius
  double get r => ScreenUtil().radius(this);

  /// Adaptive square size (width-based)
  double get sw => ScreenUtil().setWidth(this);

  /// Adaptive square size (height-based)
  double get sh => ScreenUtil().setHeight(this);
}

/// Screen utilities for responsive design
class AppSizes {
  // Padding
  static double get paddingXS => 4.w;
  static double get paddingSmall => 8.w;
  static double get paddingMedium => 16.w;
  static double get paddingLarge => 24.w;
  static double get paddingXL => 32.w;

  // Margins
  static double get marginXS => 4.h;
  static double get marginSmall => 8.h;
  static double get marginMedium => 16.h;
  static double get marginLarge => 24.h;
  static double get marginXL => 32.h;

  // Border Radius
  static double get radiusSmall => 8.r;
  static double get radiusMedium => 12.r;
  static double get radiusLarge => 16.r;
  static double get radiusXL => 24.r;
  static double get radiusCircular => 100.r;

  // Icon Sizes
  static double get iconSmall => 16.sp;
  static double get iconMedium => 24.sp;
  static double get iconLarge => 32.sp;
  static double get iconXL => 48.sp;

  // Button Heights
  static double get buttonHeightSmall => 36.h;
  static double get buttonHeightMedium => 48.h;
  static double get buttonHeightLarge => 56.h;

  // Text Sizes
  static double get textXS => 10.sp;
  static double get textSmall => 12.sp;
  static double get textMedium => 14.sp;
  static double get textLarge => 16.sp;
  static double get textXL => 18.sp;
  static double get text2XL => 20.sp;
  static double get text3XL => 24.sp;
  static double get text4XL => 28.sp;
  static double get text5XL => 32.sp;

  // Screen breakpoints
  static bool isMobile(BuildContext context) => ScreenUtil().screenWidth < 600;
  static bool isTablet(BuildContext context) =>
      ScreenUtil().screenWidth >= 600 && ScreenUtil().screenWidth < 1024;
  static bool isDesktop(BuildContext context) => ScreenUtil().screenWidth >= 1024;

  // Grid configurations
  static int getGridCrossAxisCount(BuildContext context) {
    final width = ScreenUtil().screenWidth;
    if (width < 400) return 2;
    if (width < 600) return 2;
    if (width < 900) return 3;
    return 4;
  }

  // Product card aspect ratio
  static double get productCardAspectRatio => 0.75;
}

/// Gap widgets for responsive spacing
class Gap {
  static Widget h(double height) => SizedBox(height: height.h);
  static Widget w(double width) => SizedBox(width: width.w);
}

/// Screen size helper
class ScreenHelper {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static EdgeInsets safeArea(BuildContext context) =>
      MediaQuery.of(context).padding;
  static double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;
  static double bottomBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
}
