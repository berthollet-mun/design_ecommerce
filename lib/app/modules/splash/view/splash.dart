import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main_screen.dart';
import '../../../components/text_components.dart';
import '../../../../utils/theme.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // On attend que la première frame soit affichée
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //Attente de 5 secondes
      await Future.delayed(const Duration(seconds: 5));

      // Vérifie que le widget est toujours monté (sinon erreur)
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: 240.h,
          width: 200.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(
                  Icons.shopping_bag,
                  size: 60.sp,
                  color: AppTheme.primaryColor,
                ),
              ),
              SizedBox(height: 20.h),
              TextComponents(
                txt: 'ManMode',
                txtSize: 30.sp,
                fw: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
              TextComponents(
                txt: 'Fashion House',
                txtSize: 16.sp,
                color: AppTheme.grey4,
              ),
              SizedBox(height: 40.h),
              SizedBox(
                width: 40.w,
                height: 40.h,
                child: CircularProgressIndicator(
                  strokeWidth: 3.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppTheme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
