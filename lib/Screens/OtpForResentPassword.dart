import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:penny/Components/OtpForm.dart';

class ResetPasswordOtp extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ResetPasswordOtp());
  const ResetPasswordOtp({super.key});

  @override
  State<ResetPasswordOtp> createState() => _ResetPasswordOtpState();
}

class _ResetPasswordOtpState extends State<ResetPasswordOtp> {
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Verification Code",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(133, 187, 101, 1)),
                            ),
                            const Text(
                              "We have sent the verification code to your email address.",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const OtpForm()
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
