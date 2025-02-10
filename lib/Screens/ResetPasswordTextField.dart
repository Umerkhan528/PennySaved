import 'package:flutter/material.dart';
import 'package:penny/Components/EnterPhoneNumber.dart';

class ResetPasswordTextField extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ResetPasswordTextField());
  const ResetPasswordTextField({super.key});

  @override
  State<ResetPasswordTextField> createState() => _ResetPasswordTextFieldState();
}

class _ResetPasswordTextFieldState extends State<ResetPasswordTextField> {
  bool isPhoneSelected = true; // Track selected option

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents UI from moving up
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.4,
                        width: screenWidth,
                        child: Center(
                            child: Image.asset("assets/images/L-Lock.png")),
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.8,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Did you forget your password?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(133, 187, 101, 1)),
                            ),
                            Text(
                              "We will send you an OTP through your email or phone number to get it back.",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      // Conditional Form Based on Selection
                      NewPhoneEnterForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
