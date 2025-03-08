import 'package:flutter/material.dart';
import 'package:penny/Screens/mainScreen/Screens/Account/Account.dart';
import 'package:penny/Screens/mainScreen/Screens/ContactSupport/ContactSupport.dart';
import 'package:penny/Screens/mainScreen/Screens/Enable2FA/Enable2FA.dart';
import 'package:penny/Screens/mainScreen/Screens/Settings/Settings.dart';
import 'package:penny/Screens/mainScreen/Screens/Wallet/AddFunds/AddFund.dart';
import 'package:penny/Screens/mainScreen/index.dart';
import 'package:penny/Screens/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(
            22, 22, 33, 1), // Sets the overall background color
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(22, 22, 33, 1),
          // ignore: deprecated_member_use
          background: const Color.fromRGBO(
              22, 22, 33, 1), // Ensures background color consistency
        ),
        useMaterial3: true,
      ),
      home: const Signup(),
    );
  }
}
