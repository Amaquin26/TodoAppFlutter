import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const BottomNavigationWidget({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabSelected, // callback function
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      ],
      selectedItemColor: Theme.of(context).colorScheme.primary,
    );
  }
}
