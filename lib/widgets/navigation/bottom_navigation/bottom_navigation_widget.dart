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
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Tasks'),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_turned_in),
          label: 'Completed ',
        ),
      ],
      selectedItemColor: Theme.of(context).colorScheme.primary,
    );
  }
}
