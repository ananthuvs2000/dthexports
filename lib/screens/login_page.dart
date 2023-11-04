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
  // final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            'assets/images/logpage.jpg',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 400, right: 25, left: 25),
              child: Form(
                // key: _formKey,
                child: ListView(
                  // shrinkWrap: true,
                  children: [
                    BuildTextformField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (val) {
                        return '';
                      },
                      icon: const Icon(Icons.email_outlined),
                      text: 'Email Address',
                    ),
                    hSpace(20),
                    BuildTextformField(
                      isPassword: true,
                      validator: (val) {
                        return '';
                      },
                      controller: _passwordController,
                      icon: const Icon(Icons.lock_open_rounded),
                      text: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimaryElevatedButton(
                        onPressed: () {
                          Get.to(
                            const HomePage(),
                            transition: Transition.downToUp,
                            curve: Curves.easeInOut,
                          );
                        },
                        label: 'LOGIN'),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password",
                          style: TextStyles.labelStyle,
                        )),
                    hSpace(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyles.labelStyle,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Signup",
                            style: TextStyles.labelStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
