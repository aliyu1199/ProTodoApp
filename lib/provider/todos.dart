import 'package:flutter/material.dart';
import 'package:pro_todo/models/todos.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createTime: DateTime.now(),
      title: 'Buy Food 😋',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Todo(
      createTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Todo(
      createTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
      description: '''- Go out in the morning
- Around 6am
- Give dog food before going out
- Return before 9am
      '''
    ),
    Todo(
      createTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
      description: '''-Do a suprice birthday
- It should be before he return from work
- Make chops and cake available 
- Leave before 6pm'''
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo){
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description){

    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}