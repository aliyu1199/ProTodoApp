import 'package:flutter/material.dart';
import 'package:pro_todo/provider/todos.dart';
import 'package:pro_todo/widget/todo_widget.dart';
import 'package:provider/provider.dart';

class CompletedListWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;


    return todos.isEmpty
        ? Center(
      child: Text(
        'There is No Completed Task',
        style: TextStyle(fontSize: 20),
      ),
    )
        : ListView.separated(
      separatorBuilder: (context, index) => Container(height: 8),
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return TodoWidget(todo: todo);
      },
    );
  }
}