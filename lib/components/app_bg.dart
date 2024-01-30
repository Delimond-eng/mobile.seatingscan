import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final double? opacity;
  const AppBackground({super.key, required this.child, this.opacity = .8});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/shape-bg-1.jpg"),
          fit: BoxFit.cover,
          alignment: Alignment.centerLeft,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF141414).withOpacity(opacity!),
        ),
        child: child,
      ),
    );
  }
}
