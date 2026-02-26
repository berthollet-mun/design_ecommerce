import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/theme.dart';
import '../../../components/button_components.dart';
import '../../../components/text_components.dart';
import '../../welcome/view/welcome.dart';

class ChangeState extends StatefulWidget {
  const ChangeState({super.key});

  @override
  State<ChangeState> createState() => _ChangeStateState();
}

class _ChangeStateState extends State<ChangeState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 150),
              SizedBox(height: 20),
              TextComponents(
                txt: "Congratulations !",
                fw: FontWeight.bold,
                txtSize: 28,
              ),
              TextComponents(
                txt: "Your account has been successfuly\ncreated",
                txtSize: 20,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
                child: ButtonComponents(
                  txtButton: "Continue Shopping",
                  buttonColor: AppTheme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
