import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../components/space.dart';
import '../../components/text_components.dart';

CustomProductBox(String productName, description, price) {
  return Column(
    children: [
      h(15),
      Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Color(0xFFefefef),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.shopping_bag, color: Colors.grey, size: 40),
          ),
          w(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponents(
                      txt: productName,
                      fw: FontWeight.bold,
                      txtSize: 18,
                    ),
                    Icon(Icons.highlight_remove, color: Colors.grey),
                  ],
                ),
                TextComponents(
                  txt: description,
                  color: Colors.grey,
                  fw: FontWeight.bold,
                ),
                h(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponents(txt: price, fw: FontWeight.bold),
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppTheme.lightBackground,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Icon(Icons.remove, size: 15)),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        TextComponents(txt: "01"),
                        SizedBox(width: 10.w),
                        InkWell(
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppTheme.lightBackground,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Icon(Icons.add, size: 15)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 15.h),
      Divider(),
    ],
  );
}
