import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  static const createTime = 'createTime';

}

class Todo{
  DateTime createTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    required this.createTime,
    required this.title,
    this.description = '',
    this.id = '',
    this.isDone = false,
  });
}