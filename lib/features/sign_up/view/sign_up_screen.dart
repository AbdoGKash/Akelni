// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/sign_up_cubit.dart';
import 'widget/already_have_account_text.dart';
import 'widget/sign_up_form.dart';
import 'widget/sign_up_listner.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Create Account",
              style: TextStyles.font32primaryBold,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
              style: TextStyles.font14Gray200,
            ),
            const SizedBox(
              height: 40,
            ),
            SignUpForm(),
            const SizedBox(
              height: 50,
            ),
            AppTextButton(
              buttonText: 'Create Account',
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                context.read<SignUpCubit>().validateThenDoSignUp();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            AlreadyHaveAccountText(),
            SignUpListner()
          ]),
        ),
      ),
    ));
  }
}
