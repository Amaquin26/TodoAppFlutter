import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(height: 16.0),
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
                    Navigator.pop(context);
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
      ),
    );
  }
}
