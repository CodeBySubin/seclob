import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seclob/features/authentication/presentation/view/widgets/login_form.dart';
import 'package:seclob/features/authentication/presentation/view/widgets/login_header.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeader(),
            SizedBox(height: 20.h),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
