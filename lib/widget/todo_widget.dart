import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pro_todo/models/todos.dart';
import 'package:pro_todo/provider/todos.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? Key,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            key: Key(todo.id),
            actions: [
              IconSlideAction(
                  caption: 'Edit',
                  icon: Icons.edit,
                  color: Colors.green,
                  onTap: () {}
              )
            ],
            secondaryActions: [
              IconSlideAction(
                color: Colors.red,
                onTap: () => deleteTodo(context, todo),
                caption: 'Delete',
                icon: Icons.delete,
              )
            ],

            child: buildTodo(context)
        ),
      );

  Widget buildTodo(BuildContext context) =>
      Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              value: todo.isDone,
              activeColor: Theme
                  .of(context)
                  .primaryColor,
              checkColor: Colors.white,
              onChanged: (_) {
                final provider = Provider.of<TodosProvider>(
                    context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);

                Utils.showSnackBar(
                  context,
                  isDone ? 'Task Completed' : 'Task marked incomplete',

                );
              },
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  if (todo.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);

    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Delete the task');
  }
}