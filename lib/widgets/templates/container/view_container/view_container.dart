import 'package:flutter/material.dart';

class ViewContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const ViewContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}
