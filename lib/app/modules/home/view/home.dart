import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../../main_screen.dart';
import '../../connexion/view/login.dart';
import '../../inscription/view/inscription.dart';
import '../../../components/button_components.dart';
import '../../../components/text_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.lightBackground, elevation: 0),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          color: AppTheme.lightBackground,
          width: ScreenUtil().screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextComponents(
                txt: "Welcome",
                txtSize: 35.sp,
                fw: FontWeight.bold,
                color: AppTheme.textPrimaryLight,
              ),
              TextComponents(
                txt: "ManMode Shopping House",
                txtSize: 16.sp,
                color: AppTheme.textSecondaryLight,
              ),
              SizedBox(height: 40.h),
              Container(
                height: 200.h,
                width: 200.w,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Inscription(),
                    ),
                  );
                },
                child: ButtonComponents(
                  txtButton: 'Sign up',
                  buttonColor: AppTheme.primaryColor,
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: ButtonComponents(
                  txtButton: 'Login',
                  buttonColor: AppTheme.grey4,
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                },
                child: TextComponents(
                  txt: 'Continue as Guest',
                  color: AppTheme.primaryColor,
                  fw: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
