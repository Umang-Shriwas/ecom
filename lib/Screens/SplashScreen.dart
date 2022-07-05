import 'dart:async';

import 'package:ecom/Screens/signupscreen.dart';
import 'package:ecom/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    Timer(
      const Duration(seconds: 3),
      (()=>Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SignUpScreen(),
      )
      )));
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.deepOrange,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
    
            children: [
              const SizedBox(
                height: 250,
              ),
              Text(
                'E-com',style: TextStyle(color: Colors.white,fontSize: 44.sp, fontWeight: FontWeight.bold),
              ),
            const SizedBox(
              height: 270,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            
            ],
          ),
        ),
      ),
    );
  }
}