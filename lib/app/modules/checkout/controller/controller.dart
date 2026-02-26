import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';

class ProgressBar extends StatelessWidget {
  final int setActuel;

  const ProgressBar({super.key, required this.setActuel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Row(
          children: [
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: index < setActuel
                    ? AppTheme.primaryColor
                    : AppTheme.lightBackground,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            if (index < 3)
              Container(
                height: 2.h,
                width: 50.w,
                color: AppTheme.lightBackground,
              ),
          ],
        );
      }),
    );
  }
}
