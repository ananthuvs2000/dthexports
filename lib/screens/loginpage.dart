import 'package:dth/screens/dashboard.dart';
import 'package:dth/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginPg extends StatelessWidget {
  LoginPg({super.key, });
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  // final _formKey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.fitHeight, image: AssetImage('assets/images/logpage.jpg')),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 450,right: 25,left: 25),
                  child: Form(
                    // key: _formKey,
                    child: Column(
                      children: [
                        BuildTextformField(icon: Icon(Icons.email_outlined), text: 'Username'),
                        SizedBox(height: 20,),
                        BuildTextformField(icon: Icon(Icons.lock_open_rounded), text: 'Password'),
                        SizedBox(height: 20,),
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo.shade700),
                          textStyle:MaterialStateProperty.all<TextStyle>(
                                  TextStyle(fontSize: 20,),
                                ), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                          ),
                          onPressed: () {
                          Get.to(HomePage());
                       
                        }, child:Text("LOGIN",style: TextStyle(color: Colors.white),),),
                      TextButton(onPressed: () {
                          
                        }, child: Text("Forgot Password",style: TextStyle(fontSize: 16),)),
                        SizedBox(height: 45,),
                        
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Create an account ", style: TextStyle(color: Colors.black,fontSize: 16,fontWeight:FontWeight.w500),),
                            TextButton(onPressed: () {
                             
                            }, child: Text("Signup",style: TextStyle(fontSize: 16,),),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}