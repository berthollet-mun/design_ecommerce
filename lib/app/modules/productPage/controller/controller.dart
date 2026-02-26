import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../../components/button_components.dart';
import '../../../components/text_components.dart';
import '../../caterogry/view/category_detail.dart';

bool isMan = true;
bool isKids = false;

CategorieBox(String ProductName, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryDetail(ProductName: ProductName),
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundColor: AppTheme.grey1),
          SizedBox(height: 10.h),
          TextComponents(txt: ProductName, fw: FontWeight.bold),
        ],
      ),
    ),
  );
}

ProductBox(
  String ProductName,
  ProductReview,
  ProductPriceNormal,
  ProductPricePromo,
) {
  return Card(
    color: Colors.white,
    child: SizedBox(
      height: 350,
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppTheme.grey1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          TextComponents(txt: ProductName, fw: FontWeight.bold, txtSize: 18),
          SizedBox(height: 10.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.deepOrange, size: 14.sp),
                      Icon(Icons.star, color: Colors.deepOrange, size: 14.sp),
                      Icon(Icons.star, color: Colors.deepOrange, size: 14.sp),
                      Icon(Icons.star, color: Colors.deepOrange, size: 14.sp),
                      Icon(Icons.star, color: Color(0xFFF2C1A6), size: 14.sp),
                    ],
                  ),
                  SizedBox(width: 6.w),
                  TextComponents(
                    txt: ProductReview,
                    txtSize: 11.sp,
                    fw: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextComponents(
                txt: ProductPriceNormal,
                fw: FontWeight.bold,
                txtSize: 17,
              ),
              SizedBox(width: 10.w),
              Text(
                ProductPricePromo,
                style: TextStyle(
                  fontFamily: "Regular",
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            height: 32.h,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: ButtonComponents(
              txtButton: "Add to Cart",
              buttonColor: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
