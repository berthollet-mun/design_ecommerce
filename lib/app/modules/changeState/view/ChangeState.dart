import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../../components/button_components.dart';
import '../../../components/text_components.dart';
import '../../welcome/view/welcome.dart';

class ChangeState extends StatefulWidget {
  const ChangeState({super.key});

  @override
  State<ChangeState> createState() => _ChangeStateState();
}

class _ChangeStateState extends State<ChangeState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                Icon(Icons.check_circle, color: Colors.green, size: 120.sp),
                SizedBox(height: 30.h),
                TextComponents(
                  txt: "Congratulations!",
                  fw: FontWeight.bold,
                  txtSize: 28.sp,
                ),
                SizedBox(height: 16.h),
                TextComponents(
                  txt: "Your account has been successfully\ncreated",
                  txtSize: 18.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Welcome()),
                    );
                  },
                  child: ButtonComponents(
                    txtButton: "Continue Shopping",
                    buttonColor: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
