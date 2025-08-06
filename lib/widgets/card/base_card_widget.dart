import 'package:flutter/material.dart';

class BaseCardWidget extends StatelessWidget {
  final Widget child;

  const BaseCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: child,
    );
  }
}
