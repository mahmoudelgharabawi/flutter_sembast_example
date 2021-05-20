import 'package:flutter/material.dart';
import 'package:flutter_sembast_example/databases/task_store.dart';
import 'package:flutter_sembast_example/models/tassk.dart';

class TaskDelete extends StatelessWidget {
  final TaskStore taskStore = TaskStore();
  final Widget child;
  final Task task;

  TaskDelete({this.task, this.child});

  Widget _getBackground() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 16),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Future<bool> _confirmDismissHandler(
      BuildContext context, DismissDirection direction) async {
    final bool answer = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Do You Really Want to remove this task?"),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                "Delete",
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    return answer;
  }

  _onDismissedHandler(DismissDirection direction) {
    taskStore.delete(task);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        return _confirmDismissHandler(context, direction);
      },
      direction: DismissDirection.endToStart,
      onDismissed: _onDismissedHandler,
      background: _getBackground(),
      key: Key(task.key.toString()),
      child: child,
    );
  }
}
