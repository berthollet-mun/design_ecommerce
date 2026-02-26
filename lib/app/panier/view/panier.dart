import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../components/button_components.dart';
import '../../components/space.dart';
import '../../components/text_components.dart';
import '../../modules/checkout/view/checkout.dart';
import '../controller/controller.dart';

class Pannier extends StatefulWidget {
  const Pannier({super.key});

  @override
  State<Pannier> createState() => _PannierState();
}

class _PannierState extends State<Pannier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextComponents(txt: "My Cart", fw: FontWeight.bold, txtSize: 18),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: homeBg,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.shopping_cart, size: 30),
              ),
              Positioned(
                right: 2,
                top: 0,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextComponents(
                      txt: "3",
                      color: Colors.white,
                      txtSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
          w(10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomProductBox(
              "Man's T-Shirt",
              "Classic Crew neck\ndesing",
              "Tk 600",
            ),
            CustomProductBox(
              "Man's Jeans",
              "Classic Crew neck\ndesing",
              "Tk 900",
            ),
            CustomProductBox(
              "Kids Shoes",
              "Classic Crew neck\ndesing",
              "Tk 800",
            ),

            h(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextComponents(txt: "Sub Total :", fw: FontWeight.bold),
                TextComponents(txt: "Tk 2300", fw: FontWeight.bold),
              ],
            ),
            h(10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkout()),
                );
              },
              child: ButtonComponents(
                txtButton: "Checkout",
                buttonColor: mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
