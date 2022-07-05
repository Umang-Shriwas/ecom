import 'package:ecom/Screens/homescreen.dart';
import 'package:ecom/Screens/register.dart';
import 'package:ecom/constants/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.deepOrange,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 44,
          ),
          Text(
            "Sign UP",
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
          SizedBox(
            height: 58.h,
          ),
          Container(
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.r),
                  topRight: Radius.circular(22.r)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Welcome Buddy!",
                      style: TextStyle(
                          fontSize: 22.sp, color: AppColor.deepOrange),
                    ),
                    Text(
                      "Glad to see you my buddy.",
                      style: TextStyle(fontSize: 11.sp, color: Colors.black26),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        // icon: Container(child: Icon(Icons.email_outlined)),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: 'password',
                          suffixIcon: _obscureText == true
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    size: 20.w,
                                  ))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.visibility_off,
                                    size: 20.w,
                                  ))),
                    ),
                    SizedBox(
                      height: 44.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.deepOrange),
                        onPressed: () {
                          signup();
                        },
                        child: Text("Sign Up")),
                    Row(
                      children: [
                        Text("does not hane a account click here?:-"),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text("Sign in",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColor.deepOrange)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  void signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      var userCredential = credential.user;
      if (userCredential!.uid.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterScreen(),
            ));
      } else {
        Fluttertoast.showToast(msg: "Something Went Wrong");
        // print("something went wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print("something went wrong1");

        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
        // print("something went wrong2");
      }
    } catch (e) {
      print(e);
    }
  }
}
