import 'package:flutter/material.dart';
import 'package:todo_app_flutter/widgets/card/base_card_widget.dart';

class SubtaskCardWidget extends StatelessWidget {
  final String name;

  const SubtaskCardWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(
      child: CheckboxListTile(
        title: Text('Subtask $name'),
        value: false,
        onChanged: (bool? value) {},
      ),
    );
  }
}
