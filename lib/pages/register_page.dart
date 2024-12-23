import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hivechat/services/auth/auth_service.dart';
import 'package:hivechat/components/my_button.dart';
import 'package:hivechat/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  //email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  //tap to go to register page

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //register function
  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();

    //password match -> create new user
    if (_passwordController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    //passwords don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset("lib/images/HiveChat1.png",scale: 4.0,)
            ,
            // Icon(
            //   Icons.message,
            //   size: 60,
            //   color: Theme.of(context).colorScheme.primary,
            //),

            const SizedBox(height: 50),
            //welcome back msg

            Text(
              "Let's create an account for you!! ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            //pw textfield
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController, 
              focusNode: FocusNode(),  //this is not correct
            ),

            const SizedBox(height: 10),

            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
              focusNode: FocusNode(),  //this is not correct
            ),

            const SizedBox(height: 10),

            //confrim password
            MyTextfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller:
                  _confirmPwController,
                  focusNode: FocusNode(),  //this is not correct
            ),

            const SizedBox(height: 25),

            //login button

            MyButton(
              text: "Register here",
              onTap: () => register(context), //why am I facing error over here
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now.. ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
