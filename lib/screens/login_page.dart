import 'package:dth/screens/home_page.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/theme/text_sizing.dart';
import 'package:dth/_common_widgets/primary_elevated_button.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_common_widgets/textformfield.dart';
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/loginbg.png',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX + 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hSpace(200),
                  Image.asset(
                    'assets/images/appbar.jpg',
                    fit: BoxFit.contain,
                    width: 100.h,
                  ),
                  hSpace(75),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (val) {
                      if (val == '') {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    icon: const Icon(
                      Icons.mail_outline_rounded,
                      size: 22,
                    ),
                    hint: 'Email Address',
                  ),
                  hSpace(15),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    validator: (val) {
                      if (val == '') {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      size: 22,
                    ),
                    hint: 'Password',
                  ),
                  hSpace(15),
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
                      label: 'Login',
                    ),
                  ),
                  hSpace(15),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyles.textButtonLabelStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
