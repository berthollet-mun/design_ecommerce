import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main_screen.dart';
import '../../../components/button_components.dart';
import '../../../components/text_components.dart';
import '../../../../utils/theme.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              TextComponents(
                txt: "Lets get started with shopping!",
                fw: FontWeight.bold,
                txtSize: 28.sp,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              TextComponents(
                txt: "Find it here, buy it now!",
                txtSize: 19.sp,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(
                  Icons.shopping_bag,
                  size: 80.sp,
                  color: AppTheme.primaryColor,
                ),
              ),
              SizedBox(height: 40.h),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                child: ButtonComponents(
                  txtButton: "Get Started",
                  buttonColor: AppTheme.primaryColor,
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
