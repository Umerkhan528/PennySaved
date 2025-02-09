// Sign Up Form
import 'package:flutter/material.dart';
import 'package:penny/Components/Button.dart';
import 'package:penny/Components/TextField.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  late bool isVisible = false;

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
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          controller: _emailController,
          validator: _validateEmail,
          hintText: "Email Address",
          labelText: 'Email Address',
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: screenWidth * 0.5,
            child: const CustomTextField(
              hintText: "First Name",
              labelText: 'First Name',
            ),
          ),
          SizedBox(
            width: screenWidth * 0.5,
            child: const CustomTextField(
              hintText: "Last Name",
              labelText: 'Last Name',
            ),
          ),
        ]),
        const CustomTextField(
          hintText: "Password",
          isPassword: true,
          labelText: 'Password',
        ),
        CustomTextField(
          hintText: "Password Confirmation",
          isPassword: true,
          labelText: 'Password Confirmation',
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
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Checkbox(value: true, onChanged: (val) {}),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  children: [
                    const TextSpan(text: "I agree to the "),
                    WidgetSpan(
                      child: GestureDetector(
                        child: const Text(
                          "terms and conditions policy",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.green,
                              decorationThickness: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          name: "Sign Up",
          onPress: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sign-up Successful!")),
              );
            }
          },
        ),
      ],
    );
  }
}
