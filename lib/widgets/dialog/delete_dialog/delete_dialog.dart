import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressedCancel;
  final VoidCallback onPressedDelete;

  const DeleteDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onPressedCancel,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.primary,
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: onPressedCancel,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Cancel'),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: onPressedDelete,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Delete'),
          ),
        ),
      ],
    );
  }
}
