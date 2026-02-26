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
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.deepOrange, size: 20),
                    Icon(Icons.star, color: Colors.deepOrange, size: 20),
                    Icon(Icons.star, color: Colors.deepOrange, size: 20),
                    Icon(Icons.star, color: Colors.deepOrange, size: 20),
                    Icon(Icons.star, color: Color(0xFFF2C1A6), size: 20),
                  ],
                ),
                TextComponents(
                  txt: ProductReview,
                  txtSize: 15,
                  fw: FontWeight.bold,
                ),
              ],
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
            height: 35,
            margin: EdgeInsets.only(left: 15, right: 15),
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
