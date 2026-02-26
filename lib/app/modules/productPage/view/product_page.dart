import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../../components/text_components.dart';
import '../../filter/view/filter.dart';
import '../controller/controller.dart';
import '../../../panier/view/panier.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    color: AppTheme.grey1,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search, size: 30),
                      hintText: "Search your product",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Bold",
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pannier()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: AppTheme.grey1,
                    radius: 30.r,
                    child: Center(
                      child: Icon(Icons.shopping_bag_outlined, size: 30),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMan = true;
                          isKids = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        height: 40,
                        decoration: BoxDecoration(
                          color: isMan ? AppTheme.primaryColor : Colors.white,
                          border: Border.all(color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Center(
                          child: TextComponents(
                            txt: "Man",
                            fw: FontWeight.bold,
                            color: isMan ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMan = false;
                          isKids = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        height: 40,
                        decoration: BoxDecoration(
                          color: isKids ? AppTheme.primaryColor : Colors.white,
                          border: Border.all(color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Center(
                          child: TextComponents(
                            txt: "Kids",
                            fw: FontWeight.bold,
                            color: isKids ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Filter()),
                    );
                  },
                  child: Icon(Icons.menu, size: 35),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppTheme.grey2,
                borderRadius: BorderRadius.circular(20.r),
                // image: DecorationImage(
                //   image: AssetImage("assets/images/logo.png"),
                // ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextComponents(
                  txt: "categories",
                  fw: FontWeight.bold,
                  txtSize: 17,
                ),
                TextComponents(
                  txt: "See all ",
                  fw: FontWeight.bold,
                  color: AppTheme.primaryColor,
                  txtSize: 17,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategorieBox("T-Shirt", context),
                  CategorieBox("Jeans", context),
                  CategorieBox("Shoes", context),
                  CategorieBox("Panjama", context),
                  CategorieBox("Whatch", context),
                  CategorieBox("Whatch", context),
                  CategorieBox("Whatch", context),
                  CategorieBox("Whatch", context),
                  CategorieBox("Whatch", context),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextComponents(txt: "All Product", fw: FontWeight.bold),
              ],
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  child: ProductBox(
                    "Panjabi",
                    "13 Reviews",
                    "Tk 1500",
                    "TKP1900",
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
