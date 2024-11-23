import 'package:ecom_t/common/utils/kcolors.dart';
import 'package:ecom_t/common/widgets/app_style.dart';
import 'package:ecom_t/common/widgets/back_button.dart';
import 'package:ecom_t/common/widgets/custom_button.dart';
import 'package:ecom_t/common/widgets/email_textfield.dart';
import 'package:ecom_t/common/widgets/password_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final FocusNode _passwordNode = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: const Text('Login'),
        elevation: 0,
        leading: AppBackButton(
          onTap: () {
            context.go('/home');
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 160.h),
          Text(
            "IB Fashions",
            textAlign: TextAlign.center,
            style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "Hi! Welcome back. you have   been missed",
            textAlign: TextAlign.center,
            style: appStyle(13, Kolors.kPrimary, FontWeight.normal),
          ),
          SizedBox(height: 25.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  EmailTextField(
                    radius: 25,
                    focusNode: _passwordNode,
                    hintText: "Username",
                    controller: _usernameController,
                    prefixIcon: const Icon(
                      CupertinoIcons.profile_circled,
                      size: 20,
                      color: Kolors.kGray,
                    ),
                    keyboardType: TextInputType.name,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_passwordNode);
                    },
                  ),
                  SizedBox(height: 25.h),
                  PasswordField(
                    controller: _passwordController,
                    focusNode: _passwordNode,
                    radius: 25,
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    onTap: () {},
                    text: "L O G I N",
                    btnWidth: ScreenUtil().screenWidth,
                    btnHieght: 40,
                    radius: 20,
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 130.h,
        child: Center(
            child: GestureDetector(
          onTap: () {
            context.push('/register');
          },
          child: Text(
            "Don't have an account? Sign up",
            textAlign: TextAlign.center,
            style: appStyle(13, Kolors.kPrimary, FontWeight.normal),
          ),
        )),
      ),
    );
  }
}
