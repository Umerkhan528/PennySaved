// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        controller: controller,
        validator: validator,
        key: key,
        obscureText: isPassword,
        decoration: InputDecoration(
          label: Text(labelText),
          hintText: hintText,
          filled: true,
          fillColor: Colors.transparent,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(153, 156, 166, 1),
                style: BorderStyle.solid,
                width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
