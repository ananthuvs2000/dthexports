import 'package:dth/screens/home_page.dart';
import 'package:dth/theme/layout.dart';
import 'package:dth/widgets/primaryElevatedButton.dart';
import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/textformfield.dart';
import 'package:flutter/material.dart';
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
          padding: EdgeInsets.symmetric(horizontal: PageLayout.pagePaddingX),
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
                    width: 200,
                  ),
                  hSpace(50),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (val) {
                      if (val == '') {
                        return 'Invalid Email';
                      }
                      return '';
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
                      return '';
                    },
                    controller: _passwordController,
                    icon: const Icon(Icons.lock_open_rounded),
                    text: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: PrimaryElevatedButton(
                      onPressed: () {
                        // _formKey.currentState!.validate();
                        Get.to(
                          const HomePage(),
                          transition: Transition.downToUp,
                          curve: Curves.easeInOut,
                        );
                      },
                      label: 'LOGIN',
                    ),
                  ),
                  hSpace(15),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyles.labelStyle,
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
