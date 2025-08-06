import 'package:flutter/material.dart';
import 'package:todo_app_flutter/api_service/todo_subtask/todo_subtask_service.dart';
import 'package:todo_app_flutter/widgets/card/base_card_widget.dart';

class SubtaskCardWidget extends StatefulWidget {
  final int id;
  final String name;
  final bool isChecked;

  const SubtaskCardWidget({
    super.key,
    required this.id,
    required this.name,
    required this.isChecked,
  });

  @override
  State<SubtaskCardWidget> createState() => _SubtaskCardWidgetState();
}

class _SubtaskCardWidgetState extends State<SubtaskCardWidget> {
  final TodoSubtaskService _todoSubtaskService = TodoSubtaskService();

  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  Future<void> _toggleCheckStatus(bool? value) async {
    try {
      final newStatus = await _todoSubtaskService.toggleTodoSubtaskCheckStatus(
        widget.id,
      );
      setState(() {
        _isChecked = newStatus;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return BaseCardWidget(
      child: CheckboxListTile(
        title: Text(widget.name),
        value: _isChecked,
        onChanged: _toggleCheckStatus,
      ),
    );
  }
}
