import 'package:flutter/material.dart';
import 'package:flutter_chat_project/services/auth/auth_service.dart';
import 'package:flutter_chat_project/components/my_button.dart';
import 'package:flutter_chat_project/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap,
  });

  //Login Function
  void logIn(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),

            //welcome back msg
            Text(
              "Welcome Back, You've been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //email
            MyTextfield(
              hintText: "Enter Your Email",
              hideText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            //password
            MyTextfield(
              hintText: "Enter Your Password",
              hideText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 25,
            ),
            //login button
            MyButton(
              buttonText: "LogIn",
              onTap: () => logIn(context),
            ),
            const SizedBox(
              height: 25,
            ),
            //register now navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
