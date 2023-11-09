import 'package:dth/screens/home_page.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/widgets/primary_elevated_button.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPg extends StatelessWidget {
  LoginPg({
    super.key,
  });
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX + 12.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                // shrinkWrap: true,
                children: [
                  hSpace(180),
                  Image.asset(
                    'assets/images/appbar.jpg',
                    fit: BoxFit.contain,
                    width: 200.h,
                  ),
                  hSpace(25),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (val) {
                      if (val == '') {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    icon: const Icon(Icons.email_outlined),
                    text: 'Email Address',
                  ),
                  hSpace(20),
                  CustomTextFormField(
                    isPassword: true,
                    validator: (val) {
                      if (val == '') {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    icon: const Icon(Icons.lock_open_rounded),
                    text: 'Password',
                  ),
                  hSpace(20),
                  SizedBox(
                    width: 150.w,
                    child: PrimaryElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _emailController.clear();
                          _passwordController.clear();
                          Get.to(
                            const HomePage(),
                            transition: Transition.downToUp,
                            curve: Curves.easeInOut,
                          );
                        } else {
                          print('Form Invalid');
                        }
                      },
                      label: 'LOGIN',
                    ),
                  ),
                  hSpace(15),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyles.textButtonLabelStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
