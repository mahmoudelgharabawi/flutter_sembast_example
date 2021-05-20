import 'package:flutter/material.dart';
import 'package:flutter_sembast_example/models/tassk.dart';

class TaskAdd extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  _onSubmittedHandler(BuildContext context) {
    String value = _controller.text.trim();
    if (value.length == 0) {
      Navigator.of(context).pop();
    } else {
      Task task = Task(name: value);
      Navigator.of(context).pop(task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      autofocus: true,
      enableSuggestions: true,
      textCapitalization: TextCapitalization.sentences,
      controller: _controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.send,
      onSubmitted: (_) => _onSubmittedHandler(context),
      decoration: InputDecoration(
          labelText: "Task", prefixIcon: Icon(Icons.assignment)),
    );
  }
}
