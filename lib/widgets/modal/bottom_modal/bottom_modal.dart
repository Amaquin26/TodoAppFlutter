import 'package:flutter/material.dart';
import 'package:todo_app_flutter/widgets/modal/base_bottom_sheet_modal.dart';
import 'package:go_router/go_router.dart';

class BottomModal extends StatefulWidget {
  final String title;
  final String textInputTitle;
  final String onPressButtonTitle;
  final Function(String) onPress;
  final String? initTextValue;

  const BottomModal({
    super.key,
    required this.title,
    required this.onPressButtonTitle,
    required this.textInputTitle,
    required this.onPress,
    this.initTextValue,
  });

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.initTextValue != null) {
      _textController.text = widget.initTextValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheetModal(
      title: widget.title,
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            labelText: widget.textInputTitle,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  context.pop();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Cancel'),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () => widget.onPress(_textController.text),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(widget.onPressButtonTitle),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
