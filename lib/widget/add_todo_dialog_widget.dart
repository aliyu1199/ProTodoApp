import 'package:flutter/material.dart';
import 'package:pro_todo/models/todos.dart';
import 'package:pro_todo/provider/todos.dart';
import 'package:provider/provider.dart';
import 'add_todo_form_widget.dart';


class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height*.45,
        width: MediaQuery.of(context).size.width*.7,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Add Todo',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              TodoFormWidget(
                  onChangedTitle: (title) => setState(() => this.title = title),
                  onChangedDescription: (description) => setState(() => this.description = description),
                  onSavedTodo: addTodo,
              ),
            ],
          ),
        ),
      ),
    );
  }

  addTodo() {
    final isValid = _formKey.currentState?.validate();

    if (isValid == null) {
      return;
    }else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}