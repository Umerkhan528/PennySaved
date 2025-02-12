import 'package:flutter/material.dart';
import 'package:penny/Components/logo.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  final String balance = "\$78,450";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                const Logo(),
                Text(
                  balance,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Hello , Hazem",
                  style: TextStyle(
                      font: 13,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Montserrat"),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
