import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme.dart';

class ButtonComponents extends StatelessWidget {
  const ButtonComponents({
    super.key,
    required this.txtButton,
    required this.buttonColor,
  });

  final String txtButton;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor ?? AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          txtButton,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
