import 'package:flutter/material.dart';

import '../screens/starter.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        primarySwatch: Colors.pink,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFF0E1D3E),
      ),
      home: const Starter(),
    );
  }
}
