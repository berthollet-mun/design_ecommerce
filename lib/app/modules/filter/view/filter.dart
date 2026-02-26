import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../../components/button_components.dart';
import '../../../components/text_components.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool all = true;
  bool nike = false;
  bool bata = false;
  bool adidas = false;

  bool allGender = true;
  bool menGender = false;
  bool kidsGender = false;

  bool allSize = true;
  bool size1 = false;
  bool size2 = false;

  final List<String> categories = [
    "T-shirt",
    "Jeans",
    "Shoes",
    "Panjabi",
    "Watches",
  ];

  String selectedValue = "";

  double valeurActuelle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextComponents(txt: "Filter", fw: FontWeight.bold, txtSize: 19),
        actions: [
          Icon(Icons.delete),
          SizedBox(width: 15.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextComponents(txt: "Brands", fw: FontWeight.bold, txtSize: 18.sp),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        all = true;
                        nike = bata = adidas = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: all ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "All",
                          fw: FontWeight.bold,
                          color: all ? Colors.white : Colors.black87,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        nike = true;
                        all = bata = adidas = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: nike ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "Nike",
                          fw: FontWeight.bold,
                          color: nike ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        bata = true;
                        all = nike = adidas = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: bata ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "Bata",
                          fw: FontWeight.bold,
                          color: bata ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        adidas = true;
                        all = nike = bata = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: adidas ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "Adidas",
                          fw: FontWeight.bold,
                          color: adidas ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            TextComponents(txt: "Gender", fw: FontWeight.bold, txtSize: 18.sp),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        allGender = true;
                        menGender = kidsGender = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: allGender ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "All",
                          fw: FontWeight.bold,
                          color: allGender ? Colors.white : Colors.black87,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        menGender = true;
                        allGender = kidsGender = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: menGender ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "Men",
                          fw: FontWeight.bold,
                          color: menGender ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        kidsGender = true;
                        allGender = menGender = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: kidsGender
                            ? AppTheme.primaryColor
                            : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "Kids",
                          fw: FontWeight.bold,
                          color: kidsGender ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            TextComponents(
              txt: "Select Product",
              fw: FontWeight.bold,
              txtSize: 18,
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton(
                isExpanded: true,
                value: selectedValue.isEmpty ? null : selectedValue,
                hint: Text(
                  "Cliquez ici pour choisir le produit",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                items: categories.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 10.h),
            TextComponents(
              txt: "Select Size",
              fw: FontWeight.bold,
              txtSize: 18,
            ),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        allSize = true;
                        size1 = size2 = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: allSize ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "All",
                          fw: FontWeight.bold,
                          color: allSize ? Colors.white : Colors.black87,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        size1 = true;
                        allSize = size2 = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: size1 ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "5 In",
                          fw: FontWeight.bold,
                          color: size1 ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        size2 = true;
                        allSize = size1 = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: size2 ? AppTheme.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextComponents(
                          txt: "10 In",
                          fw: FontWeight.bold,
                          color: size2 ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            TextComponents(txt: "Price", fw: FontWeight.bold, txtSize: 18.sp),

            Slider(
              min: 0,
              max: 100,
              divisions: 2,
              label: valeurActuelle.round().toString(),

              value: valeurActuelle,
              onChanged: (value) {
                setState(() {
                  valeurActuelle = value;
                });
              },
            ),

            TextComponents(
              txt: "Select Color",
              fw: FontWeight.bold,
              txtSize: 18.sp,
            ),
            SizedBox(height: 10.h),

            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.brown, radius: 15.r),
                SizedBox(width: 10.w),

                CircleAvatar(backgroundColor: Colors.grey, radius: 15.r),
                SizedBox(width: 10.w),

                CircleAvatar(backgroundColor: Colors.blue, radius: 15.r),
                SizedBox(width: 10.w),

                CircleAvatar(backgroundColor: Colors.green, radius: 15.r),
                SizedBox(width: 10.w),

                CircleAvatar(backgroundColor: Colors.orange, radius: 15.r),
                SizedBox(width: 10.w),

                CircleAvatar(backgroundColor: Colors.red, radius: 15.r),
              ],
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {},
              child: ButtonComponents(
                txtButton: "Filter Now",
                buttonColor: AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
