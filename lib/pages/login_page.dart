import 'package:flutter/material.dart';
import 'package:hivechat/services/auth/auth_service.dart';
import 'package:hivechat/components/my_button.dart';
import 'package:hivechat/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //tap to go to register page

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    //get auth service
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }

    //catch any errors
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
            Image.asset(
              "lib/images/HiveChat1.png",
              scale: 4.0,
            ),
            // Icon(
            //   Icons.message,
            //   size: 60,
            //   color: Theme.of(context).colorScheme.primary,
            // ),

            const SizedBox(height: 50),
            //welcome back msg

            Text(
              "Welcome back, you have been missed",
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
              focusNode: FocusNode(), //this is not correct
            ),

            const SizedBox(height: 25),

            //login button

            MyButton(
              text: "Login Here",
              onTap: () => login(context),
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now.. ",
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
