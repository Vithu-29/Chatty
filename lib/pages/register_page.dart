import 'package:flutter/material.dart';
import 'package:flutter_chat_project/services/auth/auth_service.dart';
import 'package:flutter_chat_project/components/my_button.dart';
import 'package:flutter_chat_project/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  //Register Method
  void register(BuildContext context) {
    final auth = AuthService();

    if (_passwordController.text == _confirmPwController.text) {
      try {
        auth.signUpWithEmailPassword(
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
    } else {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords Don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),

            //create account msg
            Text(
              "Let's Create Account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            MyTextfield(
                hintText: "Enter Your Email",
                hideText: false,
                controller: _emailController),
            const SizedBox(
              height: 10,
            ),

            MyTextfield(
                hintText: "Enter Password",
                hideText: true,
                controller: _passwordController),
            const SizedBox(
              height: 10,
            ),

            MyTextfield(
                hintText: "Confirm Password",
                hideText: true,
                controller: _confirmPwController),
            const SizedBox(
              height: 25,
            ),

            MyButton(
              buttonText: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
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
                    "LogIn now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
