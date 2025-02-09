import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name, required this.onPress});

  final String name;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Expanded(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(133, 187, 101, 1),
                Color.fromRGBO(238, 195, 88, 1)
              ]),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
