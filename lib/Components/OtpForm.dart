import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:penny/Components/Button.dart';
import 'package:penny/Components/TextField.dart';
import 'package:penny/Screens/ResetPasswordTextField.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  var counterdecreasing;
  String countdown = "59";
  bool allow = true;

  void secondcounter() {
    allow = false;
    counterdecreasing = 59;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown = counterdecreasing.toString();
      });
      counterdecreasing--;
      if (counterdecreasing <= -1) {
        setState(() {
          allow = true;
        });
        timer.cancel();
      }
    });
  }

  final TextEditingController _emailController = TextEditingController();
  bool isVisible = false;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Phone Number";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid Phone Number.";
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: screenHeight * 0.43,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    OtpTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.deny('.'),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      numberOfFields: 5,
                      borderWidth: 1,
                      fieldHeight: 49,
                      autoFocus: false,
                      fieldWidth: 50,
                      showFieldAsBox: true,
                      fillColor: const Color.fromRGBO(133, 187, 101, 1),
                      focusedBorderColor:
                          const Color.fromRGBO(133, 187, 101, 1),
                      borderColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      contentPadding: const EdgeInsets.only(bottom: 2),
                    ),
                    Text("Didn’t receive your code?"),
                    SizedBox(
                        child: allow
                            ? InkWell(
                                onDoubleTap: secondcounter,
                                onTap: secondcounter,
                                child: const Text(
                                  "Resend an OTP!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            : RichText(
                                text: TextSpan(
                                    text: "Resend code in ",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    children: [
                                    TextSpan(
                                      text: "00:$countdown",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.green,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.green,
                                          decorationThickness: 1.5),
                                    ),
                                  ]))),
                  ],
                ),
              ),
              CustomButton(
                name: "Confirm",
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context, ResetPasswordTextField.route());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Otp Send Successfully!")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
