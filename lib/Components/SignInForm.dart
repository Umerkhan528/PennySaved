import 'package:flutter/material.dart';
import 'package:penny/Components/Button.dart';
import 'package:penny/Components/TextField.dart';

class SignInForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _emailController,
          hintText: "Email Address",
          labelText: 'Email Address',
        ),
        const CustomTextField(
          hintText: "Password",
          isPassword: true,
          labelText: 'Password',
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(value: true, onChanged: (val) {}),
              const Text(
                "Remember Me",
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?",
                    style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
        CustomButton(
          name: "Sign In",
          onPress: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sign-In Successful!")),
              );
            }
          },
        ),
      ],
    );
  }
}
