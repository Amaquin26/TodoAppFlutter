import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChevronAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPress;
  final List<Widget>? actions;

  const ChevronAppBar({
    super.key,
    required this.title,
    this.onPress,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(fontSize: 16.0)),
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: onPress ?? () => context.pop(),
      ),
      centerTitle: true,
      actions: [...actions ?? []],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
