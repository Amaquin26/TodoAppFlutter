import 'package:flutter/material.dart';

class PageLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const PageLoader({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : child;
  }
}
