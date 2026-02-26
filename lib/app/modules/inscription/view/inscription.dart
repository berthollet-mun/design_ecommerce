import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../../components/button_components.dart';
import '../../../components/form_components.dart';
import '../../../components/space.dart';
import '../../../components/text_components.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextComponents(
                  txt: 'Sign Up Now',
                  fw: FontWeight.bold,
                  txtSize: 25,
                ),
              ),
              h(40),
              TextComponents(txt: "Email", txtSize: 17),
              h(10),
              FormComponents(),

              h(20),
              TextComponents(txt: "Phone Number", txtSize: 17),
              h(10),
              FormComponents(textInputType: TextInputType.phone),

              h(20),
              TextComponents(txt: "Password", txtSize: 17),
              h(10),
              FormComponents(
                hide: true,
                textInputType: TextInputType.visiblePassword,
              ),

              h(20),
              ButtonComponents(
                txtButton: "Sign Up",
                buttonColor: AppTheme.primaryColor,
              ),
              h(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Container(height: 1, color: Colors.black38)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: TextComponents(txt: "Or Continue with"),
                  ),
                  Expanded(child: Container(height: 1, color: Colors.black38)),
                ],
              ),
              h(20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.primaryColor),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.g_mobiledata,
                              color: AppTheme.primaryColor,
                              size: 24.sp,
                            ),
                            SizedBox(width: 8.w),
                            TextComponents(txt: "Google"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.primaryColor),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.facebook,
                              color: AppTheme.primaryColor,
                              size: 24.sp,
                            ),
                            SizedBox(width: 8.w),
                            TextComponents(txt: "Facebook"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
