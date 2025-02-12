import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:scanner/widgets/custom_appbar.dart';

class OtpPass extends StatefulWidget {
  const OtpPass({super.key});

  @override
  State<OtpPass> createState() => _OtpPassState();
}

class _OtpPassState extends State<OtpPass> {

  // ignore: prefer_typing_uninitialized_variables
  var counterdecreasing;
  String countdown = "10";
  bool allow=true;

  void secondcounter(){
    allow=false;
    counterdecreasing=10;
    Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        countdown=counterdecreasing.toString();
      });
      counterdecreasing--;
      if(counterdecreasing<=-1){
        setState(() {
          allow=true;
        });
        timer.cancel();
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          color: Colors.black,
          leading: IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/appbar/appbar_arrow.png")),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
            child: SizedBox(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Forget Password",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Image.asset("assets/images/forget_password/forget.png"),
                    const SizedBox(height: 30),
                    const Text(
                        "We have sent the OTP code to your email address. Enter here.",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 20,
                    ),
                    OtpTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.deny('.'),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      alignment: Alignment.center,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      cursorColor: Colors.white,
                      fieldHeight: 49,
                      autoFocus: false,
                      fieldWidth: 60,
                      borderWidth: 1,
                      showFieldAsBox: true,
                      borderColor: Colors.grey,
                      enabledBorderColor: Colors.grey,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      focusedBorderColor:
                          const Color.fromARGB(255, 80, 180, 152),
                      borderRadius: BorderRadius.circular(5),
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      contentPadding: const EdgeInsets.only(bottom: 2),
                    ),
                    const SizedBox(height: 100),
                    SizedBox(child: allow ? InkWell(onDoubleTap: secondcounter,onTap: secondcounter,child: const Text("Resend an OTP!",style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400), ),) :
                    RichText(
                        text: TextSpan(
                            text: "You can resend code in",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(
                            text:" $countdown",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 80, 180, 152)),
                          ),
                          const TextSpan(
                            text: " s",
                            style: TextStyle(color: Colors.white),
                          )
                        ])
                        )
                        ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(79, 113, 151, 1),
                              Color.fromRGBO(28, 245, 176, 1),
                            ]),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: OutlinedButton(
                          onPressed:(){},
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: const BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Padding(
                            padding: EdgeInsets.all(13),
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}