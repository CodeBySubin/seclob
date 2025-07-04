import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seclob/core/constants/constants.dart';
import 'package:seclob/core/utils/util.dart';
import 'package:seclob/core/widgets/widgets.dart';
import 'package:seclob/features/authentication/presentation/viewmodel/login_viewmodel.dart';

import '../../../../../core/routes/routes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Form(
      key: _formKey,
      child: Container(
        height: 0.62.sh,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: emailController,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset(AppIcons.emailIcon),
                    ),
                    hintText: AppStrings.enterEmail,
                    hintStyle: AppStyle.hintext,
                    validator: (value) => Validator.validateEmail(value!),
                  ),
                  SizedBox(height: 20.h),
                  TextFieldWidget(
                    controller: passwordController,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset(AppIcons.passwordIcon),
                    ),
                    hintText: AppStrings.enterpassword,
                    hintStyle: AppStyle.hintext,
                    validator: (value) => Validator.validatePassword(value!),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.forgotpassword,
                        style: AppStyle.bodySmallCentered,
                      ),
                    ),
                  ),
                  textButton(
                    size: Size(double.infinity, 60.h),
                    text: AppStrings.login,
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder:
                            (_) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                      );

                      bool isSuccess = await viewModel.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );

                      if (mounted) Navigator.of(context).pop();
                      if (isSuccess && mounted) {
                        context.go(AppRoutes.home);
                      }
                    },
                  ),
                ],
              ),
            ),

            Text(
              "Or Log in with",
              style: AppStyle.simpleGrey,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.googleIcon),
                SizedBox(width: 25.w),
                SvgPicture.asset(AppIcons.facbookIcon),
                SizedBox(width: 25.w),
                SvgPicture.asset(AppIcons.appleIcon),
              ],
            ),
            SizedBox(height: 12.h),
            Text(AppStrings.donthaveAccount, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
