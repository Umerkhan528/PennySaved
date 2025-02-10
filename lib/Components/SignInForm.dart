import 'package:flutter/material.dart';
import 'package:penny/Components/Button.dart';
import 'package:penny/Components/TextField.dart';
import 'package:penny/Screens/ResetPassword.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  bool isVisible = false;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  void setVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            hintText: "Email Address",
            labelText: 'Email Address',
            validator: _validateEmail,
          ),
          CustomTextField(
            hintText: "Password",
            isPassword: isVisible,
            labelText: 'Password',
            suffixIcon: isVisible
                ? IconButton(
                    icon: const Icon(Icons.visibility_off_outlined),
                    onPressed: () {
                      setVisibility();
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.visibility_outlined),
                    onPressed: () {
                      setVisibility();
                    },
                  ),
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
                  onPressed: () {
                    Navigator.push(context, ResetPassword.route());
                  },
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
                  const SnackBar(content: Text("Sign-up Successful!")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
